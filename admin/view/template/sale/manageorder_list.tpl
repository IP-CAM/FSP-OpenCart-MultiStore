<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading clearfix">
            <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons">
                <a href="<?php echo $show50; ?>">50</a>&nbsp;&nbsp;
                <a href="<?php echo $show200; ?>">200</a>&nbsp;&nbsp;
                <a href="<?php echo $show500; ?>">500</a>&nbsp;&nbsp;
                <a href="<?php echo $show1000; ?>">1000</a>&nbsp;&nbsp;
                <a onclick="popup('<?php echo $print_popup; ?>', '<?php echo $pendingOrderCount; ?>');"
                   class="button" style="target-new: tab; <?php if($pendingOrderCount==0){ ?>background: none repeat scroll 0 0 #808080;<?php } ?>">
                    <span>Print Labels (<?php echo $pendingOrderCount;?>)</span>
                </a>
                <a  <?php if($processingOrderCount==0){ ?>  onclick="alert('No peocessing orders'); return false;" <?php } else{ ?> onclick="popup('<?php echo $pickedorder_popup; ?>');" <?php } ?> class="button" <?php if($processingOrderCount==0){ ?> style="background: none repeat scroll 0 0 #808080;" <?php } ?> ><span>Pick Orders (<?php echo $processingOrderCount;?>)</span></a> <!--onclick="$('#form').attr('action', '<?php echo $export_select; ?>'); -->
                <a  <?php if($orderspickedOrderCount==0){ ?>  onclick="alert('No Picked orders'); return false;" <?php } else{ ?> onclick="popup('<?php echo $export_popup; ?>');" <?php } ?> class="button" <?php if($orderspickedOrderCount==0){ ?> style="background: none repeat scroll 0 0 #808080;" <?php } ?> ><span>Ship Orders (<?php echo $orderspickedOrderCount;?>)</span></a>
                <a onclick="$('#form').attr('action', '<?php echo $update_select; ?>');
                        $('#form').attr('target', '_self');
                        $('#form').submit();" class="button">
                    <span><?php echo $button_updateorder; ?></span>
                </a>
                <a onclick="$('#form').attr('action', '<?php echo $invoice; ?>');
                        $('#form').attr('target', '_blank');
                        $('#form').submit();" class="button">
                    <span><?php echo $button_invoice; ?></span>
                </a>
                <?php if(isset($insert)){ ?>
                <a onclick="location = '<?php echo $insert; ?>'" class="button"><span><?php echo $button_insert; ?></span></a>
                <?php } ?>
                <a onclick="$('#form').attr('action', '<?php echo $delete; ?>');
                        $('#form').attr('target', '_self');
                        $('#form').submit();" class="button">
                    <span><?php echo $button_delete; ?></span>
                </a>	  
            </div>
        </div>
        <div class="content">
            <form action="" method="post" enctype="multipart/form-data" id="form">
                <table class="list">
                    <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
                            <td class="right"><?php if ($sort == 'o.order_id') { ?>
                                <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_order; ?>"><?php echo $column_order_id; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'invoice_id') { ?>
                                <a href="<?php echo $sort_invoice; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_invoice_id; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_invoice; ?>"><?php echo $column_invoice_id; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'customer') { ?>
                                <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'o.email') { ?>
                                <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                                <?php } ?></td>

                            <td class="left"><?php if ($sort == 'status') { ?>
                                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                                <?php } ?></td>
                            <td class="left">Delivery Status</td>

                            <td class="left"><?php echo $column_payment_method; ?></td>
                            <td class="right"><?php echo $column_sub_total; ?></td>
                            <!--<td class="right"><?php echo $column_store_credit; ?></td>-->
                            <td class="right"><?php if ($sort == 'o.total') { ?>
                                <a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_total; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_total; ?>"><?php echo $column_total; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'o.date_added') { ?>
                                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                                <?php } ?></td>
                            <td class="left"><?php if ($sort == 'o.date_modified') { ?>
                                <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                                <?php } else { ?>
                                <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                                <?php } ?></td>
                            <td class="right"><?php echo $column_action; ?></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="filter">
                            <td></td>
                            <td align="right"><input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" size="4" style="text-align: right;" /></td>
                            <td align="left"><input type="text" name="filter_invoice_id" value="<?php echo $filter_invoice_id; ?>" size="8" /></td>
                            <td><input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" /></td>
                            <td><input type="text" name="filter_email" value="<?php echo $filter_email; ?>" /></td>

                            <td><select name="filter_order_status_id">
                                    <option value="*"></option>
                                    <?php if ($filter_order_status_id == '0') { ?>
                                    <option value="0" selected="selected"><?php echo $text_abandoned_orders; ?></option>
                                    <?php } else { ?>
                                    <option value="0"><?php echo $text_abandoned_orders; ?></option>
                                    <?php } ?>
                                    <?php foreach ($order_statuses as $order_status) { ?>
                                    <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select></td>
                            <td><a <?php if($processedOrderCount==0 && $shippedOrderCount==0){ ?>
                                    style="background: none repeat scroll 0 0 #808080;"
                                    onclick="alert('No Shipped orders'); return false;"
                                    <?php }else{ ?>
                                    onclick="$('#form').attr('action', '<?php echo $update_status; ?>');
                                    $('#form').attr('target', '_self');
                                    $('#form').submit();"
                                    <?php } ?>
                                    class="button"><span>Update</span></a></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <!--<td>&nbsp;</td>-->
                            <td align="right"><input type="text" name="filter_total" value="<?php echo $filter_total; ?>" size="4" style="text-align: right;" /></td>
                            <td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" size="12" class="date" /></td>
                            <td><input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" size="12" class="date" /></td>
                            <td align="right"><a onclick="filter();" class="button"><span><?php echo $button_filter; ?></span></a></td>
                        </tr>
                        <?php if ($orders) { ?>
                        <?php foreach ($orders as $order) { ?>
                        <tr>
                            <td style="text-align: center;"><?php if ($order['selected']) { ?>
                                <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
                                <?php } else { ?>
                                <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
                                <?php } ?></td>
                            <td class="right"><?php echo $order['order_id']; ?></td>
                            <td class="left"><?php echo $order['invoice_id']; ?></td>
                            <td class="left"><?php echo $order['customer']; ?></td>
                            <td class="left"><?php echo $order['email']; ?></td>

                            <td class="left"><?php echo $order['status']; ?><br />
                                <?php if ($order['reward']) { ?>
                                Reward Points:&nbsp;<?php echo $order['reward']; ?>
                                <?php if (!$order['reward_total']) { ?>
                                <img src="view/image/add.png" class="reward-add" />
                                <?php } else { ?>
                                <img src="view/image/delete.png" class="reward-remove" />
                                <?php } ?>
                                <?php } ?>
                                <?php if ($order['affiliate']) { ?>
                                Commission:&nbsp;<?php echo $order['commission']; ?>
                                <?php if (!$order['commission_total']) { ?>
                                <img src="view/image/add.png" class="commission-add" />
                                <?php } else { ?>
                                <img src="view/image/delete.png" class="commission-remove" />
                                <?php } ?>
                                <?php } ?>
                            </td>
                            <td class="left"><?php echo $order['delivery_status']; ?></td>

                            <td class="left"><?php echo $order['payment_method']; ?></td>
                            <td class="right"><?php echo $order['sub_total']; ?></td>
                            <!--<td class="right"><?php echo $order['store_credit']; ?></td>-->
                            <td class="right"><?php echo $order['total']; ?></td>
                            <td class="left"><?php echo $order['date_added']; ?><br /></td>
                            <td class="left"><?php echo $order['date_modified']; ?></td>
                            <td class="right"><?php foreach ($order['action'] as $action) { ?>
                                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                                <?php } ?></td>
                        </tr>
                        <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="center" colspan="13"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </form>
            <div class="pagination"><?php echo $pagination; ?></div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
    $('.reward-add').live('click', function() {
        var obj = $(this);
        $.ajax({
            type: 'POST',
            url: 'index.php?route=sale/order/addreward&token=<?php echo $token; ?>&order_id=' + obj.parent().parent().find('input[name=\'selected[]\']').val(),
            dataType: 'json',
            beforeSend: function() {
                obj.after('&nbsp;<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
            },
            complete: function() {
                $('.loading').remove();
            },
            success: function(json) {
                if (json['error']) {
                    alert(json['error']);
                }

                if (json['success']) {
                    alert(json['success']);
                    obj.replaceWith('<img src="view/image/delete.png" class="reward-remove" />');
                }
            }
        });
    });
    $('.reward-remove').live('click', function() {
        var obj = $(this);
        $.ajax({
            type: 'POST',
            url: 'index.php?route=sale/order/removereward&token=<?php echo $token; ?>&order_id=' + obj.parent().parent().find('input[name=\'selected[]\']').val(),
            dataType: 'json',
            beforeSend: function() {
                obj.after('&nbsp;<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
            },
            complete: function() {
                $('.loading').remove();
            },
            success: function(json) {
                if (json['error']) {
                    alert(json['error']);
                }

                if (json['success']) {
                    alert(json['success']);
                    obj.replaceWith('<img src="view/image/add.png" class="reward-add" />');
                }
            }
        });
    });
    $('.commission-add').live('click', function() {
        var obj = $(this);
        $.ajax({
            type: 'POST',
            url: 'index.php?route=sale/order/addcommission&token=<?php echo $token; ?>&order_id=' + obj.parent().parent().find('input[name=\'selected[]\']').val(),
            dataType: 'json',
            beforeSend: function() {
                obj.after('&nbsp;<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
            },
            complete: function() {
                $('.loading').remove();
            },
            success: function(json) {
                if (json['error']) {
                    alert(json['error']);
                }

                if (json['success']) {
                    alert(json['success']);
                    obj.replaceWith('<img src="view/image/delete.png" class="commission-remove" />');
                }
            }
        });
    });
    $('.commission-remove').live('click', function() {
        var obj = $(this);
        $.ajax({
            type: 'POST',
            url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=' + obj.parent().parent().find('input[name=\'selected[]\']').val(),
            dataType: 'json',
            beforeSend: function() {
                obj.after('&nbsp;<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
            },
            complete: function() {
                $('.loading').remove();
            },
            success: function(json) {
                if (json['error']) {
                    alert(json['error']);
                }

                if (json['success']) {
                    alert(json['success']);
                    obj.replaceWith('<img src="view/image/add.png" class="commission-add" />');
                }
            }
        });
    });
    function filter() {
        url = 'index.php?route=sale/manageorder&token=<?php echo $token; ?>';
        var filter_order_id = $('input[name=\'filter_order_id\']').attr('value');
        if (filter_order_id) {
            url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
        }

        var filter_invoice_id = $('input[name=\'filter_invoice_id\']').attr('value');
        if (filter_invoice_id) {
            url += '&filter_invoice_id=' + encodeURIComponent(filter_invoice_id);
        }

        var filter_customer = $('input[name=\'filter_customer\']').attr('value');
        if (filter_customer) {
            url += '&filter_customer=' + encodeURIComponent(filter_customer);
        }

        var filter_email = $('input[name=\'filter_email\']').attr('value');
        if (filter_email) {
            url += '&filter_email=' + encodeURIComponent(filter_email);
        }

        var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');
        if (filter_order_status_id != '*') {
            url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
        }

        var filter_total = $('input[name=\'filter_total\']').attr('value');
        if (filter_total) {
            url += '&filter_total=' + encodeURIComponent(filter_total);
        }

        var filter_date_added = $('input[name=\'filter_date_added\']').attr('value');
        if (filter_date_added) {
            url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
        }

        var filter_date_modified = $('input[name=\'filter_date_modified\']').attr('value');
        if (filter_date_modified) {
            url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
        }

        location = url;
    }
//--></script>  
<script type="text/javascript"><!--
$(document).ready(function() {
        $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    });
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
        if (e.keyCode == 13) {
            filter();
        }
    });
//--></script>
<script type="text/javascript">
    function toggle(div_id) {
        var el = document.getElementById(div_id);
        if (el.style.display == 'none') {
            el.style.display = 'block';
        } else {
            el.style.display = 'none';
        }
    }
    function loadwindow(windowname) {
        var selected = new Array;
        $("#form input:checked").each(function() {
            var val = parseInt(this.value);
            if (!isNaN(val)) {
                selected.push(val);
            }
        });
        $.ajax({
            url: windowname,
            type: 'POST',
            data: {selected: selected.join(",")},
        }).done(function(response) {
            $('#popUpDiv').html(response);
        });
    }
    function popup(windowname, count) {
        if (parseInt(count) === 0) {
            var ret = true;
            $('input[name*=\'selected\']').each(function() {
                if (this.checked) {
                    ret = false;
                }
            });
            if (ret) {
                alert("No Pending Orders");
                return false;
            }
        }
        $('#popUpDiv').empty();
        toggle('blanket');
        toggle('popUpDiv');
        loadwindow(windowname);
    }
    function submit_form(action, target) {
        var submit = false;
        $('input[name*=\'selected\']').each(function() {
            if (this.checked) {
                submit = true;
            }
        });
        if (target) {
            $('#form-popup').attr('target', '_' + target);
        }
        if (submit) {
            $('#form-popup').attr('action', action);
            $('#form-popup').submit();
        } else {
            alert("Please Select at least 1 Order to Print");
        }
    }
    function closePopup() {
        toggle('popUpDiv');
        toggle('blanket');
        location.reload();
    }
</script>
<?php echo $footer; ?>

<style type="text/css">
    #blanket {
        background-color: #000;
        opacity: 0.65;
        filter: alpha(opacity=45);
        position: fixed;
        z-index: 9001;
        top: 0px;
        left: 0px;
        width: 100%;
        height: 100%
    }

    #popUpDiv {
        position: absolute;
        background-color: #fff;
        min-height: 330px;
        z-index: 9002;
        padding: 20px;
        left: 28%;
        top: 18%;
        background-color: #FFFFFF;
        border-radius: 10px 10px 10px 10px;
        box-shadow: 0 0 25px 5px #999999;
        color: #111111;
        display: none;
        min-width: 450px;
        padding: 25px;
    }
    .close-button {
        color: #FFFFFF;
        cursor: pointer;
        display: inline-block;
        text-align: center;
        text-decoration: none;
        border-radius: 7px 7px 7px 7px;
        box-shadow: none;
        padding: 0 6px 2px;
        position: absolute;
        right: -7px;
        top: -7px; 
        background-color: #003A88;
    }
    .close-button:hover {
        background-color: #1E1E1E;
    }
</style>

<div style="display: none;" id="blanket"></div> 
<div style="display: none;" id="popUpDiv"></div>