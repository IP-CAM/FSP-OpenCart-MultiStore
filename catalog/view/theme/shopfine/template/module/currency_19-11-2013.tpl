<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="btn-group">
    <div class="btn-group">
        <a id="currency" class="btn dropdown-toggle" data-toggle="dropdown" href="#">
            <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
            <?php echo $currency['symbol_left']; ?>
            <?php echo $currency['symbol_right']; ?>
            <?php } ?>
            <?php } ?>
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu currency clearfix">

            <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
            <li>
                <a title="<?php echo $currency['title']; ?>">
                    <?php echo $currency['symbol_left']; ?>
                    <?php echo $currency['symbol_right']; ?>
                </a>
            </li>
            <li class="divider"></li>
            <?php } else { ?>
            <li><a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().parent().parent().submit();"> <?php echo $currency['symbol_left']; ?><?php echo $currency['symbol_right']; ?></a>
            </li>
            <li class="divider"></li>
            <?php } ?>
            <?php } ?>


        </ul>
        <input type="hidden" name="currency_code" value="" />
        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
    </div>				

</form>	
<?php } ?>