<?php
class ControllerCustomOrder extends Controller {
	private $error = array();

  	public function index() {
		$this->language->load('sale/order');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

    	$this->getList();
  	}
	
  	function getPaddingOrders(){
            $this->load->model('custom/order');
            $order_status=1;
            $reults = $this->model_custom_order->getOrdersBystatus($order_status);
            echo "<pre>";
            print_r($reults);
        }
  	
}
?>
