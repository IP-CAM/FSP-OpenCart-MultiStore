
					<div class="titleHeader clearfix">
						<h3><?php echo $heading_title; ?></h3>
					</div><!--end titleHeader-->
					<ul class="unstyled my-account">
    <?php foreach ($informations as $information) { ?>
<li><a class="invarseColor" href="<?php echo $information['href']; ?>"><i class="icon-caret-right"></i> <?php echo $information['title']; ?></a></li>

 <?php } ?>

<li><a class="invarseColor" href="<?php echo $contact; ?>"><i class="icon-caret-right"></i> <?php echo $text_contact; ?></a></li>
<li><a class="invarseColor" href="<?php echo $sitemap; ?>"><i class="icon-caret-right"></i> <?php echo $text_sitemap; ?></a></li>

</ul>
				</br>
