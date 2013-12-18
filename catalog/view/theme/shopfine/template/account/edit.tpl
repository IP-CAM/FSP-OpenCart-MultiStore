<?php echo $header; ?>



<div id="content">

<?php if ($error_warning) { ?>
<div class="alert"><button type="button" class="close" data-dismiss="alert">×</button>

<?php echo $error_warning; ?></div><?php } ?>

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
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_your_details; ?></h4>




 <?php if ($error_firstname) { ?><div class="control-group error"><?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_firstname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $firstname; ?>">
							      <?php if ($error_firstname) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_firstname; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->

<?php if ($error_lastname) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group"><?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_lastname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $lastname; ?>">
							      <?php if ($error_lastname) { ?><span class="help-inline"><i class="icon-remove"></i> <?php echo $error_lastname; ?></span><?php } ?>
							    </div>
							</div><!--end control-group-->


    <?php if ($error_email) { ?><div class="control-group error"><?php } else { ?>
<div class="control-group">
<?php } ?>

							    <label class="control-label" for="inputLastName"><?php echo $entry_email; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $email; ?>">
							         <?php if ($error_email) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_email; ?></span><?php } ?>
							    </div>
							</div><!--end control-group-->




 <?php if ($error_telephone) { ?><div class="control-group error">
<?php } else { ?><div class="control-group">
 <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_telephone; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							      <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $telephone; ?>">
							      <?php if ($error_telephone) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_telephone; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->


  	<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_fax; ?></label>
							    <div class="controls">
							      <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $fax; ?>">
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

</div><!--end span9-->
  <?php echo $content_bottom; ?>
 <div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>
</div><!--end span3-->

</div><!--end row-->

</div>
<?php echo $footer; ?>