<?php echo $header; ?>


<div id="content">

<?php if ($error_warning) { ?>
<div class="alert alert-error">
<button type="button" class="close" data-dismiss="alert">&times;</button>
						
  <?php echo $error_warning; ?></div>

<?php } ?>

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">
 <div class="span9"><?php echo $content_top; ?>
<div class="register">

						<div class="titleHeader clearfix">
							<h3><?php echo $heading_title; ?></h3>
						</div><!--end titleHeader-->


  
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_description; ?></h4>


      <?php if ($error_to_name) { ?><div class="control-group error">
 <?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_to_name; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="to_name" value="<?php echo $to_name; ?>" placeholder="<?php echo $entry_to_name; ?>">
							            <?php if ($error_to_name) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_to_name; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->


    <?php if ($error_to_email) { ?><div class="control-group error">
 <?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_to_email; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							     <input type="text" name="to_email" value="<?php echo $to_email; ?>"  placeholder="<?php echo $entry_to_email; ?>">
							          <?php if ($error_to_email) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_to_email; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->


   <?php if ($error_from_name) { ?><div class="control-group error">
 <?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_from_name; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							     <input type="text" name="from_name" value="<?php echo $from_name; ?>"  placeholder="<?php echo $entry_from_name; ?>">
							         <?php if ($error_from_name) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_from_name; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->

<?php if ($error_from_email) { ?><div class="control-group error">
 <?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_from_email; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							     <input type="text" name="from_email" value="<?php echo $from_email; ?>"  placeholder="<?php echo $entry_from_email; ?>">
							        <?php if ($error_from_email) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_from_email; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->



 <?php if ($error_theme) { ?> <div class="control-group error"><?php } else { ?>
<div class="control-group">
		<?php } ?>					    <label class="control-label" for="inputConPass"><?php echo $entry_theme; ?> <span class="text-error">*</span></label>
							    <div class="controls">
<?php foreach ($voucher_themes as $voucher_theme) { ?>
<?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
							      <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="radio inline">
									 <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" /> <?php echo $voucher_theme['name']; ?>
								  </label>
 <?php } else { ?>
								  <label for="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" class="radio inline">
									    <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" /> <?php echo $voucher_theme['name']; ?>
								  </label>
<?php } ?>
          <br />
          <?php } ?>
   <?php if ($error_theme) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_theme; ?></span><?php } ?>
							    </div>
							</div><!--end control-group-->




	<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_message; ?></label>
							    <div class="controls">
							<textarea name="message" ><?php echo $message; ?></textarea>
							    </div>
							</div><!--end control-group-->



<?php if ($error_amount) { ?><div class="control-group error">
 <?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label"> <span class="text-error">*</span><?php echo $entry_amount; ?></label>
							    <div class="controls">
							    <input type="text" name="amount" value="<?php echo $amount; ?>" >
							     <?php if ($error_amount) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_amount; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->

  
	<div class="control-group">
							    <div class="controls">
							        <label class="checkbox"><?php echo $text_agree; ?>
								<?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" /><?php } ?>
								    </label>
								    <br>
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
							    </div>
							</div><!--end control-group-->

    
  </form>

</div>
<?php echo $content_bottom; ?>
</div><!--end span9-->


<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->

</div><!--end row-->
</div>


<?php echo $footer; ?>