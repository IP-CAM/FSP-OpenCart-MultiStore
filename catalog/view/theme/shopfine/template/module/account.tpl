
					<div class="titleHeader clearfix">
						<h3><?php echo $heading_title; ?></h3>
					</div><!--end titleHeader-->
					<ul class="unstyled my-account">
 <?php if (!$logged) { ?>
						<li><a class="invarseColor" href="<?php echo $login; ?>"><i class="icon-caret-right"></i> <?php echo $text_login; ?></a></li>
						<li><a class="invarseColor" href="<?php echo $register; ?>"><i class="icon-caret-right"></i> <?php echo $text_register; ?></a></li>
			<li><a class="invarseColor" href="<?php echo $forgotten; ?>"><i class="icon-caret-right"></i> <?php echo $text_forgotten; ?></a></li>

 <?php } ?>

						<li><a class="invarseColor" href="<?php echo $account; ?>"><i class="icon-caret-right"></i> <?php echo $text_account; ?></a></li>
			   <?php if ($logged) { ?>
						<li><a class="invarseColor" href="<?php echo $edit; ?>"><i class="icon-caret-right"></i> <?php echo $text_edit; ?></a></li>
						<li><a class="invarseColor" href="<?php echo $password; ?>"><i class="icon-caret-right"></i> <?php echo $text_password; ?></a></li>
 <?php } ?>
						<li><a class="invarseColor" href="<?php echo $address; ?>"><i class="icon-caret-right"></i> <?php echo $text_address; ?></a></li>
						<li><a class="invarseColor" href="<?php echo $wishlist; ?>"><i class="icon-caret-right"></i> <?php echo $text_wishlist; ?></a></li>
				
<li><a class="invarseColor" href="<?php echo $order; ?>"><i class="icon-caret-right"></i> <?php echo $text_order; ?></a></li>
<li><a class="invarseColor" href="<?php echo $download; ?>"><i class="icon-caret-right"></i> <?php echo $text_download; ?></a></li>
<li><a class="invarseColor" href="<?php echo $return; ?>"><i class="icon-caret-right"></i> <?php echo $text_return; ?></a></li>
<li><a class="invarseColor" href="<?php echo $transaction; ?>"><i class="icon-caret-right"></i> <?php echo $text_transaction; ?></a></li>
<li><a class="invarseColor" href="<?php echo $newsletter; ?>"><i class="icon-caret-right"></i> <?php echo $text_newsletter; ?></a></li>

<?php if ($logged) { ?>
<li><a class="invarseColor" href="<?php echo $logout; ?>"><i class="icon-caret-right"></i> <?php echo $text_logout; ?></a></li> 
<?php } ?>

					</ul><br/>
			

			
