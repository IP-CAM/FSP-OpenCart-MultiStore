<?php echo $header; ?>



<div id="content">

<?php if ($error_warning) { ?>
<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>
<?php echo $error_warning; ?>
</div>
<?php } ?>


  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">
 <div class="span9"><?php echo $content_top; ?>
	<div class="register">
<div class="titleHeader clearfix">
  <h3><?php echo $heading_title; ?></h3>
	</div><!--end titleHeader-->
  <p><?php echo $text_account_already; ?></p>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
 <h4>&nbsp;&nbsp;&nbsp;&nbsp;1.<?php echo $text_your_details; ?></h4>

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


 <?php if ($error_email) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"> <?php } ?>
							    <label class="control-label" for="inputEMAdd"><?php echo $entry_email; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="email" value="<?php echo $email; ?>" />
							       <?php if ($error_email) { ?>
   <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_email; ?></span><?php } ?>

							    </div>
							</div><!--end control-group-->


<?php if ($error_telephone) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"> <?php } ?>
							    <label class="control-label" for="inputEMAdd"><?php echo $entry_telephone; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="telephone" value="<?php echo $telephone; ?>" />
							     <?php if ($error_telephone) { ?>
   <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_telephone; ?></span><?php } ?>

							    </div>
							</div><!--end control-group-->


<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_fax; ?></label>
							    <div class="controls">
							      <input type="text" name="fax" value="<?php echo $fax; ?>">
							    </div>
							</div><!--end control-group-->


   
<h4>&nbsp;&nbsp;&nbsp;&nbsp;2.<?php echo $text_your_address; ?></h4>



<div class="control-group">
							    <label class="control-label" for="inputCompany"><?php echo $entry_company; ?></label>
							    <div class="controls">
							      <input type="text" name="company" value="<?php echo $company; ?>">
							    </div>
							</div><!--end control-group-->


<div class="control-group" style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
							    <label class="control-label" for="inputConPass">
<?php echo $entry_customer_group; ?></label>
 <?php foreach ($customer_groups as $customer_group) { ?>
							    <div class="controls">
<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
							      <label class="radio inline">
								<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" /> 
								  </label>

								  <label class="radio inline"for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" ><?php echo $customer_group['name']; ?>
								  </label>

<?php } else { ?>

<label class="radio inline">
								<input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
								  </label>

								  <label class="radio inline"for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" ><?php echo $customer_group['name']; ?>
								  </label>

<?php } ?>
							    </div>
 <?php } ?>

							</div><!--end control-group-->



   <?php if ($error_company_id) { ?><div class="control-group error" id="company-id-display"><?php } else { ?>
 <div class="control-group" id="company-id-display"> <?php } ?>
    
          <label class="control-label" for="inputLastName"><?php echo $entry_company_id; ?> <span id="company-id-required" class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="company_id" value="<?php echo $company_id; ?>" />

							          <?php if ($error_company_id) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_company_id; ?></span> <?php } ?>
							    </div>   
     
    	</div><!--end control-group-->

        <?php if ($error_tax_id) { ?><div class="control-group error" id="tax-id-display"><?php } else { ?>
 <div class="control-group" id="tax-id-display"> <?php } ?>
    
          <label class="control-label" for="inputLastName"><?php echo $entry_tax_id; ?> <span id="tax-id-required" class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="tax_id" value="<?php echo $tax_id; ?>"/>

							          <?php if ($error_tax_id) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_tax_id; ?></span> <?php } ?>
							    </div>  

    	</div><!--end control-group-->

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

  



    <h4>&nbsp;&nbsp;&nbsp;&nbsp;3.<?php echo $text_your_password; ?></h4>
<?php if ($error_password) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"><?php } ?>
							    <label class="control-label" for="inputPass"><?php echo $entry_password; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="password" name="password" value="<?php echo $password; ?>">
<?php if ($error_password) { ?>
  <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_password; ?></span>

<?php } ?>
							    </div>
							</div><!--end control-group-->

     <?php if ($error_confirm) { ?><div class="control-group error">
<?php } else { ?>
<div class="control-group"><?php } ?>
							    <label class="control-label" for="inputPass"><?php echo $entry_confirm; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="password" name="confirm" value="<?php echo $confirm; ?>">
     <?php if ($error_confirm) { ?>
  <span class="help-inline"><i class="icon-remove"></i>&nbsp;<?php echo $error_confirm; ?></span>

<?php } ?>
							    </div>
							</div><!--end control-group-->


 


   <h4>&nbsp;&nbsp;&nbsp;&nbsp;4.<?php echo $text_newsletter; ?></h4>



							<div class="control-group">
							    <label class="control-label" for="inputConPass"><?php echo $entry_newsletter; ?> <span class="text-error">*</span></label>
							    <div class="controls">
<?php if ($newsletter) { ?>
							      <label class="radio inline">

									  <input type="radio" name="newsletter" value="1" checked="checked">  <?php echo $text_yes; ?>
								  </label>
								  <label class="radio inline">
									  <input type="radio" name="newsletter" value="0">   <?php echo $text_no; ?>
								  </label>
 <?php } else { ?>
 <label class="radio inline">

									  <input type="radio" name="newsletter" value="1" >  <?php echo $text_yes; ?>
								  </label>
								  <label class="radio inline">
									  <input type="radio" name="newsletter" value="0" checked="checked">   <?php echo $text_no; ?>
								  </label>
 <?php } ?>

							    </div>
							</div><!--end control-group-->

<div class="control-group">
							    <div class="controls">
							       <?php if ($text_agree) { ?>
 <label class="checkbox">

	<?php echo $text_agree; ?>
      <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
								    </label>
								    <br>
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button><?php } else { ?>
							    <br>
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button><?php } ?>

							    </div>
							</div><!--end control-group-->



 

  </form>
</div><!--end register-->
<?php echo $content_bottom; ?>
</div><!--end span9-->
 <div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->


  

</div><!--end row-->
</div>

<script type="text/javascript"><!--
$('input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
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
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>