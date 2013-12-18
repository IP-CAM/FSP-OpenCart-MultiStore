<?php
class ControllerModuleCPF extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/cpf');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('latest', $this->request->post);		
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_text'] = $this->language->get('text_text');
		$this->data['text_file'] = $this->language->get('text_file');
		$this->data['text_datetime'] = $this->language->get('text_datetime');
		$this->data['text_textarea'] = $this->language->get('text_textarea');
		$this->data['text_date'] = $this->language->get('text_date');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_radio'] = $this->language->get('text_radio');
		$this->data['text_checkbox'] = $this->language->get('text_checkbox');
		$this->data['text_types'] = $this->language->get('text_types');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_type'] = $this->language->get('entry_type');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_required'] = $this->language->get('entry_required');
		$this->data['entry_unique_id'] = $this->language->get('entry_unique_id');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_field'] = $this->language->get('button_add_field');
		
		$this->data['error_type'] = $this->language->get('error_type');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/cpf', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->data['action'] = $this->url->link('module/cpf', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$fields = array();
		
		if (isset($this->request->post['cpf_fields'])) {
			$fields = $this->request->post['cpf_fields'];
		} elseif ($this->config->get('cpf_fields')) { 
			$fields = $this->config->get('cpf_fields');
		}
		
		$this->data['fields'] = array();
		
		$this->load->model('catalog/option');
		
		foreach ($fields as $field) {
			$option = $this->model_catalog_option->getOption($field['option_id']);
			
			if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
				$value = $this->model_catalog_option->getOptionValues($field['option_id']);
			} else {
				$value = array();
			}
			
			if ($option['type'] == 'select') {
				$type = $this->language->get('text_select');
			} elseif ($option['type'] == 'radio') {
				$type = $this->language->get('text_radio');
			} elseif ($option['type'] == 'checkbox') {
				$type = $this->language->get('text_checkbox');
			} elseif ($option['type'] == 'date') {
				$type = $this->language->get('text_date');
			} elseif ($option['type'] == 'datetime') {
				$type = $this->language->get('text_datetime');
			} elseif ($option['type'] == 'textarea') {
				$type = $this->language->get('text_textarea');
			} elseif ($option['type'] == 'text') {
				$type = $this->language->get('text_text');
			} elseif ($option['type'] == 'file') {
				$type = $this->language->get('text_file');
			} else {
				$type = '';
			}
			
			$this->data['fields'][] = array(
				'name'			=> $option['name'],
				'type'			=> $type,
				'option_id'		=> $field['option_id'],
				'required'		=> $field['required'],
				'status'		=> $field['status'],
				'sort_order'	=> $field['sort_order'],
				'values'		=> $value
			);
		}
				
		$this->template = 'module/cpf.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/cpf')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}	
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install() {
		$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description");
		$exists = false;
				
		foreach ($query->rows as $result) {
			if ($result['Field'] == 'cpf') {
				$exists = true;
				break;
			}
		}
		
		if (!$exists) {		
			$this->db->query("ALTER TABLE " . DB_PREFIX . "product_description ADD cpf longtext NOT NULL");
		}
	}
	
	public function uninstall() {
		$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_description");
		$exists = false;
				
		foreach ($query->rows as $result) {
			if ($result['Field'] == 'cpf') {
				$exists = true;
				break;
			}
		}
		
		if ($exists) {		
			$this->db->query("ALTER TABLE " . DB_PREFIX . "product_description DROP cpf");
		}
	}
	
	public function upload() {
		$this->language->load('common/filemanager');
		
		$json = array();
		
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
			
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
        		$json['error'] = $this->language->get('error_filename');
	  		}	  	
			
			$allowed = array();
			
			if (!$this->config->get('config_upload_allowed')) {
				$filetypes = explode("\n", $this->config->get('config_file_extension_allowed'));
			} else {
				$filetypes = explode(',', $this->config->get('config_upload_allowed'));
			}
			
			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			
			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_file_type');
       		}	
						
			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}
		
		if (!$json) {
			if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
				$file = basename($filename) . '.' . md5(mt_rand());
				
				// Hide the uploaded file name so people can not link to it directly.
				$json['file'] = $file;
				
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
			}
						
			$json['success'] = $this->language->get('text_uploaded');
		}	
		
		$this->response->setOutput(json_encode($json));		
	}
}
?>