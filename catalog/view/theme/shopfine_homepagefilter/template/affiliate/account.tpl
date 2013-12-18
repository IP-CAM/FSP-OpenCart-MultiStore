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
<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->

  
<div class="span9"><?php echo $content_top; ?>


<div class="account-list-outer">
<div class="titleHeader clearfix">
							<h3><?php echo $text_my_account; ?></h3>
						</div><!--end titleHeader-->



 <ul class="account-list">
      <li><a class="invarseColor" href="<?php echo $edit; ?>"><i class="icon-caret-right"></i><?php echo $text_edit; ?></a></li>
      <li><a class="invarseColor" href="<?php echo $password; ?>"><i class="icon-caret-right"></i><?php echo $text_password; ?></a></li>
      <li><a class="invarseColor" href="<?php echo $payment; ?>"><i class="icon-caret-right"></i><?php echo $text_payment; ?></a></li>
    </ul>



<div class="titleHeader clearfix">
							<h3><?php echo $text_my_tracking; ?></h3>
						</div><!--end titleHeader-->


<ul class="account-list">
      <li><a class="invarseColor" href="<?php echo $tracking; ?>"><i class="icon-caret-right"></i><?php echo $text_tracking; ?></a></li>
    </ul>



<div class="titleHeader clearfix">
							<h3><?php echo $text_my_transactions; ?></h3>
						</div><!--end titleHeader-->


<ul class="account-list">
  
      <li><a class="invarseColor" href="<?php echo $transaction; ?>"><i class="icon-caret-right"></i><?php echo $text_transaction; ?></a></li>
    </ul>
 

</div><!--end -->

  <?php echo $content_bottom; ?>
</div>
</div>
</div>
<?php echo $footer; ?>