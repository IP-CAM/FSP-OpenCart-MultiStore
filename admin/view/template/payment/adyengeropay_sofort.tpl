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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_email; ?></td>
            <td><input type="text" name="adyen_email" value="<?php echo $adyen_email; ?>" />
              <?php if ($error_email) { ?>
              <span class="error"><?php echo $error_email; ?></span>
              <?php } ?></td>
          </tr>
          
           <tr>
            <td><span class="required">*</span> <?php echo $entry_hmac_test; ?></td>
            <td><input type="text" name="adyen_hmac_test" value="<?php echo $adyen_hmac_test; ?>" />
              <?php if ($error_hmac_test) { ?>
              <span class="error"><?php echo $error_hmac_test; ?></span>
              <?php } ?></td>
          </tr>
          
          <tr>
            <td><span class="required">*</span> <?php echo $entry_hmac_live; ?></td>
            <td><input type="text" name="adyen_hmac_live" value="<?php echo $adyen_hmac_live; ?>" />
              <?php if ($error_hmac_live) { ?>
              <span class="error"><?php echo $error_hmac_live; ?></span>
              <?php } ?></td>
          </tr>
          
           <tr>
            <td><span class="required">*</span> <?php echo $entry_days_till_delivery; ?></td>
            <td><input type="text" name="adyen_days_till_delivery" value="<?php echo $adyen_days_till_delivery; ?>" />
              <?php if ($error_days_till_delivery) { ?>
              <span class="error"><?php echo $error_days_till_delivery; ?></span>
              <?php } ?></td>
          </tr>
          
            <tr>
            <td><span class="required">*</span> <?php echo $entry_session_valid_till; ?></td>
            <td><input type="text" name="adyen_session_valid_till" value="<?php echo $adyen_session_valid_till; ?>" />
              <?php if ($error_session_valid_till) { ?>
              <span class="error"><?php echo $error_session_valid_till; ?></span>
              <?php } ?></td>
          </tr>
          
          <tr>
            <td>Status Email</td>
            <td><input type="text" name="adyen_status_email" value="<?php echo $adyen_status_email; ?>" />
              </td>
          </tr>
          
          
          
          
           <tr>
            <td><span class="required">*</span> <?php echo $entry_skincode; ?></td>
            <td><input type="text" name="adyen_skincode" value="<?php echo $adyen_skincode; ?>" />
              <?php if ($error_skincode) { ?>
              <span class="error"><?php echo $error_skincode; ?></span>
              <?php } ?></td>
          </tr>
          
          <tr>
            <td><?php echo $entry_test; ?></td>
            <td><?php if ($adyen_test) { ?>
              <input type="radio" name="adyen_test" value="1" checked="checked" />
              <?php echo $text_yes; ?>
              <input type="radio" name="adyen_test" value="0" />
              <?php echo $text_no; ?>
              <?php } else { ?>
              <input type="radio" name="adyen_test" value="1" />
              <?php echo $text_yes; ?>
              <input type="radio" name="adyen_test" value="0" checked="checked" />
              <?php echo $text_no; ?>
              <?php } ?></td>
          </tr>
        
               
          <tr>
            <td><?php echo $entry_canceled_reversal_status; ?></td>
            <td><select name="adyen_canceled_reversal_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_canceled_reversal_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_completed_status; ?></td>
            <td><select name="adyen_completed_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_completed_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_denied_status; ?></td>
            <td><select name="adyen_denied_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_denied_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_expired_status; ?></td>
            <td><select name="adyen_expired_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_expired_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_failed_status; ?></td>
            <td><select name="adyen_failed_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_failed_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_pending_status; ?></td>
            <td><select name="adyen_pending_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_pending_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_processed_status; ?></td>
            <td><select name="adyen_processed_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_processed_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_refunded_status; ?></td>
            <td><select name="adyen_refunded_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_refunded_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_reversed_status; ?></td>
            <td><select name="adyen_reversed_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_reversed_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_voided_status; ?></td>
            <td><select name="adyen_voided_status_id">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $adyen_voided_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_geo_zone; ?></td>
            <td><select name="adyen_geo_zone_id">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $adyen_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="adyen_status">
                <?php if ($adyen_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="adyen_sort_order" value="<?php echo $adyen_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 