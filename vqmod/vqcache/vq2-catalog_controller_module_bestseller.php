<?php
class ControllerModuleBestSeller extends Controller {
	protected function index($setting) {

                            $setting=array();
                            
                          $this->load->model('setting/setting');
                      $feat_prod = $this->model_setting_setting->getSetting('bestseller',$this->config->get('config_store_id'));
                           
                         
                          if(isset($feat_prod['bestseller_module'])){
                           $setting =  $feat_prod['bestseller_module'][0];
                            }

		$this->language->load('module/bestseller');
 
      	$this->data['heading_title'] = $this->language->get('heading_title');

                            if(!empty($setting))  
                 {

				
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['position'] = $setting['position'];
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image');

		$this->data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
		
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
			} else {
				$image = false;
			}
			
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
					
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}	
			
			if ($this->config->get('config_review_status')) {
				$rating = $result['rating'];
			} else {
				$rating = false;
			}
							
			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'thumb'   	 => $image,
				'name'    	 => $result['name'],
				'price'   	 => $price,
				'special' 	 => $special,
				'rating'     => $rating,
				'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
			);
		}
              
                $this->load->model('catalog/information');
		
                $this->data['info'] = $this->model_catalog_information->getInformation(8);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/bestseller.tpl';
		} else {
			$this->template = 'default/template/module/bestseller.tpl';
		}

		$this->render();

                            }

	}
}
?>