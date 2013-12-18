<?php echo $header; ?>
<style>
    #add-image{
        display: inline;
        float: right;
    }
    div.image{
        position: relative;
    }
    div.image a#remove{
        position: absolute;
        right: 0;
        top: 0;
    }
</style>
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
            <h1><img src="view/image/banner.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><span class="required">*</span> <?php echo $entry_name; ?></td>
                        <td><input type="text" name="name" value="<?php echo $name; ?>" size="100" />
                            <?php if ($error_name) { ?>
                            <span class="error"><?php echo $error_name; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $entry_status; ?></td>
                        <td><select name="status">
                                <?php if ($status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td>
                            <input type="radio" name="bannerType" value="html" <?php if ($bannerType=='html' || $bannerType=='') { echo 'checked="checked"'; } ?>/>HTML
                                   <input type="radio" name="bannerType" value="image"  <?php if ($bannerType=='image') { echo 'checked="checked"'; } ?>/>Image
                        </td>
                    </tr>
                    <tr>
                        <td>Fade In/Fade Out</td>
                        <td>
                            <input type="radio" name="bannerStyle" value="1" <?php if ($bannerStyle=='1') { echo 'checked="checked"'; } ?>/>Yes
                                   <input type="radio" name="bannerStyle" value="0"  <?php if ($bannerStyle=='0') { echo 'checked="checked"'; } ?>/>No
                        </td>
                    </tr>
                </table>
                <div id="tab-general">
                    <div id="languages" class="htabs">
                        <?php foreach ($languages as $language) { ?>
                        <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                        <?php } ?>
                    </div>
                    <?php foreach ($languages as $language) { ?>
                    <div id="language<?php echo $language['language_id']; ?>">
                        <?php $image_row = $language['language_id']; ?>
                        <?php if(isset($banners[$language['language_id']])){ ?>
                        <?php $banner = $banners[$image_row]; ?>
                        <?php }else{ ?>
                        <?php $banner = array('title' => '','bannerHTML' => '','image' => array(),'thumb' => array($no_image)); ?>
                        <?php } ?>
                        <table id="images" class="form">
                            <tr id="image-row<?php echo $image_row; ?>">
                                <td class="left"><span class="required">*</span> <?php echo $entry_title; ?></td>
                                <td class="left">
                                    <input type="text" name="banner_image[<?php echo $image_row; ?>][title]" value="<?php echo isset($banner['title']) ? $banner['title'] : ''; ?>" />
                                    <?php if (isset($error_banner_image[$image_row])) { ?>
                                    <span class="error"><?php echo $error_banner_image[$image_row]; ?></span>
                                    <?php } ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="left"><?php echo $entry_image; ?></td>
                                <td class="left">
                                    <?php foreach($banner['image'] as $key=>$banner_img_tumb){ ?>
                                    <div class="image">
                                        <img src="<?php echo $banner_img_tumb['thumb']; ?>" alt="" id="thumb_<?php echo $image_row.'_'.$key; ?>" />
                                        <input type="hidden" name="banner_image[<?php echo $image_row; ?>][image][<?php echo $key; ?>]" value="<?php echo $banner_img_tumb['image']; ?>" id="image_<?php echo $image_row.'_'.$key; ?>"  />
                                        <br/>
                                        <a onclick="image_upload('image_<?php echo $image_row; ?>_<?php echo $key; ?>', 'thumb_<?php echo $image_row; ?>_<?php echo $key; ?>');"><?php echo $text_browse; ?></a>
                                        &nbsp;&nbsp;|&nbsp;&nbsp;
                                        <a onclick="$('#thumb_<?php echo $image_row; ?>_<?php echo $key; ?>').attr('src', '<?php echo $no_image; ?>');
                                            $('#image_<?php echo $image_row; ?>_<?php echo $key; ?>').attr('value', '');"><?php echo $text_clear; ?></a>
                                    </div>
                                    <?php } ?>
                                    <span id="add-image" onclick="add_image_upload(this,'<?php echo $image_row; ?>')" ><img src="../image/data/icons/icon_add_slideshow.png" alt="Add" /></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="left">HTML</td>
                                <td class="left">
                                    <textarea name="banner_image[<?php echo $image_row; ?>][bannerHTML]" id="banner_html<?php echo $image_row; ?>"><?php echo isset($banner['bannerHTML']) ? $banner['bannerHTML'] : ''; ?></textarea>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <?php } ?>
                </div>

            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"><!-- //--></script>

<script type="text/javascript"><!--
    var languages = $.parseJSON('<?php echo json_encode($languages); ?>');
    for (var language in languages) {
    CKEDITOR.replace("banner_html" + languages[language].language_id, {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
}

//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
$('#dialog').remove();

$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

$('#dialog').dialog({
title: '<?php echo $text_image_manager; ?>',
close: function(event, ui) {
if ($('#' + field).attr('value')) {
$.ajax({
url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
dataType: 'text',
success: function(data) {
$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
}
});
}
},
bgiframe: false,
width: 700,
height: 400,
resizable: false,
modal: false
});
}

function add_image_upload (add,image_row){
var arr_index = parseInt($(add).parent("td").children("div.image").length);
var index = parseInt($(add).parent("td").children("div.image").length);
$(add).before('<div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb_'+image_row+'_'+index+'" /><input type="hidden" name="banner_image['+image_row+'][image]['+arr_index+']" value="" id="image_'+image_row+'_'+index+'"  /><br/><a onclick="image_upload(\'image_'+image_row+'_'+index+'\', \'thumb_'+image_row+'_'+index+'\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb_'+image_row+'_'+index+'\').attr(\'src\', \'<?php echo $no_image; ?>\');$(\'#image_'+image_row+'_'+index+'\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div>');
addHoverBlur();
}

function addHoverBlur(){
$('div.image').hover(function() {
$(this).append('<a id="remove" onclick="removediv(this);" ><img src="../image/data/icons/delete.png" alt="Remove" /></a>');
},
function() {
$(this).children("a#remove").remove();
});
}

addHoverBlur();

function removediv(remove){
$(remove).parent("div.image").remove();
}

//--></script>  
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#languages a').tabs();
//--></script> 
<?php echo $footer; ?>