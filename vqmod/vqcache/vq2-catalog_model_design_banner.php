<?php
class ModelDesignBanner extends Model {	
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner_image bi WHERE bi.banner_id = '" . (int) $banner_id . "' AND bi.language_id = '" . (int) $this->config->get('config_language_id') . "'");
		
		return $query->rows;
	}
	
	public function getBannerDetails($banner_id) {
	    
		$query = $this->db->query("SELECT * FROM  banner WHERE banner_id = '" .(int)$banner_id ."'");
		
		return $query->rows;
	}
}
?>