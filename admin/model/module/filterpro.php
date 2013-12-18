<?php

class ModelModuleFilterPro extends Model {

    public function getStores() {
        $storeData = array();

        $query = $this->db->query("select * FROM " . DB_PREFIX . "store order by name");

        foreach ($query->rows as $store) {

            $storeData[] = array('id' => $store['store_id'],
                'name' => $store['name']
            );
        }
        return $storeData;
    }

    public function getSettingFilterPro($group, $store_id = 0) {
        $data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int) $store_id . "' AND `group` = '" . $this->db->escape($group) . "'");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $data[$result['key']] = $result['value'];
            } else {
                $data[$result['key']] = unserialize($result['value']);
            }
        }


        return $data;
    }

    public function getAttributesByStore($store_id = 0) {
        $attribute_data = array();
        $query_gp = "select attribute_group.*,attribute_group_description.name
            from attribute_group 
            left join attribute_group_description 
            on attribute_group_description.attribute_group_id = attribute_group.attribute_group_id 
            where attribute_group.store='" . (int) $store_id . "' and attribute_group_description.language_id='" . (int) $this->config->get('config_language_id') . "'";
        $query_rs = $this->db->query($query_gp);

        if (!empty($query_rs->rows)) {
            foreach ($query_rs->rows as $gp_data) {
                $query_att = "select attribute_description.* from attribute_description left join attribute on attribute_description.attribute_id=attribute.attribute_id where attribute.attribute_group_id=  '" . (int) $gp_data['attribute_group_id'] . "' and attribute_description.language_id='" . (int) $this->config->get('config_language_id') . "'";
                $query_att_rs = $this->db->query($query_att);
                if (!empty($query_att_rs->rows)) {
                    foreach ($query_att_rs->rows as $att_data) {
                        $attribute_data[] = array('attribute_id' => $att_data['attribute_id'],
                            'attribute_group_id' => $gp_data['attribute_group_id'],
                            'sort_order' => 0,
                            'language_id' => $att_data['language_id'],
                            'name' => $att_data['name'],
                            'attribute_group' => $gp_data['name']);
                    }
                }
            }
        }

        return $attribute_data;
    }

}

?>