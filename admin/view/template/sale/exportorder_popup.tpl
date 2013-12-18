<a class="close-button" onclick="closePopup();" href="javascript:void(0)">X</a>
<div class="box">
    <div class="heading">
        <h1><img src="view/image/order.png" alt="" />Ship Orders</h1>
    </div>
    <div class="content">
        <form action="" method="post" enctype="multipart/form-data" id="form-popup">
            <table class="list">
                <thead>
                    <tr>
                        <td class="left"><input type="checkbox" onclick="$('.labels').attr('checked', this.checked);" checked="checked" /></td>
                        <td class="right"><a>Order Id</a></td>
                        <td class="left"><a>Email</a></td>
                        <td class="left">Parcels</td>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($orders) { ?>
                    <?php foreach ($orders as $order) { ?>
                    <tr>
                        <td class="left"><input type="checkbox" class="labels" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" /></td>
                        <td class="right"><?php echo $order['order_id']; ?></td>
                        <td class="left"><?php echo $order['email']; ?></td>
                        <td class="left"><input type="text" class="parcels" name="select[parcels][<?php echo $order['order_id']; ?>]" value="1" /></td>
                    </tr>
                    <?php } ?>
                    <tr>
                        <td colspan="3" class="right"><a onclick="submit_form('<?php echo $export; ?>');" class="button"><span>Ship Orders</span></a></td>
                        <td class="right"><a onclick="closePopup();" class="button"><span>Close</span></a></td>
                    </tr>
                    <?php } else { ?>
                    <tr><td class="center" colspan="13">No Orders</td></tr>
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