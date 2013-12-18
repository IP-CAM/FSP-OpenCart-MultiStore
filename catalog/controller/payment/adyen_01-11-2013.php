<?php

class ControllerPaymentAdyen extends Controller {

    public function index() {

        $this->language->load('payment/adyen');
        $this->data['text_testmode'] = $this->language->get('text_testmode');
        $this->data['button_confirm'] = $this->language->get('button_confirm');
        $this->data['testmode'] = $this->config->get('adyen_test');
        $this->data['config_url'] = $this->config->get('config_url');

        if (DATE_ATOM == "DATE_ATOM") {
            $dateformat = "Y-m-d\TH:i:s\Z";
        } else {
            $dateformat = DATE_ATOM;
        }
        $this->data['shipBeforeDate'] = 1;
        $this->data['shipBeforeDate'] = $this->config->get('adyen_days_till_delivery');
        $this->data['session_valid_till'] = 1;
        $this->data['session_valid_till'] = $this->config->get('adyen_session_valid_till');
        $shipBeforeDate = date("Y-m-d", mktime(date("H"), date("i"), date("s"), date("m"), date("j") + $this->data['shipBeforeDate'], date("Y")));

        $sessionValidity = date(DATE_ATOM, mktime(date("H"), date("i"), date("s"), date("m"), date("j") + $this->data['session_valid_till'], date("Y")));

        if (!$this->config->get('adyen_test')) {
            //$this->data['action'] = 'https://live.adyen.com/hpp/pay.shtml';
            $this->data['action'] = $this->config->get('config_url') . 'index.php?route=payment/adyen/callback';
            $sharedSecret = $this->config->get('adyen_hmac_live');
        } else {
            //$this->data['action'] = 'https://test.adyen.com/hpp/pay.shtml';
            $this->data['action'] = $this->config->get('config_url') . 'index.php?route=payment/adyen/callback';
            $sharedSecret = $this->config->get('adyen_hmac_test');
        }

        $this->load->model('checkout/order');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        if ($order_info) {

            //Adyen Fields
            $this->data['merchantAccount'] = $this->config->get('adyen_email');
            $this->data['skinCode'] = $this->config->get('adyen_skincode');
            $this->data['merchantReturnData'] = $this->session->data['order_id'];
            $this->data['currencyCode'] = $order_info['currency_code'];
            $this->data['shipBeforeDate'] = $shipBeforeDate;
            $this->data['sessionValidity'] = $sessionValidity;
            $this->data['shopperLocale'] = 'en_US';
            $this->data['merchantReference'] = "refer-" . $this->session->data['order_id'];
            $this->data['business'] = $this->config->get('adyen_email');
            $this->data['item_name'] = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

            $this->data['products'] = array();

            foreach ($this->cart->getProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['option_value'];
                    } else {
                        $filename = $this->encryption->decrypt($option['option_value']);

                        $value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
                    }

                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

                $this->data['products'][] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
                    'total' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                );
            }

            $total_data = array();
            $total = 0;
            $taxes = $this->cart->getTaxes();

