<?php if($payment_methods){ ?>
<div style="" class="radio credit-option">
    <?php $i=0; foreach($payment_methods as $key=>$payment){ 

    if($payment['code']=='adyen'){
    $code = $payment['ajaxcall'];
    }else{
    $code = $payment['code'];
    }
    ?>
    <?php if($i==0) { ?>
    <script type="text/javascript">
        $.ajax({
            url: 'index.php?route=payment/<?php echo $code;?>',
            dataType: 'html',
            success: function(html) {
                $('#adyen_mthod').html(html);


            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    </script>
    <?php } ?>

    <input onclick="paymentMethodCall('<?php echo $code ?>')" type="radio" id="adyen_radio" name="payment_radio" <?php if($i==0) { ?> checked="checked"<?php } ?>>
           <?php echo $payment['html']; ?>
           <br/>
    <?php $i++; }
    }?>
</div>
<div style="float:left;" class="credit-detail span8">
    <div id="adyen_mthod"></div>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
        function paymentMethodCall(file)
            {
                    $.ajax({
                        url: 'index.php?route=payment/' + file,
                        dataType: 'html',
                        success: function(html) {
                            $('#adyen_mthod').html(html);
                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });

                }
</script>
