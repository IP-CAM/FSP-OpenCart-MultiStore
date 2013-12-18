<a class="close-button" onclick="closePopup();" href="javascript:void(0)">X</a>
<div class="box">
    <div class="heading">
        <h1><img src="view/image/order.png" alt="" />Print Labels</h1>
    </div>
    <div class="content">
        <form action="" method="post" enctype="multipart/form-data" id="form-popup">
            <table class="list">
                <thead>
                    <tr>
                        <td class="right"><a>Order Id</a></td>
                        <td class="left"><a>Email</a></td>
                        <td class="left">Parcels</td>
                        <td  style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" checked="checked" />Print</td>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($orders) { ?>
                    <?php foreach ($orders as $order) { ?>
                    <tr>
                        <td class="right"><?php echo $order['order_id']; ?></td>
                        <td class="left"><?php echo $order['email']; ?></td>
                        <td class="left"><input type="text" class="parcels" name="parcels[<?php echo $order['order_id']; ?>]" value="1" /></td>
                        <td style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" /></td>
                    </tr>
                    <?php } ?>
                    <tr>
                        <td colspan="4" class="right">
                            <a onclick="submit_form('<?php echo $print_labels; ?>', 'blank');" class ="button"><span>Print Labels</span></a>
                            <a onclick="submit_form('<?php echo $print_picklist; ?>', 'blank');" class ="button"><span>Print Picklist</span></a>
                            <a onclick="submit_form('<?php echo $invoice; ?>', 'blank');" class="button"><span>Print Invoice</span></a>
                            <a onclick="closePopup();" class="button"><span>Close</span></a>
                        </td>
                    </tr>
                    <?php } else { ?>
                    <tr><td class="center" colspan="13">No Pending Orders</td></tr>
                    <?php } ?>
                </tbody>
            </table>
        </form>
    </div>
</div>
<style type="text/css">
    input[type='text']{
        width: 30px;
    }
</style>
