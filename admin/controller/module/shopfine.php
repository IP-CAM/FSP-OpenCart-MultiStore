<?php

class ControllerModuleShopfine extends Controller {

    private $error = array();

    public function index() {
        $this->load->language('module/shopfine');

        $this->document->setTitle(strip_tags($this->language->get('heading_title')));

        $this->load->model('setting/setting');

        $this->load->model('setting/store');

        $this->data['stores'] = $this->model_setting_store->getStores();

        $this->data['curr_store'] = 0;
        if (isset($this->request->get['store_id'])) {
            $this->data['curr_store'] = $this->request->get['store_id'];
        }



        $this->load->model('tool/image');

        $this->document->addStyle('../catalog/view/theme/shopfine/css/themes_panel.css');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $store_id = $this->request->post['store_id'];
            unset($this->request->post['store_id']);

            $this->model_setting_setting->editSetting('shopfine', $this->request->post, $store_id);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');

        $this->data['text_image_manager'] = $this->language->get('text_image_manager');
        $this->data['text_browse'] = $this->language->get('text_browse');

        $this->data['token'] = $this->session->data['token'];

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['code'])) {
            $this->data['error_code'] = $this->error['code'];
        } else {
            $this->data['error_code'] = '';
        }


        $this->data['heading_title'] = $this->language->get('heading_title');
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
            'href' => $this->url->link('module/shopfine', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/shopfine', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['shopfine'])) {
            $this->data['shopfine'] = $this->request->post['shopfine'];
        } else {
            $this->data['shopfine'] = $this->config->get('shopfine');

            $this->data['shopfine'] = array();
            $shopfine_content = $this->model_setting_setting->getSetting('shopfine', $this->data['curr_store']);
            if ($shopfine_content) {
                $this->data['shopfine'] = $shopfine_content['shopfine'];
            }
        }

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->load->model('localisation/language');

        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        $this->template = 'module/shopfine.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 70, 70);

        $this->response->setOutput($this->render());
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/shopfine')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['shopfine']) {
            $this->error['code'] = $this->language->get('error_code');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>