            $this->load->model('setting/extension');
            $sort_order = array();
            $results = $this->model_setting_extension->getExtensions('total');
            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('total/' . $result['code']);

                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                }
            }

            $sort_order = array();

            foreach ($total_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $total_data);

            $productData = "";
            $productDataOptions = "";

            if (isset($this->data['products'])) {
                if (!empty($this->data['products'])) {
                    $productData .= "<table>";
                    $productData .= "<tr><th align='left'>Name</th><th align='left'>SKU</th><th align='right'>Quantity</th><th align='right'>Price</th></tr>";
                    foreach ($this->data['products'] as $data) {
                        if (isset($data['option']) && !empty($data['option'])) {
                            foreach ($data['option'] as $options) {
                                $productDataOptions .= $options['name'] . ":" . $options['value'];
                            }
                        }
                        $productData .= "<tr><td align='left'> " . $data['name'] . "<br/>" . $productDataOptions . "</td><td align='left'>" . $data['model'] . "</td><td align='center'>" . $data['quantity'] . "</td><td align='right'>" . $data['price'] . "</td></tr>";
                    }

                    foreach ($total_data as $total) {
                        $productData .= "<tr><td colspan='3'><b>" . $total['title'] . "</b></td><td>" . $total['text'] . "</td></tr>";
                    }

                    $productData .= "</table>";
                }
            }

            $this->data['orderData'] = $productData; // order data
            $this->data['totalAmount'] = number_format($this->currency->format($order_info['total'], $order_info['currency_code'], false, false), 2) * 100;

            $this->data['discount_amount_cart'] = 0;
            $total = $this->currency->format($order_info['total'] - $this->cart->getSubTotal(), $order_info['currency_code'], false, false);

            if ($total > 0) {
                $this->data['products'][] = array(
                    'name' => $this->language->get('text_total'),
                    'model' => '',
                    'price' => number_format($total * 100, 0, '', ''),
                    'quantity' => 1,
                    'option' => array(),
                    'weight' => 0
                );
            } else {
                $this->data['discount_amount_cart'] -= $total;
            }

            $this->data['currency_code'] = $order_info['currency_code'];
            $this->data['first_name'] = html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8');
            $this->data['last_name'] = html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');
            $this->data['address1'] = html_entity_decode($order_info['payment_address_1'], ENT_QUOTES, 'UTF-8');
            $this->data['address2'] = html_entity_decode($order_info['payment_address_2'], ENT_QUOTES, 'UTF-8');
            $this->data['city'] = html_entity_decode($order_info['payment_city'], ENT_QUOTES, 'UTF-8');
            $this->data['zip'] = html_entity_decode($order_info['payment_postcode'], ENT_QUOTES, 'UTF-8');
            $this->data['country'] = $order_info['payment_iso_code_2'];
            $this->data['email'] = $order_info['email'];
            $this->data['invoice'] = $this->session->data['order_id'] . ' - ' . html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8') . ' ' . html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');
            $this->data['lc'] = $this->session->data['language'];
            $this->data['return'] = $this->url->link('payment/adyen/callback');

            if (!$this->config->get('adyen_transaction')) {
                $this->data['paymentaction'] = 'authorization';
            } else {
                $this->data['paymentaction'] = 'sale';
            }

            $this->data['custom'] = $this->session->data['order_id'];

            $sign = $this->data['totalAmount'] . $this->data['currency_code'] . $this->data['shipBeforeDate'] . $this->data['merchantReference'] . $this->data['skinCode'] . $this->data['merchantAccount']
                    . $this->data['sessionValidity'] . $this->data['email'] . $this->session->data['order_id'];

            $this->data['merchantSig'] = base64_encode(hash_hmac('sha1', $sign, $sharedSecret, true));

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/adyen.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/payment/adyen.tpl';
            } else {
                $this->template = 'default/template/payment/adyen.tpl';
            }

            // $this->render();
        }
    }

    function hmacsha1($key, $data) {
        $blocksize = 64;
        $hashfunc = 'sha1';
        if (strlen($key) > $blocksize)
            $key = pack('H*', $hashfunc($key));
        $key = str_pad($key, $blocksize, chr(0x00));
        $ipad = str_repeat(chr(0x36), $blocksize);
        $opad = str_repeat(chr(0x5c), $blocksize);
        $hmac = pack(
                'H*', $hashfunc(
                        ($key ^ $opad) . pack(
                                'H*', $hashfunc(
                                        ($key ^ $ipad) . $data
                                )
                        )
                )
        );
        return bin2hex($hmac);
    }

    public function adyenCallback() {

        if (isset($_POST)) {
            $str = '';
            foreach ($_POST as $k => $v) {
                $str .=$k . '=' . $v . "\n";
            }
            $str .= '**********************************************************************\n';
        }
        $fp = fopen('adyencallback.txt', 'a');
        fwrite($fp, $str);
        fclose($fp);


        if (isset($this->request->post['merchantReference'])) {
            $ref = $this->request->post['merchantReference'];
            $refArr = explode("-", $ref);
            $order_id = $refArr[1];
        } else {
            $order_id = 335;
        }
  
        $order_status_id = $this->config->get('config_order_status_id');

        $this->load->model('checkout/order');
         $this->load->model('custom/product');
        $order_info = $this->model_checkout_order->getOrder($order_id);
        if ($order_info) {
            
            
            if($this->request->post['paymentMethod'] == 'directEbanking' || $this->request->post['paymentMethod'] == 'giropay')
            {
                if($this->request->post['paymentMethod'] == 'directEbanking')
                {
                     if (($this->request->post['eventCode'] == 'AUTHORISATION') && ($this->request->post['success'] == 'true')) {
                          $order_status_id = $this->config->get('adyen_completed_status_id');
                          if (!$order_info['order_status_id']) {
                              
                             $sql="update `order`  set payment_method='Sofort' where order_id=".$order_id;
                             $this->db->query($sql);
                             
                    $this->model_checkout_order->confirm($order_id, $order_status_id);
                } else {
                      $order_status_id = $this->config->get('adyen_failed_status_id');
                      $this->model_custom_product->sendConfirmationEmail($order_id, $order_status_id);
                   // $this->model_checkout_order->update($order_id, $order_status_id);
                }
                     
                     }
                }
                
                
                if($this->request->post['paymentMethod'] == 'giropay')
                {
                     if (($this->request->post['eventCode'] == 'AUTHORISATION') && ($this->request->post['success'] == 'true')) {
                          $order_status_id = $this->config->get('adyen_completed_status_id');
                          if (!$order_info['order_status_id']) {
                              
                             $sql="update `order`  set payment_method='Giropay' where order_id=".$order_id;
                             $this->db->query($sql);
                             
                    $this->model_checkout_order->confirm($order_id, $order_status_id);
                } else {
                      $order_status_id = $this->config->get('adyen_failed_status_id');
                      $this->model_custom_product->sendConfirmationEmail($order_id, $order_status_id);
                   // $this->model_checkout_order->update($order_id, $order_status_id);
                }
                     
                     }
                }
                
                 
                
            }else{
            
            if (($this->request->post['eventCode'] == 'AUTHORISATION') && ($this->request->post['success'] == 'true')) {
                $order_status_id = $this->config->get('adyen_completed_status_id');
                if (!$order_info['order_status_id']) {
                    $this->model_checkout_order->confirm($order_id, $order_status_id);
                } else {
                      $order_status_id = $this->config->get('adyen_failed_status_id');
                      $this->model_custom_product->sendConfirmationEmail($order_id, $order_status_id);
                   // $this->model_checkout_order->update($order_id, $order_status_id);
                }
            } else {
                  $order_status_id = $this->config->get('adyen_failed_status_id');
                  $this->model_custom_product->sendConfirmationEmail($order_id, $order_status_id);
               // $this->model_custom_product->sendConfirmationEmail($order_id, $order_status_id);
                //$this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'));
            }
            }
            
        }
       
       
        echo '[accepted]';
    }

    public function getform() {
        $this->language->load('payment/adyen');
        $this->data['text_testmode'] = $this->language->get('text_testmode');
        $this->data['button_confirm'] = $this->language->get('button_confirm');
        $this->data['testmode'] = $this->config->get('adyen_test');
        $this->data['text_card_number'] = $this->language->get('text_card_number');
        $this->data['text_card_holder_name'] = $this->language->get('text_card_holder_name');
        $this->data['text_card_cvc'] = $this->language->get('text_card_cvc');
        $this->data['text_card_expiry'] = $this->language->get('text_card_expiry');
        $this->data['error_holderName'] = $this->language->get('error_holderName');
        $this->data['error_number'] = $this->language->get('error_number');
        $this->data['error_cvc'] = $this->language->get('error_cvc');
        $this->data['error_expiry'] = $this->language->get('error_expiry');
        $this->data['config_url'] = $this->config->get('config_url');
        $this->data['action'] = $this->config->get('config_url') . 'index.php?route=payment/adyen/doPaymentAdyen';


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/adyen.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/payment/adyen.tpl';
        } else {
            $this->template = 'default/template/payment/adyen.tpl';
        }

        $this->response->setOutput($this->render());
    }

    public function doPaymentAdyen() {
        $this->language->load('payment/adyen');
        $json = array();

        // Validate cart if it has products and stock.			
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            $json['redirect'] = $this->url->link('checkout/cart');
        }

