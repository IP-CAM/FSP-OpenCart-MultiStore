
					
<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="btn-group">
<div  class="btn-group">


							<a id="language" class="btn dropdown-toggle" data-toggle="dropdown" href="#"><?php foreach ($languages as $language) { ?><?php if ($language['code'] == $language_code) { ?><?php echo $language['code']; ?>  <span class="caret"></span><?php } ?>
        <?php } ?>
		
							</a>

					<ul class="dropdown-menu language">
								

  <?php foreach ($languages as $language) { ?>
  
     <?php if ($language['code'] == $language_code) { ?>
 <li><a title="<?php echo $language['name']; ?>"> <?php echo $language['code']; ?></a></li>
								<li class="divider"></li>
<?php } else { ?>

<li>
<a title="<?php echo $language['name']; ?>" onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().parent().parent().submit();"> <?php echo $language['code']; ?></a>
</li>
								<li class="divider"></li>
<?php } ?><?php } ?>
								
							</ul>
    <input type="hidden" name="language_code" value="" />
    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

						</div>
</form>
<?php } ?>

