<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons">
                <select name="store" onchange="loadstore(this.value);">
                    <option value="0">Default</option>
                    <?php foreach($stores as $store){ ?>
                    <option value="<?php echo $store['store_id']; ?>" <?php if($store['store_id'] == $curr_store){ echo 'selected="selected"'; } ?> ><?php echo $store['name']; ?></option>
                    <?php } ?> 
                </select>
                <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
                <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
            </div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tbody id="module-row">
                        <tr>
                            <td><?php echo $text_select_backbase_database; ?><td>
                            <td><select id="backbase_database" name="open_erp_settings_module[0][backbase_database]"><?php echo $backbase_database_options?></select><td>
                        </tr>
                        <tr>
                            <td><?php echo $text_select_backbase_path; ?><td>
                            <td><input size="100" name="open_erp_settings_module[0][backbase_path]" type="text" value="<?php echo isset($modules['backbase_path'])?$modules['backbase_path']:''; ?>" /><td>
                        </tr>
                        <tr>
                            <td><?php echo $text_select_boom; ?><td>
                            <td><select id="boom_store_id" name="open_erp_settings_module[0][boom_store_id]"><?php echo $boom_store_options?></select><td>
                        </tr>
                        <tr>
                            <td><?php echo $text_live_cal; ?><td>
                            <td>
                                <select name="open_erp_settings_module[0][live_cal_setting]">
                                    <option value="0" <?php if(isset($modules['live_cal_setting'])&& $modules['live_cal_setting']==0 ){ echo 'selected="selected"'; } ?> >Disable</option>
                                    <option value="1" <?php if(isset($modules['live_cal_setting'])&& $modules['live_cal_setting']==1 ){ echo 'selected="selected"'; } ?>>Enable</option>
                                </select>
                            <td>
                        </tr>
                        <tr>
                            <td><?php echo $text_store_invoice_prefix; ?><br/><span class="help"><?php echo $text_store_invoice_prefix_help; ?></span><td>
                            <td><input name="open_erp_settings_module[0][store_invoice_prefix]" value="<?php echo isset($modules['store_invoice_prefix'])?$modules['store_invoice_prefix']:''; ?>" /><td>
                        </tr>
                        <tr>
                            <td><?php echo $text_status; ?><td>
                            <td>
                                <select name="open_erp_settings_module[0][status]">
                                    <option value="0" <?php if(isset($modules['status'])&& $modules['status']==0 ){ echo 'selected="selected"';} ?> >Disable</option>
                                    <option value="1" <?php if(isset($modules['status'])&& $modules['status']==1 ){ echo 'selected="selected"'; } ?>>Enable</option>
                                </select>
                            <td>
                        </tr>
                    <input type="hidden" name="open_erp_settings_module[0][layout_id]" value="" />
                    <input type="hidden" name="open_erp_settings_module[0][position]" value="" />
                    <input type="hidden" name="store_id" value="<?php echo $_GET['store_id']; ?>" />
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    function loadstore(id){
        var url ='<?php echo html_entity_decode($action); ?>';
        if( id > 0 ){
            location =url+'&store_id='+id;
        }else{
            location =url;
        }
    }
    
    $("#backbase_database").change(function(){ 
         $.ajax({
            url: '<?php echo html_entity_decode($stores_url); ?>',
            type: 'post',
            data: {
                'backbase_database' : $(this).val()
            },
            success: function(json) {
                $('#boom_store_id').html(json);
            }
        });
    });
//--></script> 
<?php echo $footer; ?>