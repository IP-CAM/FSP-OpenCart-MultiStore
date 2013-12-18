
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
 
						<li><a class="invarseColor" href="<?php echo $payment; ?>"><i class="icon-caret-right"></i> <?php echo $text_payment; ?></a></li>
						<li><a class="invarseColor" href="<?php echo $tracking; ?>"><i class="icon-caret-right"></i> <?php echo $text_tracking; ?></a></li>
						<li><a class="invarseColor" href="<?php echo $transaction; ?>"><i class="icon-caret-right"></i> <?php echo $text_transaction; ?></a></li>
		

<?php if ($logged) { ?>
<li><a class="invarseColor" href="<?php echo $logout; ?>"><i class="icon-caret-right"></i> <?php echo $text_logout; ?></a></li> 
<?php } ?>

					</ul>
	
<br/>
				