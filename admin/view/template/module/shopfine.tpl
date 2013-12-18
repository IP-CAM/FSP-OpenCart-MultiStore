<?php echo $header; ?>

<?php 
	$bgpatterns = array(
		'pattern1' 		=> 'Pattern 1',
		'pattern2' 		=> 'Pattern 2',
		'pattern3' 		=> 'Pattern 3',
		'pattern4' 		=> 'Pattern 4',
		'pattern5' 		=> 'Pattern 5',
		'pattern6' 		=> 'Pattern 6',
		'pattern7' 		=> 'Pattern 7',
		'pattern8' 		=> 'Pattern 8',
		'pattern9' 		=> 'Pattern 9',
		'pattern10' 	=> 'Pattern 10',
		'pattern11' 	=> 'Pattern 11',
		'pattern12' 	=> 'Pattern 12',
		'pattern13' 	=> 'Pattern 13',
		'pattern14' 	=> 'Pattern 14',
		'pattern15' 	=> 'Pattern 15',
		'pattern16' 	=> 'Pattern 16',
		'pattern17' 	=> 'Pattern 17',
		'pattern18' 	=> 'Pattern 18',
		'pattern19' 	=> 'Pattern 19',
		'pattern20' 	=> 'Pattern 20',
		'pattern21' 	=> 'Pattern 21',
		'pattern22' 	=> 'Pattern 22',
		'pattern23' 	=> 'Pattern 23',
		'pattern24' 	=> 'Pattern 24',
		'pattern25' 	=> 'Pattern 25',
		'pattern26' 	=> 'Pattern 26',
		'pattern27' 	=> 'Pattern 27'

	);
	
	$colorschemes = array(
		'blue' 		=> 'Theme blue',
		'brown' 		=> 'Theme brown',
		'green' 		=> 'Theme green',
		'orange' 		=> 'Theme orange',
		'red' 		=> 'Theme red',
	

	);
	
	$bgcolors = array(
		'col1' 			=> 'Color 1',
		'col2' 			=> 'Color 2',
		'col3' 			=> 'Color 3',
		'col4' 			=> 'Color 4',
		'col5' 			=> 'Color 5',
		'col6' 			=> 'Color 6',
		'col7' 			=> 'Color 7',
		'col8' 			=> 'Color 8',
		'col9' 			=> 'Color 9',
		'col10' 		=> 'Color 10',
		'col11' 		=> 'Color 11',
		'col12' 		=> 'Color 12',
		'col13' 		=> 'Color 13',
		'col14' 		=> 'Color 14',
		'col15' 		=> 'Color 15',
		'col16' 		=> 'Color 16',
		'col17' 		=> 'Color 17',
		'col18' 		=> 'Color 18',
		'col19' 		=> 'Color 19',
		'col20' 		=> 'Color 20',
		'col21' 		=> 'Color 21',
		'col22' 		=> 'Color 22',
		'col23' 		=> 'Color 23',
		'col24' 		=> 'Color 24',
		'col25' 		=> 'Color 25',
		'col26' 		=> 'Color 26',
		'col27' 		=> 'Color 27'

	);
	
	$s_links = array(
		'facebook' 				=> 'Facebook',
		'twitter' 				=> 'Twitter',
		'googleplus' 			=> 'Google+',
		'pinterest' 			=> 'Pinterest',
		'dribbble' 				=> 'Dribbble',
		'rss' 					=> 'RSS',
		'flickr' 				=> 'Flickr',
		'linkedin' 				=> 'Linkedin',
		'skype' 				=> 'Skype',
		'vimeo' 				=> 'Vimeo',
		'tumblr' 				=> 'Tumblr',
		'behance' 				=> 'Behance',
		'youtube' 				=> 'Youtube',
		'yahoo' 				=> 'Yahoo',
		'stumbleupon' 			=> 'Stumbleupon',
		'forrst' 				=> 'Forrst',
		'instagram' 			=> 'Instagram',
		'amazon' 				=> 'Amazon',
		'lastfm' 				=> 'Lastfm',
		'picasa' 				=> 'Picasa',
		'paypal' 				=> 'Paypal',
		'deviantart' 			=> 'Deviantart',
		'digg' 					=> 'Digg',
		'blogger' 				=> 'Blogger',
		'wordpress' 			=> 'Wordpress',
		'github' 				=> 'Github',
		'spotify' 				=> 'Spotify',
		'dropbox' 				=> 'Dropbox',
		'evernote' 				=> 'Evernote'

	);
?>

