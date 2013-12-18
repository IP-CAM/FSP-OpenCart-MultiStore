<?php if ($testmode) { ?>
<div class="warning"><?php echo $text_testmode; ?></div>
<?php } ?>
<div class="pay-info"><span style="float:left" class=""> <?php echo $text_giropay_msg;?></span></div>
<form action="<?php echo $action; ?>" method="POST"> 
    <input type="hidden" name="merchantAccount" value="<?php echo $merchantAccount; ?>" /> 
    <input type="hidden" name="skinCode" value="<?php echo $skinCode; ?>" />
     <input type="hidden" name="merchantReference" value="<?php echo $merchantReference; ?>" />
     <input type="hidden" name="paymentAmount" value="<?php echo $totalAmount; ?>" />
     
    <input type="hidden" name="currencyCode" value="<?php echo $currencyCode; ?>" />
    <input type="hidden" name="shipBeforeDate" value="<?php echo $shipBeforeDate; ?>" />
    <input type="hidden" name="sessionValidity" value="<?php echo $sessionValidity; ?>"/>
    <input type="hidden" name="shopperLocale" value="de_DE" />
    <input type="hidden" name="countryCode" value="DE" />
    <input type="hidden" name="shopperEmail" value="<?php echo $email;?>" />
    <input type="hidden" name="allowedMethods" value="giropay" />
    <input type="hidden" name="brandCode" value="giropay" />
    <input type="hidden" name="merchantReturnData" value="<?php echo $merchantReturnData; ?>" />
    <input type="hidden" name="merchantSig" value="<?php echo $merchantSig; ?>" />
    <input type="hidden" name="orderData" value="<?php echo base64_encode(gzencode($orderData));?>" />
     <input type="hidden" name="resURL" value="<?php echo $return;?>" />
    <div class="buttons">
        <div class="right">
            <input type="submit" value="<?php echo $button_confirm; ?>" class="btn btn-primary" />
        </div>
    </div>
</form>