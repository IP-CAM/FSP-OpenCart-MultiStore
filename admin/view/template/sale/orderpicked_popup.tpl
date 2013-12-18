<a class="close-button" onclick="closePopup();" href="javascript:void(0)">X</a>
<div class="box">
    <div class="heading">
        <h1><img src="view/image/order.png" alt="" />Picked Orders</h1>
    </div>
    <div class="content">
        <form action="<?php echo $addhistory; ?>" method="post" id="form-popup">
            <table class="list">
                <tr>
                <thead>
                    <tr>
                        <td width="1" class="left"><input type="checkbox" onclick="$('.labels').attr('checked', this.checked);" checked="checked" /></td>
                        <td class="right"><a>Order Id</a></td>
                        <td class="left"><a>Email</a></td>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($orders) { ?>
                    <?php foreach ($orders as $order) { ?>
                    <tr>
                        <td width="1" class="left"><input type="checkbox" class="labels" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" /></td>
                        <td class="right"><?php echo $order['order_id']; ?></td>
                        <td class="left"><?php echo $order['email']; ?></td>
                    </tr>
                    <?php } ?>
                    <tr>
                        <td colspan="3" class="right">
                            <a onclick="$('#form-popup').submit();" id="button-history" class="button"><span>Update</span></a>
                            <a onclick="closePopup();" class="button"><span>Close</span></a>
                        </td>
                    </tr>
                    <?php } else { ?>
                    <tr><td class="center" colspan="13">No Orders</td></tr>
                    <?php } ?>
                </tbody>
            </table>
            <input type="hidden" name="notify" value="0" />
            <input type="hidden" name="order_status_id" id="order_status_id" value="<?php echo $order_status_id; ?>" />
        </form>
    </div>
</div>