<style type="text/css">
	.pclass { color: #666; font-size:0.9em;width: 100%;display: inline; }
	.backgrouns {width:32px; display: inline-block; text-align: center;}
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
		<h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
                 
		<div class="buttons">
                    <select name="store" onchange="loadstore(this.value);">
                    <option value="0">Default</option>
                    <?php foreach($stores as $store){ ?>
                    <option value="<?php echo $store['store_id']; ?>" <?php if($store['store_id'] == $curr_store){ echo 'selected="selected"'; } ?> ><?php echo $store['name']; ?></option>
                    <?php } ?> 
                </select>
                    <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
	</div>

	<div class="content">

		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

			<div id="tabs" class="htabs clearfix">
				<a href="#general_settings">General</a>
				<a href="#footer_settings">Footer</a>
			
			</div>
			
			<div id="general_settings" class="divtab">
			
				<div id="general_settings_tabs" class="vtabs">
					<a href="#options" class="selected">Options</a>
				
				</div>
				
				<div id="options" class="vtabs-content" style="">
					<table class="form">
						<h2>Options</h2>
						<tr>
							<td>Theme Panel:<br /><span class="help">Note: Disable it for display changes. It's just for live preview.</span></td>
							<td>
								<select name="shopfine[themePanel]">
									<option value="disable" <?php if(isset($shopfine['themePanel']) && $shopfine['themePanel']=='disable'){ echo 'selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									<option value="enable" <?php if(isset($shopfine['themePanel']) && $shopfine['themePanel']=='enable'){ echo 'selected="selected"'; }?>><?php echo $text_enabled; ?></option>
								</select>
							</td>
						</tr>
						
					</table>
				</div>
				
				
				
			

			</div>

			<div id="footer_settings" class="divtab">
			
				<div id="footer_settings_tabs" class="vtabs">
					<a href="#information" class="selected">Information Module</a>
					<a href="#facebook" style="">Facebook Module</a>
					<a href="#twitter" style="">Twitter Module</a>
					<a href="#custom" style="">Custom Module</a>
					<a href="#others" style="">Others</a>
				</div>
				
				<div id="information" class="vtabs-content" style="">
					<table class="form">
						<h2>Footer Information Module</h2>
						<tr>
							<td>Enable Module:</td>
							<td>
								<select name="shopfine[infoEnable]">
									<option value="disable" <?php if(isset($shopfine['infoEnable']) && $shopfine['infoEnable']=='disable'){ echo 'selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									<option value="enable" <?php if(isset($shopfine['infoEnable']) && $shopfine['infoEnable']=='enable'){ echo 'selected="selected"'; }?>><?php echo $text_enabled; ?></option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Module Title:<br /><span class="help">Example: Abous Us</span></td>
							<td>
							   <input type="text" name="shopfine[aboutTitle]" value="<?php if(isset($shopfine['aboutTitle'])){ echo $shopfine['aboutTitle']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>
								Footer About Text: <br />
								<span class="help">You can use images</span>
							</td>
							<td><textarea name="shopfine[footer_information]" cols="52" rows="5"><?php if(isset($shopfine['footer_information'])){ echo $shopfine['footer_information']; } ?></textarea>
							</td>
						</tr>
					</table>
				</div>
				
				<div id="facebook" class="vtabs-content" style="">
					<table class="form">
						<h2>Facebook Module</h2>
						<tr>
							<td>Enable Module:</td>
							<td>
								<select name="shopfine[facebookEnable]">
									<option value="disable" <?php if(isset($shopfine['facebookEnable']) && $shopfine['facebookEnable']=='disable'){ echo 'selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									<option value="enable" <?php if(isset($shopfine['facebookEnable']) && $shopfine['facebookEnable']=='enable'){ echo 'selected="selected"'; }?>><?php echo $text_enabled; ?></option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Module Title:<br /><span class="help">Example: Find Us On Facebook</span></td>
							<td>
							   <input type="text" name="shopfine[facebookTitle]" value="<?php if(isset($shopfine['facebookTitle'])){ echo $shopfine['facebookTitle']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>Facebook Page Link:<br /><span class="help">Example: https://www.facebook.com/envato</span></td>
							<td>
							   <input type="text" name="shopfine[facebookAccount]" value="<?php if(isset($shopfine['facebookAccount'])){ echo $shopfine['facebookAccount']; } ?>" size="50" />
							</td>
						</tr>
					</table>
				</div>
				
				<div id="twitter" class="vtabs-content" style="">
					<table class="form">
						<h2>Twitter Module</h2>
						<tr>
							<td>Enable Module:</td>
							<td>
								<select name="shopfine[twitterEnable]">
									<option value="disable" <?php if(isset($shopfine['twitterEnable']) && $shopfine['twitterEnable']=='disable'){ echo 'selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									<option value="enable" <?php if(isset($shopfine['twitterEnable']) && $shopfine['twitterEnable']=='enable'){ echo 'selected="selected"'; }?>><?php echo $text_enabled; ?></option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Module Title:<br /><span class="help">Example: Follow Us On Twitter</span></td>
							<td>
							   <input type="text" name="shopfine[twitterTitle]" value="<?php if(isset($shopfine['twitterTitle'])){ echo $shopfine['twitterTitle']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>Twitter Account:</td>
							<td>
							   <input type="text" name="shopfine[twitterAccount]" value="<?php if(isset($shopfine['twitterAccount'])){ echo $shopfine['twitterAccount']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>Count:</td>
							<td>
								<select name="shopfine[twitterCount]">
									<option value="1" <?php if(isset($shopfine['twitterCount']) && $shopfine['twitterCount']=='1'){ echo 'selected="selected"'; }?>>1</option>
									<option value="2" <?php if(isset($shopfine['twitterCount']) && $shopfine['twitterCount']=='2'){ echo 'selected="selected"'; }?>>2</option>
									<option value="3" <?php if(isset($shopfine['twitterCount']) && $shopfine['twitterCount']=='3'){ echo 'selected="selected"'; }?>>3</option>
									<option value="4" <?php if(isset($shopfine['twitterCount']) && $shopfine['twitterCount']=='4'){ echo 'selected="selected"'; }?>>4</option>
									<option value="5" <?php if(isset($shopfine['twitterCount']) && $shopfine['twitterCount']=='5'){ echo 'selected="selected"'; }?>>5</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
				
				<div id="custom" class="vtabs-content" style="">
					<table class="form">
						<h2>Custom Footer</h2>
						<tr>
							<td>Enable Module:</td>
							<td>
								<select name="shopfine[customEnable]">
									<option value="disable" <?php if(isset($shopfine['customEnable']) && $shopfine['customEnable']=='disable'){ echo 'selected="selected"'; }?>><?php echo $text_disabled; ?></option>
									<option value="enable" <?php if(isset($shopfine['customEnable']) && $shopfine['customEnable']=='enable'){ echo 'selected="selected"'; }?>><?php echo $text_enabled; ?></option>
								</select>
							</td>
						</tr>
						<tr>
							<td>Module Title:<br /><span class="help">Example: Contact Info</span></td>
							<td>
							   <input type="text" name="shopfine[customTitle]" value="<?php if(isset($shopfine['customTitle'])){ echo $shopfine['customTitle']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>Adress:</td>
							<td>
							   <input type="text" name="shopfine[adress]" value="<?php if(isset($shopfine['adress'])){ echo $shopfine['adress']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>Telephone:</td>
							<td>
							   <input type="text" name="shopfine[telephone]" value="<?php if(isset($shopfine['telephone'])){ echo $shopfine['telephone']; } ?>" size="50" />
							</td>
						</tr>
						<tr>
							<td>Fax:</td>
							<td>
							   <input type="text" name="shopfine[fax]" value="<?php if(isset($shopfine['fax'])){ echo $shopfine['fax']; } ?>" size="50" />
							</td>
						</tr>
						
						<tr>
							<td>E-mail:</td>
							<td>
							   <input type="text" name="shopfine[email]" value="<?php if(isset($shopfine['email'])){ echo $shopfine['email']; } ?>" size="50" />
							</td>
						</tr>
					</table>
				</div>
				<div id="others" class="vtabs-content" style="">
					<table class="form">
						<h2>Others</h2>
						<tr>
							<td>
								Footer Copyright Text:
							</td>
							<td>
								<input type="text" name="shopfine[footer_copyright]" value="<?php if(isset($shopfine['footer_copyright'])){ echo $shopfine['footer_copyright']; } ?>" size="50" />
							</td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" name="store_id" value="<?php echo $curr_store; ?>" />
			

		

		</form>

	</div>

</div>

<?php echo $footer; ?>
<script type="text/javascript"><!--
    
    function loadstore(id){
var url ='<?php echo html_entity_decode($action); ?>';
if( id > 0 ){
location =url+'&store_id='+id;
}else{
location =url;
}
}
    
    
    
$('#pattern-preview').removeClass().addClass('<?php if(isset($shopfine['background_pattern']) && $shopfine['background_pattern']!=''){ echo $shopfine['background_pattern']; } else { echo 'pattern1'; }?>');
$('#scheme-preview').removeClass().addClass('<?php if(isset($shopfine['color_schemes']) && $shopfine['color_schemes']!=''){ echo 'col' . substr($shopfine['color_schemes'], 5); } else { echo 'theme1'; }?>');
$('#color-preview').removeClass().addClass('<?php if(isset($shopfine['background_color']) && $shopfine['background_color']!=''){ echo $shopfine['background_color']; } else { echo 'col1'; }?>');
//--></script> 

<script type="text/javascript">
	$('#tabs a').tabs();
	$('#general_settings_tabs a').tabs();
	$('#footer_settings a').tabs();
	$('#social_settings_tabs a').tabs();
	$('#custom_css_settings_tabs a').tabs();
</script>

<script type="text/javascript" src="view/javascript/jscolor/jscolor.js"></script> 

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<script type="text/javascript">

	CKEDITOR.replace('shopfine[footer_information]', {
		filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
		filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
	});
</script>
<script type="text/javascript"><!--
function image_upload(field, preview) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + preview).replaceWith('<img src="' + data + '" alt="" id="' + preview + '" />');
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
};
//--></script> 