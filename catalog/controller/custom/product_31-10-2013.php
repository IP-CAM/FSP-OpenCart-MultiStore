<?php

class ControllerCustomProduct extends Controller {

    public function add() {
        $this->language->load('checkout/cart');
        $hold = array();
        $json = array();

        if (isset($this->request->post['product_id'])) {
            $product_id = $this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        if ($product_info) {
            if (isset($this->request->post['quantity'])) {
                $quantity = $this->request->post['quantity'];
            } else {
                $quantity = 1;
            }

            if (isset($this->request->post['option'])) {
                $option = array_filter($this->request->post['option']);
            } else {
                $option = array();
            }

            $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

            if (isset($this->session->data['cart'])) {

                $hold = $this->session->data['cart'];
                unset($this->session->data['cart']);

                if (!$option) {
                    $keyx = (int) $product_id;
                } else {
                    $keyx = (int) $product_id . ':' . base64_encode(serialize($option));
                }
                unset($this->session->data['cart'][$keyx]);
                $this->data = array();
                $qty = $quantity;
                $this->session->data['cart'][$keyx] = (int) $qty;
                $json['success'] = '0';

                unset($this->session->data['shipping_method']);
                unset($this->session->data['shipping_methods']);
                unset($this->session->data['payment_method']);
                unset($this->session->data['payment_methods']);

/* Totals */
                $this->load->model('setting/extension');

                $total_data = array();
                $total = 0;
                $taxes = $this->cart->getTaxes();

/* Display prices */
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
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

                        $sort_order = array();

                        foreach ($total_data as $key => $value) {
                            $sort_order[$key] = $value['sort_order'];
                        }

                        array_multisort($sort_order, SORT_ASC, $total_data);
                    }
                }
                if (isset($this->session->data['cart'][$keyx])) {
                    unset($this->session->data['cart'][$keyx]);
                }
                if ($this->config->get('config_tax') == '0') {
                    $val = array_sum($taxes);
                    $total = $total - $val;
                }

                $this->session->data['cart'] = $hold;
                $json['total'] = sprintf($this->currency->format($total));
                $tax = $total - array_sum($taxes);
                $json['tax'] = sprintf($this->currency->format($tax));
            } else {
                $json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
            }
        }
        $this->response->setOutput(json_encode($json));
    }
    
    public function test(){
      
         $this->load->model('checkout/order');
          $this->load->model('custom/product');
         echo "yes";
        //$this->model_checkout_order->confirm(150, 0, $comment = '', TRUE);
        $this->model_custom_product->sendConfirmationEmail(149, 0, $comment = '', TRUE);
    }

}
?>