<?php echo $header; ?>


<?php if ($attention) { ?>
<div class="alert">
    <button type="button" class="close" data-dismiss="alert">&times;</button>
    <?php echo $attention; ?>
</div>
<?php } ?>


<?php if ($success) { ?>
<div class="alert alert-success">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <?php echo $success; ?>

</div>
<?php } ?>


<?php if ($error_warning) { ?>
<div class="warning alert-error">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <?php echo $error_warning; ?>
</div>
<?php } ?>


<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
    <?php echo $content_top; ?>
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="row">

        <div class="span12">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <table class="table">
                    <thead>
                        <tr>
                            <th><?php echo $column_image; ?></th>
                            <th class="desc"><?php echo $column_name; ?></th>
                            <th><?php echo $column_model; ?></th>
                            <th><?php echo $column_quantity; ?></th>
                            <th><?php echo $column_price; ?></th>
                            <th><?php echo $column_total; ?></th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>    <?php foreach ($products as $product) { ?>
                        <tr>
                            <td>
                                <?php if ($product['thumb']) { ?>
                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                <?php } ?>
                            </td>
                            <td class="desc">
                                <h4><a href="<?php echo $product['href']; ?>" class="invarseColor">
                                        <?php echo $product['name']; ?>
                                    </a>
                                    <?php if (!$product['stock']) { ?>
                                    <span class="text-error">***</span>
                                    <?php } ?></h4>

                                <ul class="unstyled">
                                    <?php foreach ($product['option'] as $option) { ?>


                                    <li><?php echo $option['name']; ?>: <?php echo $option['value']; ?></li> <?php } ?>
                                    <?php if ($product['reward']) { ?>
                                    <li><?php echo $product['reward']; ?></li><?php } ?>
                                </ul>
                            </td>

                            <td class="model"><?php echo $product['model']; ?></td>

                            <td class="quantity">
                                <div class="input-prepend input-append">
                                    <!--<button class="btn"><i class="icon-chevron-left"></i></button>-->
                                    <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>"  />
                                    <!--<button class="btn"><i class="icon-chevron-right"></i></button>-->
                                </div>
                            </td>



                            <td class="sub-price">
                                <h2><?php echo $product['price']; ?></h2>
                            </td>
                            <td class="total-price">
                                <h2><?php echo $product['total']; ?></h2>
                                <!--Ex-Tax: $8.00-->
                            </td>
                            <td>
                                <button class="btn btn-small" alt="<?php echo $button_update; ?>" title="<?php echo $button_update; ?>" data-placement="top" data-toggle="tooltip"><i class="icon-refresh"></i></button>
                                <a href="<?php echo $product['href']; ?>" class="btn btn-small btn-success" data-title="Edit" data-placement="top" data-toggle="tooltip"><i class="icon-pencil"></i></a>
                                <a href="<?php echo $product['remove']; ?>" class="btn btn-small btn-danger" data-title="Remove" data-placement="top" data-toggle="tooltip"><i class="icon-trash"></i></a>
                            </td>
                        </tr> 
                        <?php } ?>

                        <?php foreach ($vouchers as $vouchers) { ?>
                        <tr>
                            <td class="image"></td>
                            <td class="desc"><?php echo $vouchers['description']; ?></td>
                            <td class="model"></td>
                            <td class="quantity">
                                <input type="text" name="" value="1"  disabled="disabled" />
                            </td>
                            <td class="total-price"><?php echo $vouchers['amount']; ?></td>
                            <td class="total-price"><?php echo $vouchers['amount']; ?></td>
                            <td>
                                <a href="<?php echo $vouchers['remove']; ?>" class="btn btn-small btn-danger" data-title="<?php echo $button_remove; ?>" data-placement="top" data-toggle="tooltip" ><i class="icon-trash"></i></a>
                            </td>
                        </tr>
                        <?php } ?>


                    </tbody>
                </table>
            </form>

        </div><!--end span12-->

        <?php if ($coupon_status || $voucher_status || $reward_status || $shipping_status) { ?>
        <div class="span7">
            <div class="cart-accordain" id="cart-acc">
                <?php if ($shipping_status) { ?>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#estimate">
                            <i class="icon-caret-right"></i> <?php echo $text_shipping_estimate; ?>
                        </a>
                    </div>
                    <div id="estimate" class="accordion-body collapse in">
                        <div class="accordion-inner">
                            <form class="form-horizontal">
                                <div class="control-group">
                                    <div class="control-label">
                                        <strong><?php echo $entry_country; ?></strong>
                                    </div>
                                    <div class="controls">
                                        <select name="country_id">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($countries as $country) { ?>
                                            <?php if ($country['country_id'] == $country_id) { ?>
                                            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                            <?php } else { ?>
                                            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                            <?php } ?>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div><!--end control-group-->
                                <div class="control-group">
                                    <div class="control-label">
                                        <strong><?php echo $entry_zone; ?></strong>
                                    </div>
                                    <div class="controls">
                                        <select name="zone_id">
                                        </select>
                                    </div>
                                </div><!--end control-group-->
                                <div class="control-group">
                                    <label id="postcode-required" class="control-label" for="inputpostCode">
                                        <strong><?php echo $entry_postcode; ?></strong>
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>...">
                                    </div>
                                </div><!--end control-group-->
                                <div class="control-group">
                                    <div class="controls">
                                        <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="btn btn-primary" />

                                    </div>
                                </div><!--end control-group-->
                            </form>
                        </div>
                    </div>
                </div><!--end accordion-group-->
                <?php } ?>

                <?php if ($coupon_status) { ?>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#discount-code">
                            <i class="icon-caret-right"></i> <?php echo $text_use_coupon; ?>
                        </a>
                    </div>
                    <div id="discount-code" class="accordion-body collapse">
                        <div class="accordion-inner">

                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="inputDiscount">
                                        <strong><?php echo $entry_coupon; ?></strong>
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>..."/>
                                        <input type="hidden" name="next" value="coupon" />

                                    </div>
                                </div><!--end control-group-->
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn btn-primary"><?php echo $button_coupon; ?></button>
                                    </div>
                                </div><!--end control-group-->
                            </form>
                        </div>
                    </div>
                </div><!--end accordion-group-->
                <?php } ?>


                <?php if ($reward_status) { ?>

                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#discount-code">
                            <i class="icon-caret-right"></i> <?php echo $text_use_reward; ?>
                        </a>
                    </div>
                    <div id="discount-code" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="inputDiscount">
                                        <strong><?php echo $entry_reward; ?></strong>
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="reward" value="<?php echo $reward; ?>" placeholder="<?php echo $entry_reward; ?>...">
                                        <input type="hidden" name="next" value="reward" />
                                    </div>
                                </div><!--end control-group-->
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn btn-primary"><?php echo $button_reward; ?></button>
                                    </div>
                                </div><!--end control-group-->
                            </form>
                        </div>
                    </div>
                </div><!--end accordion-group-->

                <?php } ?>

                <?php if ($voucher_status) { ?>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#cart-acc" href="#gift-voucher">
                            <i class="icon-caret-right"></i> <?php echo $text_use_voucher; ?>
                        </a>
                    </div>
                    <div id="gift-voucher" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="control-group">
                                    <label class="control-label" for="inputVoucher">
                                        <strong><?php echo $entry_voucher; ?></strong>
                                    </label>
                                    <div class="controls">
                                        <input type="text" name="voucher" value="<?php echo $voucher; ?>"  placeholder="<?php echo $entry_voucher; ?>...">
                                        <input type="hidden" name="next" value="voucher" />
                                    </div>
                                </div><!--end control-group-->
                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" class="btn btn-primary"><?php echo $button_voucher; ?> </button>
                                    </div>
                                </div><!--end control-group-->
                            </form>
                        </div>
                    </div>
                </div><!--end accordion-group-->
                <?php } ?>
            </div><!--end cart-accordain-->
        </div><!--end span7-->

        <?php } ?>


        <div class="span5">
            <div class="cart-receipt">
                <table id="total" class="table table-receipt">
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td class="alignRight"><?php echo $total['title']; ?>:</td>
                        <td class="alignLeft"><h2><?php echo $total['text']; ?><h2></td>
                                    </tr> 
                                    <?php 
                                    $totalpiwik = trim(preg_replace('/[,]/', '.', preg_replace('/[^0-9,.]/', '', htmlentities($total['text']))));
                                    $this->session->data['piwik_cart_total'] = $totalpiwik;
                                    //$totalpiwik=trim(str_replace('$','',$total['text'])); 
                                    ?>
                                    <?php } ?>


                                    <tr>
                                        <td class="alignRight"><a href="<?php echo $continue; ?>" class="btn"><?php echo $button_shopping; ?></a></td>
                                        <td class="alignLeft"><a href="<?php echo $checkout; ?>"  class="btn btn-primary"><?php echo $button_checkout; ?></a></td>
                                    </tr>
                                    </table>
                                    </div>
                                    </div><!--end span5-->

                                    <?php echo $content_bottom; ?>
                                    </div>
                                    </div><!--end row-->
                                    <script type="text/javascript">
                                        var pkBaseURL = (("https:" == document.location.protocol) ? "https://analytics.fullserviceplatform.com/" : "http://analytics.fullserviceplatform.com/");
                                        document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
                                    </script>
                                    <script type="text/javascript">
                                        try {
                                            //var piwikid = '<?php //echo $piwikid; ?>';
                                            var piwikid = 72;
                                            var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", piwikid);
                                            piwikTracker.trackEcommerceCartUpdate('<?php  echo $totalpiwik; ?>');
                                            piwikTracker.enableLinkTracking();
                                        } catch (err) {
                                        }
                                    </script>
                                    <script type="text/javascript"><!--
                                $('input[name=\'next\']').bind('change', function() {
                                            $('.cart-module > div').hide();

                                            $('#' + this.value).show();
                                        });
                                        //--></script>
                                    <?php if ($shipping_status) { ?>

                                    <script type="text/javascript"><!--
                                    $('#button-quote').live('click', function() {
                                            $.ajax({
                                            url: 'index.php?route=checkout/cart/quote',
                                                    type: 'post',
                                                    data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
                                                    dataType: 'json',
                                                    beforeSend: function() {
                                                $('#button-quote').attr('disabled', true);
                                                $('#button-quote').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
                                            },
                                                    complete: function() {
                                                $('#button-quote').attr('disabled', false);
                                                $('.wait').remove();
                                            },
                                                    success: function(json) {
                                                $('.success, .warning, .attention, .error').remove();

                                                if (json['error']) {
                                                    if (json['error']['warning']) {
                                                        $('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                                                        $('.warning').fadeIn('slow');

                                                        $('html, body').animate({scrollTop: 0}, 'slow');
                                                    }

                                                    if (json['error']['country']) {
                                                        $('select[name=\'country_id\']').after('<br/><span class="text-error">' + json['error']['country'] + '</span>');
                                                    }

                                                    if (json['error']['zone']) {
                                                        $('select[name=\'zone_id\']').after('<br/><span class="text-error">' + json['error']['zone'] + '</span>');
                                                    }

                                                    if (json['error']['postcode']) {
                                                        $('input[name=\'postcode\']').after('<br/><span class="text-error">' + json['error']['postcode'] + '</span>');
                                                    }
                                                }

                                                if (json['shipping_method']) {
                                                html = '<h3><?php echo $text_shipping_method; ?></h3>';
                                                        html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
                                                        html += '  <table class="table">';
                                                        for (i in json['shipping_method']) {
                                                html += '<thead><tr>';
                                                        html += '  <th><b>' + json['shipping_method'][i]['title'] + '</b></th><th></th><th></th>';
                                                        html += '</tr></thead>';
                                                        if (!json['shipping_method'][i]['error']) {
                                                for (j in json['shipping_method'][i]['quote']) {
                                                html += '<tr class="highlight">';
                                                        if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
                                                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
                                                } else {
                                                html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
                                                }

                                                html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
                                                        html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
                                                        html += '</tr>';
                                                }
                                                } else {
                                                html += '<tr>';
                                                        html += '  <td colspan="3"><div class="text-error">' + json['shipping_method'][i]['error'] + '</div></td>';
                                                        html += '</tr>';
                                                }
                                                }

                                                html += '  </table>';
                                                        html += '  <br />';
                                                        html += '  <input type="hidden" name="next" value="shipping" />';
                                                        < ?php if ($shipping_method) { ? >
                                                        html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn" />';
                                                < ?php } else { ? >
                                                        html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn btn-primary" disabled="disabled" />';
                                                < ?php } ? >
                                                        html += '</form>';

                                                $.colorbox({
                                                    overlayClose: true,
                                                    opacity: 0.5,
                                                    width: '600px',
                                                    height: '400px',
                                                    href: false,
                                                    html: html
                                                });

                                                $('input[name=\'shipping_method\']').bind('change', function() {
                                                    $('#button-shipping').attr('disabled', false);
                                                });
                                            }
                                            }
                                            });
                                        });
                                        //--></script> 
                                    <script type="text/javascript"><!--
                                    $('select[name=\'country_id\']').bind('change', function() {
                                            $.ajax({
                                                url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
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
                                    <?php } ?>
                                    <?php echo $footer; ?>