<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
                                $this->document->setKeywords($this->config->get('config_meta_keywords'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
$this->load->model('catalog/category');
                                $this->load->model('catalog/product');
                                $this->load->model('tool/image');
                                $this->data['categories'] = array();
                
                                $categories_arr = array();
                                $cat_arr = array("11", "12","1015");
                                foreach ($cat_arr as $cat) {
                                    $categories_arr[] = $this->model_catalog_category->getCategories($cat);
                                }
                
                                foreach ($categories_arr as $categories) {
                                    foreach ($categories as $category) {
                                        if ($category['top']) {
                                            $data = array(
                                                'filter_category_id' => $category['category_id'],
                                                'filter_sub_category' => true
                                            );

                                            if ($category['image']) {
                                                $image = $this->model_tool_image->resize($category['image'], 300, 300);
                                            } else {
                                                $image = $this->model_tool_image->resize('data/no-image.jpg', 300, 300);
                                            }

                                            $product_total = $this->model_catalog_product->getTotalProducts($data);

                                            $this->data['categories'][] = array(
                                                    'name' => $category['name'],
                                                    'prod_count'=>($this->config->get('config_product_count') ?  $product_total  : ''),
                                                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'] ),
                                                    'thumb' => $image,
                                                    'desc'=> $category['short_desc']
                                            );
                                        }
                                    }
                                }
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>