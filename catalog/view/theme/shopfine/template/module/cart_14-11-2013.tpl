<form id="cart" class="btn-group">
    <div class="btn-group heading <?php if(isset($_REQUEST['show'])){ echo 'open'; } ?>">
        <a id="cart-dropdown-toggle" class="btn dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="icon-shopping-cart"></i>&nbsp;<span id="cart-total"><?php echo $text_items; ?></span>&nbsp;<span class="caret"></span>
        </a>
        <?php if ($products || $vouchers) { ?>
        <div class="dropdown-menu cart-content pull-right">
            <table class="table-cart">
                <tbody>                    
                    <?php foreach ($products as $product) { ?>
                    <tr>
                        <td class="cart-product-info">
                            <?php if ($product['thumb']) { ?>
                            <a href="<?php echo $product['href']; ?>">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                            </a>
                            <?php } ?>
                            <div class="cart-product-desc">
                                <p><a href="<?php echo $product['href']; ?>" class="invarseColor" ><?php echo $product['name']; ?></a></p>
                                <ul class="unstyled">
                                    <?php foreach ($product['option'] as $option) { ?>
                                    <li><?php //echo $option['name']; ?> <?php echo $option['value']; ?></li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </td>
                        <td class="cart-product-setting">
                            <p><strong><?php echo $product['quantity']; ?>&nbsp;x&nbsp;-&nbsp;<?php echo $product['total']; ?></strong></p>
                            <a data-title="Delete" data-toggle="tooltip" class="remove-pro" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" data-original-title="" title="">
                                <i class="icon-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <?php } ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td class="cart-product-info">
                            <a class="btn btn-small" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a>
                            <a class="btn btn-small btn-primary" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
                        </td>
                        <td>
                            <div class="mini-cart-total">
                                <table>
                                    <?php foreach ($vouchers as $voucher) { ?>
                                    <tr>
                                        <td class="image"></td>
                                        <td class="name"><?php echo $voucher['description']; ?></td>
                                        <td class="quantity">x&nbsp;1</td>
                                        <td class="total"><?php echo $voucher['amount']; ?></td>
                                        <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
                                    </tr>
                                    <?php } ?>
                                    <?php foreach ($totals as $total) { ?>
                                    <?php $totalpiwik = trim(preg_replace('/[,]/', '.', preg_replace('/[^0-9,.]/', '', htmlentities($total['text']))));
                                    $this->session->data['piwik_cart_total'] = $totalpiwik; ?>
                                    <tr>
                                        <td class="right"><b><?php echo $total['title']; ?>:</b></td>
                                        <td class="right"><?php echo $total['text']; ?></td>
                                    </tr>
                                    <?php } ?>
                                </table>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <?php }else{ ?>
        <div class="dropdown-menu cart-content pull-right">
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4><?php echo $text_empty; ?></h4>
            </div>
        </div>
        <?php } ?>
    </div>
</form>
<script type="text/javascript">
                                var pkBaseURL = (("https:" == document.location.protocol) ? "https://analytics.fullserviceplatform.com/" : "http://analytics.fullserviceplatform.com/");
                                document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    try {
        //var piwikid = '<?php //echo $piwikid; ?>';
        var piwikid = 73;
        var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", piwikid);
        piwikTracker.trackEcommerceCartUpdate('<?php  echo $totalpiwik; ?>');
        piwikTracker.enableLinkTracking();
    } catch (err) {
    }
</script>