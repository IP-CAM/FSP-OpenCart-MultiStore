<?php echo $header; ?>


<div id="content">


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

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
    
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_password; ?></h4>
<?php if ($error_password) { ?><div class="control-group error">
<?php } else { ?><div class="control-group">
<?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_password; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="password" name="password" value="<?php echo $password; ?>">
							      <?php if ($error_password) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_password; ?></span><?php } ?>
							    </div>
							</div><!--end control-group-->

   
  <?php if ($error_confirm) { ?><div class="control-group error">
<?php } else { ?><div class="control-group">
<?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_confirm; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input  type="password" name="confirm" value="<?php echo $confirm; ?>">
							       <?php if ($error_confirm) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_confirm; ?></span><?php } ?>
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
</div>
<?php echo $footer; ?>