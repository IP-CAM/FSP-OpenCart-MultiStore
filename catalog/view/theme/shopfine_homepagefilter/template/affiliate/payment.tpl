<?php echo $header; ?>
<div id="content">
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
	
	<div class="titleHeader clearfix">
  <h3><?php echo $heading_title; ?></h3>
	</div><!--end titleHeader-->

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_your_payment; ?></h4>

    <div class="content">
      <table class="form">
        <tbody>
<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_tax; ?></label>
							    <div class="controls">
							   <input type="text" name="tax" value="<?php echo $tax; ?>" />
							    </div>
							</div><!--end control-group-->

          
<div class="control-group">
							    <label class="control-label" for="inputConPass"><?php echo $entry_payment; ?></label>
							    <div class="controls">
							      <label class="radio inline">
									<?php if ($payment == 'cheque') { ?>
              <input type="radio" name="payment" value="cheque" id="cheque" checked="checked" /><?php echo $text_cheque; ?>
              <?php } else { ?>
              <input type="radio" name="payment" value="cheque" id="cheque" /><?php echo $text_cheque; ?>
              <?php } ?>
								  </label>
								  
								  <label class="radio inline">
									  <?php if ($payment == 'paypal') { ?>
              <input type="radio" name="payment" value="paypal" id="paypal" checked="checked" /><?php echo $text_paypal; ?>
              <?php } else { ?>
              <input type="radio" name="payment" value="paypal" id="paypal" /><?php echo $text_paypal; ?>
              <?php } ?>
								  </label>
								  <label class="radio inline">
									
              <?php if ($payment == 'bank') { ?>
              <input type="radio" name="payment" value="bank" id="bank" checked="checked" /><?php echo $text_bank; ?>
              <?php } else { ?>
              <input type="radio" name="payment" value="bank" id="bank" /><?php echo $text_bank; ?>
              <?php } ?>
								  </label>
								  
							    </div>
							</div><!--end control-group-->

					
        </tbody>


        <tbody id="payment-cheque" class="payment">
          <tr>
           <td class="control-label"><?php echo $entry_cheque; ?></td>
           <td class="controls"><input class="span3" type="text" name="cheque" value="<?php echo $cheque; ?>" /></td>
          </tr>
        </tbody>

        <tbody class="payment" id="payment-paypal">
          <tr>
            <td class="control-label"><?php echo $entry_paypal; ?></td>
            <td class="controls"><input class="span3" type="text" name="paypal" value="<?php echo $paypal; ?>" /></td>
          </tr>
        </tbody>

        <tbody id="payment-bank" class="payment">
          <tr>
            <td class="control-label"><?php echo $entry_bank_name; ?></td>
            <td class="controls"><input class="span3" type="text" name="bank_name" value="<?php echo $bank_name; ?>" /></td>
          </tr>
          <tr>
            <td class="control-label"><?php echo $entry_bank_branch_number; ?></td>
           <td class="controls"><input class="span3" type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" /></td>
          </tr>
          <tr>
            <td class="control-label"><?php echo $entry_bank_swift_code; ?></td>
            <td class="controls"><input class="span3" type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" /></td>
          </tr>
          <tr>
            <td class="control-label"><?php echo $entry_bank_account_name; ?></td>
            <td class="controls"><input class="span3" type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" /></td>
          </tr>
          <tr>
            <td class="control-label"><?php echo $entry_bank_account_number; ?></td>
            <td class="controls"><input class="span3" type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" /></td>
          </tr>
        </tbody>

      </table>
    </div>
<br/>

<div class="control-group">
							    <div class="controls">
							     
								  
								    <a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a>
							
							     
								  
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
							    </div>


							</div><!--end control-group-->

   


  </form>

</div>
<?php echo $content_bottom; ?>
</div>
</div>
</div>

<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
	$('.payment').hide();
	
	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script> 
<?php echo $footer; ?> 