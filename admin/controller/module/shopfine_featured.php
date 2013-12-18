<?php

class ControllerModuleShopfineFeatured extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('module/shopfine_featured');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/store');

        $this->data['stores'] = $this->model_setting_store->getStores();

        $this->data['curr_store'] = 0;
        if (isset($this->request->get['store_id'])) {
            $this->data['curr_store'] = $this->request->get['store_id'];
        }

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $store_id = $this->request->post['store_id'];
            unset($this->request->post['store_id']);
            $this->model_setting_setting->editSetting('shopfine_featured', $this->request->post, $store_id);

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

        $this->data['entry_product'] = $this->language->get('entry_product');
        $this->data['entry_limit'] = $this->language->get('entry_limit');
        $this->data['entry_image'] = $this->language->get('entry_image');
        $this->data['entry_layout'] = $this->language->get('entry_layout');
        $this->data['entry_position'] = $this->language->get('entry_position');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['image'])) {
            $this->data['error_image'] = $this->error['image'];
        } else {
            $this->data['error_image'] = array();
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
            'href' => $this->url->link('module/shopfine_featured', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/shopfine_featured', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->request->post['shopfine_featured_product'])) {
            $this->data['shopfine_featured_product'] = $this->request->post['shopfine_featured_product'];
        } else {
            $this->data['shopfine_featured_product'] = $this->config->get('shopfine_featured_product');
        }

        $this->load->model('catalog/product');

        $products = array();

        if (isset($this->request->post['shopfine_featured_product'])) {
            $products = explode(',', $this->request->post['shopfine_featured_product']);
        } elseif ($this->model_setting_setting->getSetting('shopfine_featured', $this->data['curr_store'])) {
            //$products = explode(',', $this->config->get('shopfine_featured_product'));
            $feat_prod = $this->model_setting_setting->getSetting('shopfine_featured', $this->data['curr_store']);
            if (isset($feat_prod['shopfine_featured_module']) && !empty($feat_prod['shopfine_featured_module'])) {
                $products = explode(',', $feat_prod['shopfine_featured_product']);
            }
        }

        $this->data['products'] = array();

        foreach ($products as $product_id) {
            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {
                $this->data['products'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name' => $product_info['name']
                );
            }
        }

        $this->data['modules'] = array();

        if (isset($this->request->post['shopfine_featured_module'])) {
            $this->data['modules'] = $this->request->post['shopfine_featured_module'];
        } elseif ($this->model_setting_setting->getSetting('shopfine_featured', $this->data['curr_store'])) {
            //$this->data['modules'] = $this->config->get('shopfine_featured_module');
            $feat_prod = $this->model_setting_setting->getSetting('shopfine_featured', $this->data['curr_store']);
            if (isset($feat_prod['shopfine_featured_module']) && !empty($feat_prod['shopfine_featured_module'])) {
                $this->data['modules'] = $feat_prod['shopfine_featured_module'];
            }
        }

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->template = 'module/shopfine_featured.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/shopfine_featured')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (isset($this->request->post['shopfine_featured_module'])) {
            foreach ($this->request->post['shopfine_featured_module'] as $key => $value) {
                if (!$value['image_width'] || !$value['image_height']) {
                    $this->error['image'][$key] = $this->language->get('error_image');
                }
            }
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>