//        if (!$json) {
//            if ((utf8_strlen($this->request->post['holderName']) < 1) || (utf8_strlen($this->request->post['holderName']) > 32)) {
//                $json['error']['holderName'] = $this->language->get('error_holderName');
//            }
//            if ((utf8_strlen($this->request->post['number']) < 1) || (utf8_strlen($this->request->post['number']) < 14)) {
//                $json['error']['number'] = $this->language->get('error_number');
//            }
//        }

        if (!$json) {

            if (DATE_ATOM == "DATE_ATOM") {
                $dateformat = "Y-m-d\TH:i:s\Z";
            } else {
                $dateformat = DATE_ATOM;
            }

            if (!$this->config->get('adyen_test')) {
                $sharedSecret = $this->config->get('adyen_hmac_live');
            } else {
                $sharedSecret = $this->config->get('adyen_hmac_test');
            }

            $shipBeforeDateDays = 1;
            $shipBeforeDateDays = $this->config->get('adyen_days_till_delivery');
            $shipBeforeDate = date("Y-m-d", mktime(date("H"), date("i"), date("s"), date("m"), date("j") + $shipBeforeDateDays, date("Y")));

            $session_valid_till = 1;
            $session_valid_till = $this->config->get('adyen_session_valid_till');
            $sessionValidity = date(DATE_ATOM, mktime(date("H"), date("i"), date("s"), date("m"), date("j") + $session_valid_till, date("Y")));

            $this->load->model('checkout/order');

            $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

            if ($order_info) {

                //Adyen Fields
                $this->data['merchantAccount'] = $this->config->get('adyen_email');
                $this->data['skinCode'] = $this->config->get('adyen_skincode');
                $this->data['merchantReturnData'] = $this->session->data['order_id'];
                $this->data['currencyCode'] = $order_info['currency_code'];
                $this->data['shipBeforeDate'] = $shipBeforeDate;
                $this->data['sessionValidity'] = $sessionValidity;
                $this->data['shopperLocale'] = 'en_US';
                $this->data['merchantReference'] = "refer-" . $this->session->data['order_id'];
                $this->data['business'] = $this->config->get('adyen_email');
                $this->data['item_name'] = html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

                $this->data['products'] = array();

                foreach ($this->cart->getProducts() as $product) {
                    $option_data = array();

                    foreach ($product['option'] as $option) {
                        if ($option['type'] != 'file') {
                            $value = $option['option_value'];
                        } else {
                            $filename = $this->encryption->decrypt($option['option_value']);

                            $value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
                        }

                        $option_data[] = array(
                            'name' => $option['name'],
                            'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                        );
                    }

                    $this->data['products'][] = array(
                        'product_id' => $product['product_id'],
                        'name' => $product['name'],
                        'model' => $product['model'],
                        'option' => $option_data,
                        'quantity' => $product['quantity'],
                        'subtract' => $product['subtract'],
                        'price' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
                        'total' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
                        'href' => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                    );
                }

                $total_data = array();
                $total = 0;
                $taxes = $this->cart->getTaxes();

                $this->load->model('setting/extension');
                $sort_order = array();
                $results = $this->model_setting_extension->getExtensions('total');
                foreach ($results as $key => $value) {
                    $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
                }

                array_multisort($sort_order, SORT_ASC, $results);

                foreach ($results as $result) {
                    if ($this->config->get($result['code'] . '_status')) {
                        $this->load->model('total/' . $result['code']);

                        $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                    }
                }

                $sort_order = array();

                foreach ($total_data as $key => $value) {
                    $sort_order[$key] = $value['sort_order'];
                }

                array_multisort($sort_order, SORT_ASC, $total_data);

                $productData = "";
                $productDataOptions = "";

                if (isset($this->data['products'])) {
                    if (!empty($this->data['products'])) {
                        $productData .= "<table>";
                        $productData .= "<tr><th align='left'>Name</th><th align='left'>SKU</th><th align='right'>Quantity</th><th align='right'>Price</th></tr>";
                        foreach ($this->data['products'] as $data) {
                            if (isset($data['option']) && !empty($data['option'])) {
                                foreach ($data['option'] as $options) {
                                    $productDataOptions .= $options['name'] . ":" . $options['value'];
                                }
                            }
                            $productData .= "<tr><td align='left'> " . $data['name'] . "<br/>" . $productDataOptions . "</td><td align='left'>" . $data['model'] . "</td><td align='center'>" . $data['quantity'] . "</td><td align='right'>" . $data['price'] . "</td></tr>";
                        }

                        foreach ($total_data as $total) {
                            $productData .= "<tr><td colspan='3'><b>" . $total['title'] . "</b></td><td>" . $total['text'] . "</td></tr>";
                        }

                        $productData .= "</table>";
                    }
                }

                $this->data['orderData'] = $productData; // order data
                $this->data['totalAmount'] = number_format($this->currency->format($order_info['total'], $order_info['currency_code'], false, false), 2) * 100;

                $this->data['discount_amount_cart'] = 0;
                $total = $this->currency->format($order_info['total'] - $this->cart->getSubTotal(), $order_info['currency_code'], false, false);

                if ($total > 0) {
                    $this->data['products'][] = array(
                        'name' => $this->language->get('text_total'),
                        'model' => '',
                        'price' => number_format($total * 100, 0, '', ''),
                        'quantity' => 1,
                        'option' => array(),
                        'weight' => 0
                    );
                } else {
                    $this->data['discount_amount_cart'] -= $total;
                }

                $this->data['currency_code'] = $order_info['currency_code'];
                $this->data['first_name'] = html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8');
                $this->data['last_name'] = html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');
                $this->data['address1'] = html_entity_decode($order_info['payment_address_1'], ENT_QUOTES, 'UTF-8');
                $this->data['address2'] = html_entity_decode($order_info['payment_address_2'], ENT_QUOTES, 'UTF-8');
                $this->data['city'] = html_entity_decode($order_info['payment_city'], ENT_QUOTES, 'UTF-8');
                $this->data['zip'] = html_entity_decode($order_info['payment_postcode'], ENT_QUOTES, 'UTF-8');
                $this->data['country'] = $order_info['payment_iso_code_2'];
                $this->data['email'] = $order_info['email'];
                $this->data['invoice'] = $this->session->data['order_id'] . ' - ' . html_entity_decode($order_info['payment_firstname'], ENT_QUOTES, 'UTF-8') . ' ' . html_entity_decode($order_info['payment_lastname'], ENT_QUOTES, 'UTF-8');
                $this->data['lc'] = $this->session->data['language'];
                $this->data['return'] = $this->url->link('payment/adyen/callback');

                if (!$this->config->get('adyen_transaction')) {
                    $this->data['paymentaction'] = 'authorization';
                } else {
                    $this->data['paymentaction'] = 'sale';
                }

                $this->data['custom'] = $this->session->data['order_id'];

                $sign = $this->data['totalAmount'] . $this->data['currency_code'] . $this->data['shipBeforeDate'] . $this->data['merchantReference'] . $this->data['skinCode'] . $this->data['merchantAccount']
                        . $this->data['sessionValidity'] . $this->data['email'] . $this->session->data['order_id'];

                $this->data['merchantSig'] = base64_encode(hash_hmac('sha1', $sign, $sharedSecret, true));
            }

            if (!$this->config->get('adyen_test')) {
                $POSTURL = 'https://pal-live.adyen.com/pal/adapter/httppost';

                $sharedSecret = $this->config->get('adyen_hmac_live');
            } else {
                $POSTURL = 'https://pal-test.adyen.com/pal/adapter/httppost';

                $sharedSecret = $this->config->get('adyen_hmac_test');
            }

//            $user = 'ws_895123@Company.Fullserviceplatform';
//            $password = '}qMm>G7pP&Vg71Q7v9y=Cx*DV';
            $user = 'ws@Company.Fullserviceplatform';
            $password = 'y\NNZYe<Z)1Y1u%3?M>6D7@6y';
            $data = array(
                'action' => 'Payment.authorise',
                'paymentRequest.amount.currency' => $this->data['currencyCode'],
                'paymentRequest.amount.value' => $this->data['totalAmount'],
                'paymentRequest.merchantAccount' => $this->config->get('adyen_email'),
                'paymentRequest.reference' => $this->data['merchantReference'],
//                'paymentRequest.recurring.contract' => 'RECURRING',
                'paymentRequest.shopperReference' => $this->data['first_name'],
                'paymentRequest.shopperEmail' => $this->data['email'],
                'paymentRequest.additionalData.card.encrypted.json' => urlencode($_POST['adyen-encrypted-data']),
            );

            $fields_string = '';
            foreach ($data as $key => $value) {
                $fields_string .= $key . '=' . $value . '&';
            }
            rtrim($fields_string, '&');
            
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_URL, $POSTURL);
            curl_setopt($ch, CURLOPT_USERPWD, "$user:$password");
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POST, count($data));
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
            curl_setopt($ch, CURLOPT_HEADER, 0);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            print_r($ch);
            $val = curl_exec($ch);
            curl_close($ch);

            if (!$val) {
                $this->redirect($this->url->link('checkout/checkout'));
            } else {
                $paymentResult = array();
                $paymentResultTmp = explode("&", $val);
                foreach ($paymentResultTmp as $paymentResultTmpvalue) {
                    $paymentResultTmpval = explode("=", $paymentResultTmpvalue);
                    $paymentResult[$paymentResultTmpval[0]] = $paymentResultTmpval[1];
                }
            }
            if ($paymentResult) {
                if ($paymentResult['paymentResult.resultCode'] == 'Authorised') {
                    $this->redirect($this->url->link('checkout/success'));
                } else {
                    $reason = preg_replace('/^[^a-zA-Z]$/',' ',preg_replace('/[0-9]/','',$paymentResult["paymentResult.refusalReason"]));
                    $this->redirect($this->url->link('checkout/checkout').'&paymentResult='.$paymentResult["paymentResult.resultCode"].' - '.$reason);
                }
            }
        }
    }
    
    function checkfields()
    {
        echo "test";
        exit;
    }

}

?>