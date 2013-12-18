<?php echo $header; ?>

<div id="content">

<?php if ($success) { ?>
<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>

<?php echo $success; ?>
</div>
<?php } ?>

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">
 <div class="span9">
<?php echo $content_top; ?>
<div class="account-list-outer">
<div class="titleHeader clearfix">
							<h3><?php echo $text_my_account; ?></h3>
						</div><!--end titleHeader-->



   <ul class="account-list">
      <li><a href="<?php echo $edit; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $address; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_wishlist; ?></a></li>
    </ul>
<div class="titleHeader clearfix">
							<h3><?php echo $text_my_orders; ?></h3>
						</div><!--end titleHeader-->


   <ul class="account-list">
      <li><a href="<?php echo $order; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $download; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_download; ?></a></li>
      <?php if ($reward) { ?>
      <li><a href="<?php echo $reward; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_reward; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $return; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $transaction; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_transaction; ?></a></li>
    </ul>
<div class="titleHeader clearfix">
							<h3><?php echo $text_my_newsletter; ?></h3>
						</div><!--end titleHeader-->


  <ul class="account-list">
      <li><a href="<?php echo $newsletter; ?>" class="invarseColor"><i class="icon-caret-right"></i><?php echo $text_newsletter; ?></a></li>
    </ul>

</div><!--end -->
<?php echo $content_bottom; ?>
</div><!--end span9-->

 <div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

  
</div>
</div>
</div>
<?php echo $footer; ?> 