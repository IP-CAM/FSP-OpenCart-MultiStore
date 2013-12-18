<?php  
class ControllerModuleBanner extends Controller {
	protected function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');
		 
		$this->document->addScript('catalog/view/javascript/jquery/jquery.cycle.js');
				
		$this->data['banners'] = array();
		
		$banDeails=array();
		
	   if(isset($setting['banner_store']))
	   {
              
	       if(in_array($this->config->get('config_store_id'),$setting['banner_store']))
		   {
				$results = $this->model_design_banner->getBanner($setting['banner_id']);
				
				$banDeails = $this->model_design_banner->getBannerDetails($setting['banner_id']);
			
				foreach ($results as $result) {
					if (file_exists(DIR_IMAGE . $result['image'])) {
						$this->data['banners'][] = array(
							'title' => $result['title'],
							'link'  => $result['link'],
							'bannerType'  => $banDeails[0]['bannerType'],
							'bannerStyle'  => $banDeails[0]['bannerStyle'],
							'bannerHTML'  => html_entity_decode($result['bannerHTML'], ENT_QUOTES, 'UTF-8'),
							'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
						);
					}
				}
		   }
                   
                   
                  
			
		}
		else
		{
                   
		   $results = $this->model_design_banner->getBanner($setting['banner_id']);
		   
		   $banDeails = $this->model_design_banner->getBannerDetails($setting['banner_id']);
		   	  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'bannerType'  => $banDeails[0]['bannerType'],
						'bannerStyle' => $banDeails[0]['bannerStyle'],
						'bannerHTML'  => html_entity_decode($result['bannerHTML'], ENT_QUOTES, 'UTF-8'),
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		   
		}
		
		
		$this->data['module'] = $module++;
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/banner.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/banner.tpl';
		} else {
                  
			$this->template = 'default/template/module/banner.tpl';
		}
		
		$this->render();
	}
}
?>