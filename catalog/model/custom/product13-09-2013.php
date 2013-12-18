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

}

?>