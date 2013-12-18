<?php echo $header; ?>


<div id="content">


  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">

 <div class="register">
	 <div class="span9"><?php echo $content_top; ?>
	<div class="titleHeader clearfix">
  <h3><?php echo $heading_title; ?></h3>
	</div><!--end titleHeader-->


  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_edit_address; ?></h4>




 <?php if ($error_firstname) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"> <?php } ?>
							    <label class="control-label" for="inputFirstName"><?php echo $entry_firstname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
							      <?php if ($error_firstname) { ?>
   <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_firstname; ?></span><?php } ?>

							    </div>
							</div><!--end control-group-->



    <?php if ($error_lastname) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"> <?php } ?>
							      <label class="control-label" for="inputLastName"><?php echo $entry_lastname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="lastname" value="<?php echo $lastname; ?>" />
							       <?php if ($error_lastname) { ?>
   <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_lastname; ?></span><?php } ?>

							    </div>
							</div><!--end control-group-->


<div class="control-group">
							    <label class="control-label" for="inputCompany"><?php echo $entry_company; ?></label>
							    <div class="controls">
							      <input type="text" name="company" value="<?php echo $company; ?>">
							    </div>
							</div><!--end control-group-->


 <?php if ($company_id_display) { ?>	

<?php if ($error_company_id) { ?>
<div class="control-group error">
<?php } else { ?>
<div class="control-group"> <?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_company_id; ?> </label>
							    <div class="controls">
				<input type="text" name="company_id" value="<?php echo $company_id; ?>" />
							     <?php if ($error_company_id) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_company_id; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->

  <?php } ?>



  <?php if ($tax_id_display) { ?>
 <?php if ($error_tax_id) { ?>
<div class="control-group error">
<?php } else { ?>
<div class="control-group"> <?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_tax_id; ?> </label>
							    <div class="controls">
				<input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
							     <?php if ($error_tax_id) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_tax_id; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->

  <?php } ?>






 <?php if ($error_address_1) { ?><div class="control-group error"><?php } else { ?>
	<div class="control-group"><?php } ?>
							    <label class="control-label" for="inputFirstAdd"><?php echo $entry_address_1; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="address_1" value="<?php echo $address_1; ?>">
 <?php if ($error_address_1) { ?> <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_address_1; ?></span>

<?php } ?>
							    </div>
							</div><!--end control-group-->



<div class="control-group">
							    <label class="control-label" for="inputEMAdd"><?php echo $entry_address_2; ?> </label>
							    <div class="controls">
							      <input type="text" name="address_2" value="<?php echo $address_2; ?>">
							    </div>
							</div><!--end control-group-->

      

 <?php if ($error_city) { ?><div class="control-group error"><?php } else { ?>
	<div class="control-group"><?php } ?>
							    <label class="control-label" for="inputFirstAdd"><?php echo $entry_city; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="city" value="<?php echo $city; ?>">
 <?php if ($error_city) { ?> <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_city; ?></span>

<?php } ?>
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
							    <label class="control-label" for="inputConPass"><?php echo $entry_default; ?> <span class="text-error">*</span></label>
							    <div class="controls">

<?php if ($default) { ?>
							      <label class="radio inline">
								<input type="radio" name="default" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            
  </label>

						      <label class="radio inline">
				
            <input type="radio" name="default" value="0" />
            <?php echo $text_no; ?>
  </label>

<?php } else { ?>

								  <label class="radio inline">
	  <input type="radio" name="default" value="1" />
            <?php echo $text_yes; ?>
           
								  </label>


	  <label class="radio inline">
	 
            <input type="radio" name="default" value="0" checked="checked" />
            <?php echo $text_no; ?>
								  </label>

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
<?php echo $content_bottom; ?>
</div><!--end register-->
</div><!--end span9-->
<div class="span3">

<?php echo $column_left; ?>
<?php echo $column_right; ?>
  
</div
</div><!--end row-->


</div>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/address/country&country_id=' + this.value,
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