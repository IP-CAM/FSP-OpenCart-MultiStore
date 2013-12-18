<?php

class ControllerModuleOpenErpSettings extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('module/open_erp_settings');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        $this->load->model('setting/store');
        $this->data['stores'] = $this->model_setting_store->getStores();
        $this->data['curr_store'] = 0;
        if (isset($this->request->get['store_id'])) {
            $this->data['curr_store'] = $this->request->get['store_id'];
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $store_id = $this->request->post['store_id'];
            unset($this->request->post['store_id']);
            $this->model_setting_setting->editSetting('open_erp_settings', $this->request->post, $store_id);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['text_select_boom'] = $this->language->get('text_select_boom');
        $this->data['text_select_backbase_database'] = $this->language->get('text_select_backbase_database');
        $this->data['text_select_backbase_path'] = $this->language->get('text_select_backbase_path');
        $this->data['text_live_cal'] = $this->language->get('text_live_cal');
        $this->data['text_status'] = $this->language->get('text_status');
        $this->data['text_store_invoice_prefix'] = $this->language->get('text_store_invoice_prefix');
        $this->data['text_store_invoice_prefix_help'] = $this->language->get('text_store_invoice_prefix_help');
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        $this->data['stores_url'] = $this->url->link('module/open_erp_settings/stores', 'token=' . $this->session->data['token'], 'SSL');


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
            'href' => $this->url->link('module/open_erp_settings', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/open_erp_settings', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/open_erp_settings', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['modules'] = array();

        if (isset($this->request->post['open_erp_settings_module'])) {
            $this->data['modules'] = $this->request->post['open_erp_settings_module'];
        } elseif ($this->model_setting_setting->getSetting('open_erp_settings', $this->data['curr_store'])) {
            $erp_settings = $this->model_setting_setting->getSetting('open_erp_settings', $this->data['curr_store']);
            $this->data['modules'] = array();

            if (isset($erp_settings['open_erp_settings_module'])) {
                $this->data['modules'] = $erp_settings['open_erp_settings_module'][0];
            }
        }

        $backbase_databases = array("backbasefsp", "backbasefsp2");
        $backbase_database_options = '';
        
        foreach ($backbase_databases as $backbase_database) {
            if (isset($this->data['modules']['backbase_database']) && $this->data['modules']['backbase_database'] == $backbase_database) {
                $backbase_database_options .= '<option value="' . $backbase_database . '" selected="selected">' . $backbase_database . '</option>';
            } else {
                $backbase_database_options .= '<option value="' . $backbase_database . '">' . $backbase_database . '</option>';
            }
        }

        $boom_store_options = '<option value="">- Select -</option>';
        if (isset($this->data['modules']['backbase_database']) && !empty($this->data['modules']['backbase_database'])) {
            $boom_store_options = $this->storeList($this->data['modules']['backbase_database']);
        } else {
            $boom_store_options = $this->storeList('backbasefsp');
        }

        $this->data['backbase_database_options'] = $backbase_database_options;
        $this->data['boom_store_options'] = $boom_store_options;

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->template = 'module/open_erp_settings.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/open_erp_settings')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function stores() {
        /* get stores from boom   */
        $boom_store_options = '<option value="">- Select -</option>';

        if (isset($this->request->post['backbase_database'])) {
            $backBase_db = $this->request->post['backbase_database'];
            $boom_store_options = $this->storeList($backBase_db);
        }

        $this->response->setOutput($boom_store_options);
    }

    public function storeList($backBase_db) {
        /* get stores from boom   */
        $con = mysql_pconnect(BCDB_HOSTNAME, BCDB_USERNAME, BCDB_PASSWORD);
        mysql_select_db($backBase_db, $con) or die(mysql_error());
        $boom_store_options = '<option value="">- Select -</option>';
        $qry = 'select store_id,name from qlt_stores where deleted=0 AND store_status = 1 order by store_id';
        $queryResult = mysql_query($qry, $con);
        while ($row = mysql_fetch_assoc($queryResult)) {
            $selected = '';
            if (isset($this->data['modules']['boom_store_id']) && $this->data['modules']['boom_store_id'] == $row['store_id']) {
                $selected = 'selected';
            }
            $boom_store_options .= "<option value='" . $row['store_id'] . "' " . $selected . ">" . $row['store_id'] . ' ' . $row['name'] . "</option>";
        }
        mysql_close($con);
        return $boom_store_options;
    }

}

?>