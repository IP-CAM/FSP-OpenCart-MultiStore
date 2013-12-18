<?php

class ControllerPaymentAdyenGiroPaySofort extends Controller {

    private $error = array();

    public function index() {
        $this->language->load('payment/adyengiropay_sofort');

       $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
           
            
            $this->model_setting_setting->editSetting('adyen_sofort', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_all_zones'] = $this->language->get('text_all_zones');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_authorization'] = $this->language->get('text_authorization');
        $this->data['text_sale'] = $this->language->get('text_sale');

        $this->data['entry_email'] = $this->language->get('entry_email');
        $this->data['entry_test'] = $this->language->get('entry_test');
        $this->data['entry_transaction'] = $this->language->get('entry_transaction');
        $this->data['entry_debug'] = $this->language->get('entry_debug');
        $this->data['entry_total'] = $this->language->get('entry_total');
        $this->data['entry_canceled_reversal_status'] = $this->language->get('entry_canceled_reversal_status');
        $this->data['entry_completed_status'] = $this->language->get('entry_completed_status');
        $this->data['entry_denied_status'] = $this->language->get('entry_denied_status');
        $this->data['entry_expired_status'] = $this->language->get('entry_expired_status');
        $this->data['entry_failed_status'] = $this->language->get('entry_failed_status');
        $this->data['entry_pending_status'] = $this->language->get('entry_pending_status');
        $this->data['entry_processed_status'] = $this->language->get('entry_processed_status');
        $this->data['entry_refunded_status'] = $this->language->get('entry_refunded_status');
        $this->data['entry_reversed_status'] = $this->language->get('entry_reversed_status');
        $this->data['entry_voided_status'] = $this->language->get('entry_voided_status');
        $this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $this->data['entry_status'] = $this->language->get('entry_status');
        $this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
        
        $this->data['entry_hmac_test'] = $this->language->get('entry_hmac_test');
        $this->data['entry_hmac_live'] = $this->language->get('entry_hmac_live');
        $this->data['entry_days_till_delivery'] = $this->language->get('entry_days_till_delivery');
        $this->data['entry_skincode'] = $this->language->get('entry_skincode');
         $this->data['entry_session_valid_till'] = $this->language->get('entry_session_valid_till');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['email'])) {
            $this->data['error_email'] = $this->error['email'];
        } else {
            $this->data['error_email'] = '';
        }
        
        if (isset($this->error['hmac_test'])) {
            $this->data['error_hmac_test'] = $this->error['hmac_test'];
        } else {
            $this->data['error_hmac_test'] = '';
        }
        
          if (isset($this->error['hmac_live'])) {
            $this->data['error_hmac_live'] = $this->error['hmac_live'];
        } else {
            $this->data['error_hmac_live'] = '';
        }
        
        
        if (isset($this->error['skincode'])) {
            $this->data['error_skincode'] = $this->error['skincode'];
        } else {
            $this->data['error_skincode'] = '';
        }
        
         if (isset($this->error['days_till_delivery'])) {
            $this->data['error_days_till_delivery'] = $this->error['days_till_delivery'];
        } else {
            $this->data['error_days_till_delivery'] = '';
        }
        
        
         if (isset($this->error['session_valid_till'])) {
            $this->data['error_session_valid_till'] = $this->error['session_valid_till'];
        } else {
            $this->data['error_session_valid_till'] = '';
        }
        
        
        

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_payment'),
            'href' => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('payment/adyen', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('payment/adyengiropay_sofort', 'token=' . $this->session->data['token'], 'SSL');

        $this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['adyen_sofort_email'])) {
            $this->data['adyen_sofort_email'] = $this->request->post['adyen_sofort_email'];
        } else {
            $this->data['adyen_sofort_email'] = $this->config->get('adyen_sofort_email');
        }
        
        if (isset($this->request->post['adyen_sofort_hmac_test'])) {
            $this->data['adyen_sofort_hmac_test'] = $this->request->post['adyen_sofort_hmac_test'];
        } else {
            $this->data['adyen_sofort_hmac_test'] = $this->config->get('adyen_sofort_hmac_test');
        }
        
        
         if (isset($this->request->post['adyen_sofort_hmac_live'])) {
            $this->data['adyen_sofort_hmac_live'] = $this->request->post['adyen_sofort_hmac_live'];
        } else {
            $this->data['adyen_sofort_hmac_live'] = $this->config->get('adyen_sofort_hmac_live');
        }
        
        if (isset($this->request->post['adyen_sofort_skincode'])) {
            $this->data['adyen_sofort_skincode'] = $this->request->post['adyen_sofort_skincode'];
        } else {
            $this->data['adyen_sofort_skincode'] = $this->config->get('adyen_sofort_skincode');
        }
        
        
        if (isset($this->request->post['adyen_sofort_days_till_delivery'])) {
            $this->data['adyen_sofort_days_till_delivery'] = $this->request->post['adyen_sofort_days_till_delivery'];
        } else {
            $this->data['adyen_sofort_days_till_delivery'] = $this->config->get('adyen_sofort_days_till_delivery');
        }
        
        
         if (isset($this->request->post['adyen_sofort_session valid till'])) {
            $this->data['adyen_sofort_session valid till'] = $this->request->post['adyen_sofort_session valid till'];
        } else {
            $this->data['adyen_sofort_session valid till'] = $this->config->get('adyen_sofort_session valid till');
        }
        

        if (isset($this->request->post['adyen_sofort_test'])) {
            $this->data['adyen_sofort_test'] = $this->request->post['adyen_sofort_test'];
        } else {
            $this->data['adyen_sofort_test'] = $this->config->get('adyen_sofort_test');
        }

        if (isset($this->request->post['adyen_transaction'])) {
            $this->data['adyen_sofort_transaction'] = $this->request->post['adyen_sofort_transaction'];
        } else {
            $this->data['adyen_sofort_transaction'] = $this->config->get('adyen_sofort_transaction');
        }

        if (isset($this->request->post['adyen_sofort_debug'])) {
            $this->data['adyen_sofort_debug'] = $this->request->post['adyen_sofort_debug'];
        } else {
            $this->data['adyen_sofort_debug'] = $this->config->get('adyen_sofort_debug');
        }

        if (isset($this->request->post['adyen_sofort_total'])) {
            $this->data['adyen_sofort_total'] = $this->request->post['adyen_sofort_total'];
        } else {
            $this->data['adyen_sofort_total'] = $this->config->get('adyen_sofort_total');
        }

        if (isset($this->request->post['adyen_sofort_canceled_reversal_status_id'])) {
            $this->data['adyen_sofort_canceled_reversal_status_id'] = $this->request->post['adyen_sofort_canceled_reversal_status_id'];
        } else {
            $this->data['adyen_sofort_canceled_reversal_status_id'] = $this->config->get('adyen_sofort_canceled_reversal_status_id');
        }

        if (isset($this->request->post['adyen_sofort_completed_status_id'])) {
            $this->data['adyen_sofort_completed_status_id'] = $this->request->post['adyen_sofort_completed_status_id'];
        } else {
            $this->data['adyen_sofort_completed_status_id'] = $this->config->get('adyen_sofort_completed_status_id');
        }

        if (isset($this->request->post['adyen_sofort_denied_status_id'])) {
            $this->data['adyen_sofort_denied_status_id'] = $this->request->post['adyen_sofort_denied_status_id'];
        } else {
            $this->data['adyen_sofort_denied_status_id'] = $this->config->get('adyen_sofort_denied_status_id');
        }

        if (isset($this->request->post['adyen_sofort_expired_status_id'])) {
            $this->data['adyen_sofort_expired_status_id'] = $this->request->post['adyen_sofort_expired_status_id'];
        } else {
            $this->data['adyen_sofort_expired_status_id'] = $this->config->get('adyen_sofort_expired_status_id');
        }

        if (isset($this->request->post['adyenadyen_sofort_failed_status_id'])) {
            $this->data['adyen_sofort_failed_status_id'] = $this->request->post['adyen_sofort_failed_status_id'];
        } else {
            $this->data['adyen_sofort_failed_status_id'] = $this->config->get('adyen_sofort_failed_status_id');
        }

        if (isset($this->request->post['adyen_sofort_pending_status_id'])) {
            $this->data['adyen_sofort_pending_status_id'] = $this->request->post['adyen_sofort_pending_status_id'];
        } else {
            $this->data['adyen_sofort_pending_status_id'] = $this->config->get('adyen_sofort_pending_status_id');
        }

        if (isset($this->request->post['adyen_sofort_processed_status_id'])) {
            $this->data['adyen_sofort_processed_status_id'] = $this->request->post['adyen_sofort_processed_status_id'];
        } else {
            $this->data['adyen_sofort_processed_status_id'] = $this->config->get('adyen_sofort_processed_status_id');
        }

        if (isset($this->request->post['adyen_sofort_refunded_status_id'])) {
            $this->data['adyen_sofort_refunded_status_id'] = $this->request->post['adyen_sofort_refunded_status_id'];
        } else {
            $this->data['adyen_sofort_refunded_status_id'] = $this->config->get('adyen_sofort_refunded_status_id');
        }

        if (isset($this->request->post['adyen_sofort_reversed_status_id'])) {
            $this->data['adyen_sofort_reversed_status_id'] = $this->request->post['adyen_sofort_reversed_status_id'];
        } else {
            $this->data['adyen_sofort_reversed_status_id'] = $this->config->get('adyen_sofort_reversed_status_id');
        }

        if (isset($this->request->post['adyen_voided_status_id'])) {
            $this->data['adyen_sofort_voided_status_id'] = $this->request->post['adyen_sofort_voided_status_id'];
        } else {
            $this->data['adyen_sofort_voided_status_id'] = $this->config->get('adyen_sofort_voided_status_id');
        }
        
        
         if (isset($this->request->post['adyen_sofort_session_valid_till'])) {
            $this->data['adyen_sofort_session_valid_till'] = $this->request->post['adyen_sofort_session_valid_till'];
        } else {
            $this->data['adyen_sofort_session_valid_till'] = $this->config->get('adyen_sofort_session_valid_till');
        }
        
        
          if (isset($this->request->post['adyen_sofort_status_email'])) {
            $this->data['adyen_sofort_status_email'] = $this->request->post['adyen_sofort_status_email'];
        } else {
            $this->data['adyen_sofort_status_email'] = $this->config->get('adyen_sofort_status_email');
        }
        

        $this->load->model('localisation/order_status');

        $this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        if (isset($this->request->post['adyen_sofort_geo_zone_id'])) {
            $this->data['adyen_sofort_geo_zone_id'] = $this->request->post['adyen_sofort_geo_zone_id'];
        } else {
            $this->data['adyen_sofort_geo_zone_id'] = $this->config->get('adyen_sofort_geo_zone_id');
        }

        $this->load->model('localisation/geo_zone');

        $this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        if (isset($this->request->post['adyengiro_sofort_status'])) {
            $this->data['adyen_sofort_status'] = $this->request->post['adyengiropay_sofort_status'];
        } else {
            $this->data['adyen_sofort_status'] = $this->config->get('adyengiropay_sofort_status');
        }

        if (isset($this->request->post['adyengiropay_sofort_sort_order'])) {
            $this->data['adyen_sofort_sort_order'] = $this->request->post['adyengiropay_sofort_sort_order'];
        } else {
            $this->data['adyen_sofort_sort_order'] = $this->config->get('adyengiropay_sofort_sort_order');
        }

        $this->template = 'payment/adyen_sofort.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'payment/adyen')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->request->post['adyen_sofort_hmac_test']) {
            $this->error['hmac_test'] = $this->language->get('error_hmac_test');
        }
        
         if (!$this->request->post['adyen_sofort_hmac_live']) {
            $this->error['hmac_live'] = $this->language->get('error_hmac_live');
        }
        
         if (!$this->request->post['adyen_sofort_skincode']) {
            $this->error['skincode'] = $this->language->get('error_skincode');
        }
        
         if (!$this->request->post['adyen_sofort_email']) {
            $this->error['email'] = $this->language->get('error_email');
        }
        
        
         if (!$this->request->post['adyen_sofort_days_till_delivery']) {
            $this->error['days_till_delivery'] = $this->language->get('days_till_delivery');
        }
        
        
         if (!$this->request->post['adyen_sofort_session_valid_till']) {
            $this->error['session_valid_till'] = $this->language->get('error_session_valid_till');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

}

?>