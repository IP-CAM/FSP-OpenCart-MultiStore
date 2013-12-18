<?php echo $header; ?>


<div id="content">

<?php if ($success) { ?>
<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>

<?php echo $success; ?>
</div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="alert alert-error">  <button type="button" class="close" data-dismiss="alert">×</button>
<?php echo $error_warning; ?>
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
  <h3><?php echo $heading_title; ?></h3>
  <?php echo $text_description; ?>
  
  <div class="login">
						<table>
							<tr>
								<td>
									<h3><?php echo $text_new_affiliate; ?></h3>
									<p>
									<?php echo $text_register_account; ?>
									</p>
									<a href="<?php echo $register; ?>" class="btn"><?php echo $button_continue; ?></a>
								</td>

								<td>
									<h3><?php echo $text_returning_affiliate; ?></h3>
									<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
										<div class="controls">
											<label><?php echo $entry_email; ?> <span class="text-error">*</span></label>
											<input type="text" name="email" value="<?php echo $email; ?>" placeholder="example@example.com">
										</div>
										<div class="controls">
											<label><?php echo $entry_password; ?> <span class="text-error">*</span></label>
											<input type="password" name="password" value="<?php echo $password; ?>" placeholder="**************">
										</div>
										<div class="controls">
											<label>
										      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
										    </label>
										    <button type="submit" class="btn btn-primary"><?php echo $button_login; ?></button>
											<?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
										</div>
									</form><!--end form-->
								</td>
							</tr>
						</table>
					</div><!--end login-->
		
  <?php echo $content_bottom; ?>
  </div><!--end span9-->
  </div><!--end row-->
  
  </div>
<?php echo $footer; ?>