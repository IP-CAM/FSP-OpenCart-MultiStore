<div class="span4">

					<div>
						<div class="titleHeader clearfix">
							<h3><?php echo $heading_title; ?></h3>
							<div class="pagers">
								<div class="btn-toolbar">
									<div class="btn-group">
										<button class="btn btn-mini vNext"><i class="icon-caret-down"></i></button>
										<button class="btn btn-mini vPrev"><i class="icon-caret-up"></i></button>
									</div>
									<a href="index.php?route=product/special" class="btn btn-mini">View All</a>
								</div>
							</div>
						</div><!--end titleHeader-->


						<ul class="vProductItems cycle-slideshow vertical clearfix"
					    data-cycle-fx="carousel"
					    data-cycle-pause-on-hover="true"
					    data-cycle-timeout="800"
					    data-cycle-slides="> li"
					    data-cycle-next=".vPrev"
					    data-cycle-prev=".vNext"
					    data-cycle-carousel-visible="2"
					    data-cycle-carousel-vertical="true"
					    >
						<?php foreach ($products as $product) { ?>
							<li class="span4 clearfix">
								<?php if ($product['thumb']) { ?>
								<div class="thumbImage">
									<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"/></a>
								</div>
								<?php } ?>
								<div class="thumbSetting" style="width:167px;height:78px;">
									<div class="thumbTitle">
										<a href="<?php echo $product['href']; ?>" class="invarseColor"><?php echo $product['name']; ?></a>
									</div>
									<div class="thumbPrice">
										<?php if ($product['price']) { ?><span><?php echo $product['special']; ?></span><?php } ?>
									</div>
									 
        <div class="rating">
<?php if ($product['rating']) { ?>
<img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
<?php } else { ?>
<img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" />
    <?php } ?>
</div>
    
								</div>
							</li>
							<?php } ?>
						</ul>
					</div><!--end homeSpecial-->

				</div><!--end span4-->