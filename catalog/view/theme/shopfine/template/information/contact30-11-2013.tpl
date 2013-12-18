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
                    <?php echo $address; ?>
                    <br/>
                    <br/>
                    <?php if ($telephone) { ?> 
                    <strong><i class="icon-volume-up"></i> <?php echo $text_telephone; ?></strong><br />
                    <?php echo $telephone; ?>  <?php } ?>
                    <br />
                    <br />
                    <?php if ($config_email) { ?> 
                    <strong><i class="icon-envelope-alt"></i> <?php echo $entry_email; ?></strong><br />
                    <?php echo $config_email; ?>  <?php } ?>
                    <br />
                    <br />
                    <?php if ($fax) { ?>
                    <abbr title="Phone"><?php echo $text_fax; ?></abbr><?php echo $fax; ?>
                    <?php } ?>
                    <br/>
                </address>
            </div><!--end contact-info-->
        </div><!--end span4-->

        <div class="span8">
            <div class="google-map">
                <iframe height="246" src="https://maps.google.com/maps?q=Hollybank+House+-+Courier+Point,+7+Old+Wareham+Road,+Poole,+Dorset+BH16+6AQ,+United+Kingdom&amp;output=embed"></iframe>
            </div><!--end google-map-->

            <div class="contact-us-form">
                <div class="titleHeader clearfix">
                    <h3><?php echo $text_contact; ?></h3>
                </div><!--end titleHeader-->

                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <div class="controls controls-row">
                        <input type="text" name="name" value="<?php echo $name; ?>" class="span4"  placeholder="<?php if ($error_name) { ?><?php echo $error_name; ?><?php }else{ ?><?php echo '*'.$entry_name; } ?>" />
                        <input type="text" name="email" value="<?php echo $email; ?>" class="span4" placeholder="<?php if ($error_email) { ?><?php echo $error_email; ?><?php }else{ echo '*'.$entry_email; ?><?php }?>" />
                    </div>

                    <div class="controls">
                        <textarea name="enquiry" class="span8" placeholder="<?php if ($error_enquiry) { ?><?php echo $error_enquiry; ?><?php }else{ echo $entry_enquiry;?><?php } ?>"><?php echo $enquiry; ?></textarea>
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