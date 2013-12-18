	
				<div class="span12">	<br/><br/>
					<div id="homeLatest">
						<div class="titleHeader clearfix">
							<h3><?php echo $heading_title; ?></h3>
							<div class="pagers">
								<div class="btn-toolbar">
									<div class="btn-group">
										<button class="btn btn-mini vNext"><i class="icon-caret-left"></i></button>
										<button class="btn btn-mini vPrev"><i class="icon-caret-right"></i></button>
									</div>
									
									
								</div>
							</div>
						</div><!--end titleHeader-->


				<div class="row">
							<ul class="hProductItems clearfix">
							    <?php foreach ($products as $product) { ?>
								<li class="span3 clearfix">
									<div class="thumbnail">
									<?php if ($product['thumb']) { ?>
      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
        <?php } ?>
									</div>
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="<?php echo $product['href']; ?>" class="invarseColor">
										<?php echo $product['name']; ?>
											</a>
										</div>
										
										
									
										
										<div class="thumbPrice">
									<?php if ($product['price']) { ?>
     
          <?php if (!$product['special']) { ?>
        <span>  <?php echo $product['price']; ?></span>
          <?php } else { ?>
         <span> <span class="strike-through"><?php echo $product['price']; ?></span><?php echo $product['special']; ?></span>
          <?php } ?>
    
        <?php } ?>
										</div>

										<div class="thumbButtons">
										<a class="btn btn-primary btn-small" data-title="+<?php echo $button_cart; ?>"  onclick="addToCart('<?php echo $product['product_id']; ?>');" data-placement="top" data-toggle="tooltip">
												<i class="icon-shopping-cart"></i>
											</a>
											<a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+<?php echo $button_wishlist; ?>" data-placement="top" data-toggle="tooltip">
												<i class="icon-heart"></i>
											</a>
										
											<a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+<?php echo $button_compare; ?>" data-placement="top" data-toggle="tooltip">
												<i class="icon-refresh"></i>
											</a>
										</div>

										<ul class="rating">
											
										 <?php if ($product['rating']) { ?>
       <img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
        <?php } ?>
										</ul>
									</div>
								</li>
								  <?php } ?>
								</ul>
						</div><!--end row-->
					</div><!--end featuredItems-->
				</div><!--end span12-->
