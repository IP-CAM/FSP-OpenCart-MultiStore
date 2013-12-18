<?php

class ControllerModuleFilterPro extends Controller {

    private $error = array();

    public function index() {

        $this->load->language('module/filterpro');
        $this->load->model('module/filterpro');

        $this->document->setTitle(strip_tags($this->language->get('heading_title')));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (VERSION == '1.5.0') {
                $data = array();
                $module_rows = array();
                if (isset($this->request->post['filterpro_module'])) {
                    foreach ($this->request->post['filterpro_module'] as $module_row => $module) {
                        $module_rows[] = $module_row;
                        foreach ($module as $key => $value) {
                            $data["filterpro_" . $module_row . "_" . $key] = $value;
                        }
                    }
                }
                $data['filterpro_setting'] = serialize($this->request->post['filterpro_setting']);
                $data['filterpro_module'] = implode(",", $module_rows);

                $this->model_setting_setting->editSetting('filterpro', $data);
            } else {
                if (isset($this->request->post['filter_menu_position']) && $this->request->post['store_id'] > 0) {
                    $this->updateStoreSettingData();
                }
                $store_id = 0;
                $store_id = $this->request->post['store_id'];
                unset($this->request->post['store_id']);
                $this->model_setting_setting->editSetting('filterpro', $this->request->post, $store_id);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_content_top'] = $this->language->get('text_content_top');
        $this->data['text_content_bottom'] = $this->language->get('text_content_bottom');
        $this->data['text_column_left'] = $this->language->get('text_column_left');
        $this->data['text_column_right'] = $this->language->get('text_column_right');
        $this->data['text_option_mode'] = $this->language->get('text_option_mode');
        $this->data['text_attribute_mode'] = $this->language->get('text_attribute_mode');
        $this->data['text_mode_or'] = $this->language->get('text_mode_or');
        $this->data['text_mode_and'] = $this->language->get('text_mode_and');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');

        $this->data['text_weight_display'] = $this->language->get('text_weight_display');
        $this->data['text_sku_display'] = $this->language->get('text_sku_display');
        $this->data['text_model_display'] = $this->language->get('text_model_display');
        $this->data['text_brand_display'] = $this->language->get('text_brand_display');
        $this->data['text_location_display'] = $this->language->get('text_location_display');
        $this->data['text_upc_display'] = $this->language->get('text_upc_display');
        $this->data['text_stock_display'] = $this->language->get('text_stock_display');

        $this->data['text_none'] = $this->language->get('text_none');
        $this->data['text_price_slider'] = $this->language->get('text_price_slider');
        $this->data['text_attr_delimeter'] = $this->language->get('text_attr_delimeter');

        $this->data['text_manufacturer'] = $this->language->get('text_manufacturer');

        $this->data['entry_layout'] = $this->language->get('entry_layout');
        $this->data['entry_position'] = $this->language->get('entry_position');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');
        $this->data['button_create'] = $this->language->get('button_create');

        $this->load->model('catalog/option');

        $total_options = $this->model_catalog_option->getTotalOptions();
        $this->data['options'] = $this->model_catalog_option->getOptions(array('start' => 0, 'limit' => $total_options));
        foreach ($this->data['options'] as $i => $option) {
            if (!in_array($option['type'], array('radio', 'checkbox', 'select', 'image', 'information'))) {
                unset($this->data['options'][$i]);
            }
        }

        $this->load->model('catalog/attribute');
        if (isset($_GET['store_id'])) {
            $total_attributes = $this->model_catalog_attribute->getTotalAttributes();
            $this->data['attributes'] = $this->model_module_filterpro->getAttributesByStore($_GET['store_id']);
        } else {
            $this->data['attributes'] = $this->model_module_filterpro->getAttributesByStore(0);
        }

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        if (isset($this->session->data['error'])) {
            $this->data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $this->data['error'] = '';
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/filterpro', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/filterpro', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['modules'] = array();

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        if (VERSION == '1.5.0') {
            $modules = array();
            if (!is_null($this->config->get('filterpro_module'))) {
                $modules = explode(',', $this->config->get('filterpro_module'));
            }
            foreach ($modules as $module) {
                $this->data['modules'][] = array('layout_id' => $this->config->get('filterpro_' . $module . '_layout_id'),
                    'position' => $this->config->get('filterpro_' . $module . '_position'),
                    'status' => $this->config->get('filterpro_' . $module . '_status'),
                    'sort_order' => $this->config->get('filterpro_' . $module . '_sort_order')
                );
            }
            $this->data['setting'] = unserialize($this->config->get('filterpro_setting'));
        } else {
            $store_id = 0;
            if (isset($_GET['store_id'])) {
                $store_id = $_GET['store_id'];
            }
            $filterProset = $this->model_module_filterpro->getSettingFilterPro('filterpro', $store_id);

            if (isset($this->request->post['filterpro_module'])) {
                $this->data['modules'] = $this->request->post['filterpro_module'];
                $this->data['setting'] = $this->request->post['filterpro_setting'];
            } elseif (!empty($filterProset['filterpro_module'])) {

                //$this->data['modules'] = $this->config->get('filterpro_module');
                //$this->data['setting'] = $this->config->get('filterpro_setting');

                if (isset($filterProset['filterpro_module']) and !empty($filterProset['filterpro_module'])) {
                    $this->data['modules'] = $filterProset['filterpro_module'];
                } else {
                    $this->data['modules'] = '';
                }
                if (isset($filterProset['filterpro_module']) and !empty($filterProset['filterpro_module'])) {
                    $this->data['setting'] = $filterProset['filterpro_setting'];
                } else {
                    $this->data['setting'] = '';
                }
            }
        }

        $this->data['filter_menu_position'] = '';
        if (isset($_GET['store_id']) && !empty($_GET['store_id'])) {
            $this->data['filter_menu_position'] = $this->getStoreSettingData();
        }


        $this->data['display_options'][] = array('value' => 'checkbox', 'name' => $this->language->get('text_display_checkbox'));
        $this->data['display_options'][] = array('value' => 'none', 'name' => $this->language->get('text_display_none'));
        $this->data['display_options'][] = array('value' => 'select', 'name' => $this->language->get('text_display_select'));
        $this->data['display_options'][] = array('value' => 'radio', 'name' => $this->language->get('text_display_radio'));
        $this->data['display_options'][] = array('value' => 'image', 'name' => $this->language->get('Image'));
        $this->data['display_options'][] = array('value' => 'months', 'name' => $this->language->get('Months'));
        $this->data['display_options'][] = array('value' => 'color', 'name' => $this->language->get('Color'));


        $this->data['display_options_attr'] = $this->data['display_options'];
        $this->data['display_options_attr'][] = array('value' => 'slider', 'name' => $this->language->get('text_display_slider'));

        $this->data['totalstores'] = $this->model_module_filterpro->getStores();

        $this->template = 'module/filterpro.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    public function install() {

        $store_id = (int) $this->config->get('config_store_id');
        $query = $this->db->query("SELECT `layout_id` FROM `" . DB_PREFIX . "layout_route` WHERE store_id='" . $store_id . "' AND route='product/filter'");
        if ($query->num_rows) {
            $layout_id = $query->row['layout_id'];
        } else {
            $this->load->model('design/layout');

            $this->model_design_layout->addLayout(array('name' => 'FilterPro',
                'layout_route' => array(0 => array('store_id' => $store_id, 'route' => 'product/filter'))));
        }

        foreach (array(
    'product_option_value' => array('option_value_id', 'product_id'),
    'product_to_category' => array('category_id')) as $table => $indexes) {
            $query = $this->db->query("SHOW INDEX FROM `" . DB_PREFIX . $table . "`");

            $keys = array();
            foreach ($query->rows as $row) {
                if ($row['Key_name'] != 'PRIMARY') {
                    $keys[] = $row['Column_name'];
                }
            }
            $keys = array_diff($indexes, $keys);
            foreach ($keys as $key) {
                $this->db->query("ALTER TABLE `" . DB_PREFIX . $table . "` ADD INDEX ( `" . $key . "` )");
            }
        }
    }

    public function updateStoreSettingData() {
        $query = "update store set filter_menu_position = '" . $this->db->escape($this->request->post['filter_menu_position']) . "' where store_id = '" . (int) $this->request->post['store_id'] . "'";
        $this->db->query($query);
        unset($this->request->post['filter_menu_position']);
    }

    public function getStoreSettingData() {
        $query = "select filter_menu_position  from store  where store_id = '" . (int) $_GET['store_id'] . "'";
        $result = $this->db->query($query);
        return $result->row['filter_menu_position'];
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/filterpro')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>