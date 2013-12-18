<?php echo $header; ?>



<div id="content">

<?php if ($error_warning) { ?>
<div class="alert"><button type="button" class="close" data-dismiss="alert">×</button>

<?php echo $error_warning; ?></div><?php } ?>

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>




<div class="row">
<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->



 <div class="span9"><?php echo $content_top; ?>
<div class="register">
  <h3><?php echo $heading_title; ?></h3>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">




<h4>&nbsp;&nbsp;&nbsp;&nbsp;1. <?php echo $text_your_details; ?></h4>

	<?php if ($error_firstname) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"><?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_firstname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $firstname; ?>">
							     
<?php if ($error_firstname) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_firstname; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->


	 <?php if ($error_lastname) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"><?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_lastname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $lastname; ?>">
							     
 <?php if ($error_lastname) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_lastname; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->



	<?php if ($error_email) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"><?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_email; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $email; ?>">
							     
<?php if ($error_email) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_email; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->

 <?php if ($error_telephone) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"><?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_telephone; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $telephone; ?>">
							     
 <?php if ($error_telephone) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_telephone; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->




<div class="control-group">
							    <label class="control-label" for="inputEMAdd"><?php echo $entry_fax; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							 <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $fax; ?>">
							    </div>
							</div><!--end control-group-->


   


<h4>&nbsp;&nbsp;&nbsp;&nbsp;2. <?php echo $text_your_address; ?></h4>

							<div class="control-group">
							    <label class="control-label" for="inputCompany"><?php echo $entry_company; ?></label>
							    <div class="controls">
							      <input type="text" name="company" value="<?php echo $company; ?>" placeholder="ShopFine, INC">
							    </div>
							</div><!--end control-group-->

	<div class="control-group">
							    <label class="control-label" for="inputCompany"><?php echo $entry_website; ?></label>
							    <div class="controls">
							      <input type="text" name="website" value="<?php echo $website; ?>" placeholder="<?php echo $website; ?>">
							    </div>
							</div><!--end control-group-->


 

	<?php if ($error_address_1) { ?><div class="control-group error">

<?php } else { ?><div class="control-group">
  <?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_address_1; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $address_1; ?>">
							      <?php if ($error_address_1) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_address_1; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->



							<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_address_2; ?></label>
							    <div class="controls">
							      <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $address_2; ?>">
							    </div>
							</div><!--end control-group-->


	 <?php if ($error_city) { ?><div class="control-group error">
<?php } else { ?><div class="control-group">
	 <?php } ?>						    <label class="control-label" for="inputLastName">Last Name: <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="city" value="<?php echo $city; ?>"  placeholder="<?php echo $city; ?>">
							    <?php if ($error_city) { ?>  <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_city; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->





 <?php if ($error_postcode) { ?><div class="control-group error"><?php } else { ?>
	<div class="control-group"><?php } ?>
							    <label class="control-label" for="inputPostCode"><?php echo $entry_postcode; ?> <span id="postcode-required" class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="postcode" value="<?php echo $postcode; ?>">
 <?php if ($error_postcode) { ?> <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_postcode; ?></span>

<?php } ?>
							    </div>
							</div><!--end control-group-->


  

<?php if ($error_country) { ?><div class="control-group error"><?php } else { ?>
<div class="control-group"><?php } ?>
							    <div class="control-label"><?php echo $entry_country; ?> <span class="text-error">*</span></div>
							    <div class="controls">
							      <select name="country_id">
							      	<option value="">-- <?php echo $text_select; ?> --</option>
							      	<?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>

							      </select>
   <?php if ($error_country) { ?> <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_country; ?></span><?php } ?>
							    </div>
							</div><!--end control-group-->



      <?php if ($error_zone) { ?><div class="control-group error"><?php } else { ?>
	<div class="control-group"><?php } ?>
							    <div class="control-label"><?php echo $entry_zone; ?> <span class="text-error">*</span></div>
							    <div class="controls">
							    <select name="zone_id">
            </select> <?php if ($error_zone) { ?> <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_zone; ?></span>
<?php } ?>
							    </div>
							</div><!--end control-group-->

	<div class="control-group">
							    <div class="controls">
							     
								  
								    <a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a>
							
							     
								  
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
							    </div>


							</div><!--end control-group-->

 


  </form>
</div><!--end register-->
</div><!--end span9-->

  <?php echo $content_bottom; ?>

</div><!--end row-->

</div>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=affiliate/edit/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php echo $footer; ?>