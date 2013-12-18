<?php echo $header; ?>

<div id="content">


  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>


<div class="row">

					<div class="span4">
	<div class="contact-info">
						<div class="titleHeader clearfix">
							<h3><?php echo $text_location; ?></h3>
						</div><!--end titleHeader-->



<address>
						   <strong><i class="icon-pushpin"></i> <?php echo $text_address; ?></strong><br>
						   <strong><?php echo $store; ?></strong><br>
						   <?php echo $address; ?><br>
						
						    <?php if ($telephone) { ?> 
<strong><i class="icon-volume-up"></i> <?php echo $text_telephone; ?></strong><br />
<?php echo $telephone; ?>  <?php } ?><br />		

  <?php if ($fax) { ?> <abbr title="Phone"><?php echo $text_fax; ?></abbr>
  <?php echo $fax; ?>  <?php } ?><br />

						</address>


 		</div><!--end contact-info-->
				</div><!--end span4-->


<div class="span8">


<div class="google-map">
						<iframe height="246" src="http://maps.google.com.eg/maps?f=q&amp;source=s_q&amp;hl=ar&amp;geocode=&amp;q=Tahrir,+%D9%82%D8%B5%D8%B1+%D8%A7%D9%84%D8%AF%D9%88%D8%A8%D8%A7%D8%B1%D8%A9,+%D9%82%D8%B5%D8%B1+%D8%A7%D9%84%D9%86%D9%8A%D9%84,+Al-Qahira&amp;aq=0&amp;oq=tahr&amp;sll=30.044133,31.235161&amp;sspn=0.200606,0.363579&amp;ie=UTF8&amp;hq=&amp;hnear=%D9%85%D9%8A%D8%AF%D8%A7%D9%86+%D8%A7%D9%84%D8%AA%D8%AD%D8%B1%D9%8A%D8%B1&amp;t=m&amp;z=14&amp;ll=30.0451,31.235428&amp;output=embed"></iframe>
					</div><!--end google-map-->

<div class="contact-us-form">
						<div class="titleHeader clearfix">
							<h3><?php echo $text_contact; ?></h3>
						</div><!--end titleHeader-->

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    
   

	
<div class="controls controls-row">  
 
   
    <input type="text" name="name" value="<?php echo $name; ?>" class="span4"  placeholder="<?php if ($error_name) { ?><?php echo $error_name; ?><?php } ?>"/>

    




   
    <input type="text" name="email" value="<?php echo $email; ?>" class="span4" placeholder="<?php if ($error_email) { ?><?php echo $error_email; ?><?php } ?>" />

   

	</div>

 <div class="controls">

    <textarea name="enquiry" class="span8" placeholder="<?php if ($error_enquiry) { ?><?php echo $error_enquiry; ?><?php } ?>"><?php echo $enquiry; ?></textarea>






    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />

    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>

    </div>


<div class="controls">
							   <button type="submit" class="btn btn-primary pull-right"><?php echo $button_continue; ?></button>
							</div>


 

  </form>
</div><!--end contact-us-form-->
</div><!--end span8-->



</div>

</div><!--end row-->

<?php echo $footer; ?>