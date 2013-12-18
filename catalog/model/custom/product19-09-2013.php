<?php

class ModelCustomProduct extends Model {

    public function getallOptions() {
        $result = array();
         $qry = "SELECT O.option_id, O.info_view_type, OVD.name, OVD.option_value_id, OV.html 
                FROM `" . DB_PREFIX . "option` O
                LEFT JOIN option_value OV
                ON O.option_id = OV.option_id
                LEFT JOIN option_value_description OVD
                ON OV.option_value_id = OVD.option_value_id 
                WHERE OVD.language_id='" . (int) $this->config->get('config_language_id') . "'
                    ORDER BY OV.sort_order";

        $product_option_query = $this->db->query($qry);
        if ($product_option_query->num_rows > 0) {
            foreach ($product_option_query->rows as $data) {
                $result[$data['option_id']][] = array('name' => $data['name'], 'option_value_id' => $data['option_value_id'], 'html' => $data['html']);
                $result[$data['option_id']]['info_view_type'] = $data['info_view_type'];
            }
        }
        return $result;
    }
    
    public function getProductOptions($product_id) {
		$product_option_data = array();
		
		$product_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = array();	
				
			$product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value WHERE product_option_id = '" . (int)$product_option['product_option_id'] . "'");
				
			foreach ($product_option_value_query->rows as $product_option_value) {
                            
                           $option_name= $this->db->query("SELECT name FROM " . DB_PREFIX . "option_value_description WHERE option_value_id = '" . (int)$product_option_value['option_value_id'] . "' and language_id='" . (int)$this->config->get('config_language_id') . "'");
                           
                         
				$product_option_value_data[] = array(
					
                                    'name'=>$option_name->row['name']
				);
			}
				
			$product_option_data[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],			
				'product_option_value' => $product_option_value_data,
				'option_value'         => $product_option['option_value'],
				'required'             => $product_option['required']				
			);
		}
		
		return $product_option_data;
	}
			


    

}

?>