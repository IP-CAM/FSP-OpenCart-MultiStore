<?php echo $header; ?>


<div id="content">

<?php if ($error_warning) { ?>
<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>
<?php echo $error_warning; ?></div>
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
<div class="register">

						<div class="titleHeader clearfix">
							<h3><?php echo $heading_title; ?></h3>
						</div><!--end titleHeader-->

  <p><?php echo $text_email; ?></p>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
  
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_your_email; ?></h4>

<div class="control-group">
							    <label class="control-label" for="inputEMAdd"><?php echo $entry_email; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="email" value="">
							    </div>
							</div><!--end control-group-->

 
  <div class="control-group">
							    <div class="controls">
							     
								  
								    <a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a>
							
							     
								  
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
							    </div>


							</div><!--end control-group-->
    
  </form>
</div>
<?php echo $content_bottom; ?>
</div>

 </div>
<?php echo $footer; ?>