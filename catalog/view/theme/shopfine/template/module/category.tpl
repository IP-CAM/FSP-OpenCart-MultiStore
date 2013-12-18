
					<div class="categories">
						<!--end titleHeader-->
						<ul class="unstyled">
						 <?php foreach ($categories as $category) { ?>
						 <?php if ($category['category_id'] == $category_id) { ?>
        <li><a href="<?php echo $category['href']; ?>" class="invarseColor  active" ><?php echo $category['name']; ?></a></li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>" class="invarseColor"><?php echo $category['name']; ?></a></li>
        <?php } ?>
		
						
							
							<li>
							<?php if ($category['children']) { ?>
								<ul class="submenu">
								 <?php foreach ($category['children'] as $child) { ?>
									
									
									 <?php if ($child['category_id'] == $child_id) { ?>
            <li><a href="<?php echo $child['href']; ?>" class="invarseColor active"><?php echo $child['name']; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $child['href']; ?>" class="invarseColor"><?php echo $child['name']; ?></a></li>
            <?php } ?>
			 <?php } ?>
								</ul>
								 <?php } ?>
							</li>
							 <?php } ?>
						</ul>
					</div><!--end categories-->
				<br/>