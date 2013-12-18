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


				<div class="span9"><?php echo $content_top; ?>
					<div class="register">

						<div class="titleHeader clearfix">
							<h3><?php echo $heading_title; ?></h3>
						</div><!--end titleHeader-->



 <p> <?php echo $text_description; ?> </p>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
   <h4>&nbsp;&nbsp;&nbsp;&nbsp;1. <?php echo $text_order; ?></h4>


<?php if ($error_firstname) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_firstname; ?> <span class="text-error">*</span></label>
							    <div class="controls">
							   <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
							        <?php if ($error_firstname) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_firstname; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->




  <?php if ($error_lastname) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_lastname; ?>
 <span class="text-error">*</span></label>
							    <div class="controls">
							<input type="text" name="lastname" value="<?php echo $lastname; ?>" />
							        <?php if ($error_lastname) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_lastname; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->


  <?php if ($error_email) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName">
<?php echo $entry_email; ?>
 <span class="text-error">*</span></label>
							    <div class="controls">
							 <input type="text" name="email" value="<?php echo $email; ?>" />
							        <?php if ($error_email) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_email; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->


<?php if ($error_telephone) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName">
<?php echo $entry_telephone; ?>
 <span class="text-error">*</span></label>
							    <div class="controls">
							<input type="text" name="telephone" value="<?php echo $telephone; ?>" />
							       <?php if ($error_telephone) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_telephone; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->


  <?php if ($error_order_id) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group">
  <?php } ?>
							    <label class="control-label" for="inputLastName">
<?php echo $entry_order_id; ?>
 <span class="text-error">*</span></label>
							    <div class="controls">
						      <input type="text" name="order_id" value="<?php echo $order_id; ?>" />
							        <?php if ($error_order_id) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_order_id; ?></span>  <?php } ?>
							    </div>
							</div><!--end control-group-->




	<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_date_ordered; ?></label>
							    <div class="controls">
							   <input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="date" />
							    </div>
							</div><!--end control-group-->


   

    <h4>&nbsp;&nbsp;&nbsp;&nbsp;2. <?php echo $text_product; ?></h4>

    <div id="return-product">

  <?php if ($error_product) { ?>
     <div class="control-group error"> <?php } else { ?> <div class="control-group">
<?php } ?>
							    <label class="control-label" for="inputLastName">
<?php echo $entry_product; ?>
<span class="text-error">*</span></label>
							    <div class="controls">
							    <input type="text" name="product" value="<?php echo $product; ?>" />
							        <?php if ($error_product) { ?> <span class="help-inline">
<i class="icon-remove"></i> <?php echo $error_product; ?>
</span> <?php } ?>
							    </div>
							</div><!--end control-group-->


<?php if ($error_model) { ?>
     <div class="control-group error"> <?php } else { ?> <div class="control-group">
<?php } ?>
							    <label class="control-label" for="inputLastName">
<?php echo $entry_model; ?>
<span class="text-error">*</span></label>
							    <div class="controls">
							 <input type="text" name="model" value="<?php echo $model; ?>" />
							     <?php if ($error_model) { ?> <span class="help-inline">
<i class="icon-remove"></i> <?php echo $error_model; ?>
</span> <?php } ?>
							    </div>
							</div><!--end control-group-->



<div class="control-group">
							    <label class="control-label" for="inputFAX"><?php echo $entry_quantity; ?></label>
							    <div class="controls">
							 <input type="text" name="quantity" value="<?php echo $quantity; ?>" />
							    </div>
							</div><!--end control-group-->

      
	 <?php if ($error_reason) { ?>
<div class="control-group error"><?php } else { ?>
<div class="control-group">
			  <?php  } ?>				    <label class="control-label" for="inputConPass"><?php echo $entry_reason; ?> <span class="text-error">*</span></label>
<?php foreach ($return_reasons as $return_reason) { ?>

							    <div class="controls">

              <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
							      <label class="radio inline" for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?>
									<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /> 
								  </label>
<?php } else { ?>
								  <label class="radio inline" for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?>
									<input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" />
								  </label>
<?php  } ?>
            

  <?php if ($error_reason) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_reason; ?></span>  <?php  } ?>

							    </div>
  <?php  } ?>
							</div><!--end control-group-->



	<div class="control-group">
							    <label class="control-label" for="inputConPass"><?php echo $entry_opened; ?></label>
							    <div class="controls">

							      <label class="radio inline" for="opened"><?php echo $text_yes; ?>
								 <?php if ($opened) { ?>
            <input type="radio" name="opened" value="1" id="opened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="1" id="opened" />
            <?php } ?>
								  </label>

								  <label class="radio inline" for="unopened"><?php echo $text_no; ?>
								 <?php if (!$opened) { ?>
            <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
            <?php } else { ?>

            <input type="radio" name="opened" value="0" id="unopened" />
            <?php } ?>
								  </label>

							    </div>
							</div><!--end control-group-->


<div class="control-group">
							    <label class="control-label" for="inputCompanyID"><?php echo $entry_fault_detail; ?></label>
							    <div class="controls">
							  <textarea name="comment" ><?php echo $comment; ?></textarea>
							    </div>
							</div><!--end control-group-->


       
		 <?php if ($error_captcha) { ?>
<div class="control-group error"> <?php } else { ?>
<div class="control-group">
 <?php } ?>
							    <label class="control-label" for="inputLastName"><?php echo $entry_captcha; ?> <span class="text-error">*</span></label>
							    <div class="controls">

<label>
								 <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
								  </label>
								  <label>
								<img src="index.php?route=account/return/captcha" alt="" />
								  </label>


							
    					      <?php if ($error_captcha) { ?> <span class="help-inline"><i class="icon-remove"></i> <?php echo $error_captcha; ?></span> <?php } ?>
							    </div>
							</div><!--end control-group-->

    
       


    </div>



    <?php if ($text_agree) { ?>

    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a></div>
      <div class="right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
      </div>
    </div>

    <?php } else { ?>


  <div class="control-group">
							    <div class="controls">
							     
								  
								    <a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a>
							
							     
								  
								    <button type="submit" class="btn btn-primary"><?php echo $button_continue; ?></button>
							    </div>


							</div><!--end control-group-->




    <?php } ?>


  </form>

</div><!--end reg-->
<?php echo $content_bottom; ?>
</div><!--end span9-->

<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->
  
</div><!--end row-->

</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>