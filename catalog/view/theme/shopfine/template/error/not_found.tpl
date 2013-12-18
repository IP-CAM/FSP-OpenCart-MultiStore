<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<div class="row">



	<div class="span9">
  <h3><?php echo $heading_title; ?></h3>
  <br/>
					<div class="alert alert-error">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Oh, We're So Sorry</h4>
  <?php echo $text_error; ?></div>

<div class="control-group">
							    <div class="controls">
		     
								  
								    <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
							    </div>


							</div><!--end control-group-->
							

</div>
<?php echo $column_right; ?>
  <?php echo $content_bottom; ?>
<?php echo $column_left; ?><?php echo $content_top; ?>
</div>
</div>
<?php echo $footer; ?>