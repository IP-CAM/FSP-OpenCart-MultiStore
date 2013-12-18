<?php

class ControllerModuleBannerCustom extends Controller {

    protected function index($setting) {

        if (isset($setting['banner_id']) && !empty($setting['banner_id'])) {
            static $module = 0;
            $this->load->model('module/banner_custom');
            $this->load->model('tool/image');
            $this->document->addScript('catalog/view/javascript/jquery/jquery.cycle.js');

            $this->data['banners'] = array();

            $results = $this->model_module_banner_custom->getBanner($setting['banner_id']);
            $banDeails = $this->model_module_banner_custom->getBannerDetails($setting['banner_id']);

            if (empty($results)) {
                return;
            }

            $this->data['banners']['config'] = array(
                'bannerType' => $banDeails[0]['bannerType'],
                'bannerStyle' => $banDeails[0]['bannerStyle']
            );

            if (isset($setting['banner_store'])) {
                if (in_array($this->config->get('config_store_id'), $setting['banner_store'])) {
                    $this->data['banners']['banners'] = $this->getBanners($results, $setting);
                } else {
                    return;
                }
            } else {
                $this->data['banners']['banners'] = $this->getBanners($results, $setting);
            }

            $this->data['module'] = $module++;



            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/banner_custom.tpl')) {
                $this->template = $this->config->get('config_template') . '/template/module/banner_custom.tpl';
            } else {
                $this->template = 'default/template/module/banner_custom.tpl';
            }
            $this->render();
        }
    }

    private function getBanners($results, $setting) {

        $banners = array();

        foreach ($results as $result) {
            $image_arr = array();
            if ($this->is_serialized($result['image'])) {
                $banner_images_arr = @unserialize($result['image']);
                if (is_array($banner_images_arr)) {
                    foreach ($banner_images_arr as $ban_images) {
                        if ($ban_images && file_exists(DIR_IMAGE . $ban_images)) {
                            $image = $ban_images;
                        } else {
                            $image = 'no_image.jpg';
                        }
                        $image_arr[] = $this->model_tool_image->resize($image, $setting['width'], $setting['height']);
                    }
                }
                $banners[] = array(
                    'title' => $result['title'],
                    'link' => $result['link'],
                    'bannerHTML' => html_entity_decode($result['bannerHTML'], ENT_QUOTES, 'UTF-8'),
                    'image' => $image_arr
                );
            } elseif (file_exists(DIR_IMAGE . $result['image'])) {
                $banners[] = array(
                    'title' => $result['title'],
                    'link' => $result['link'],
                    'bannerHTML' => html_entity_decode($result['bannerHTML'], ENT_QUOTES, 'UTF-8'),
                    'image' => array($this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']))
                );
            } else {
                $banners[] = array(
                    'title' => $result['title'],
                    'link' => $result['link'],
                    'bannerHTML' => html_entity_decode($result['bannerHTML'], ENT_QUOTES, 'UTF-8'),
                    'image' => array($this->model_tool_image->resize('no-image.png', $setting['width'], $setting['height']))
                );
            }
        }

        return $banners;
    }

    function is_serialized($data) {
        // if it isn't a string, it isn't serialized
        if (!is_string($data))
            return false;
        $data = trim($data);
        if ('N;' == $data)
            return true;
        if (!preg_match('/^([adObis]):/', $data, $badions))
            return false;
        switch ($badions[1]) {
            case 'a' :
            case 'O' :
            case 's' :
                if (preg_match("/^{$badions[1]}:[0-9]+:.*[;}]\$/s", $data))
                    return true;
                break;
            case 'b' :
            case 'i' :
            case 'd' :
                if (preg_match("/^{$badions[1]}:[0-9.E-]+;\$/", $data))
                    return true;
                break;
        }
        return false;
    }

}

?>