<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="row">


   <div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>
   </div><!--end span3-->  
  <?php if ($products) { ?>
  <div class="span9"><?php echo $content_top; ?>
  <h3><?php echo $heading_title; ?></h3>
  <div class="productFilter clearfix">

						<div class="sortBy inline pull-left">
							<?php echo $text_sort; ?>
					<select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
						</div>
					<div class="showItem inline pull-left">
						<?php echo $text_limit; ?>
				 <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
						</div><!--end sortBy-->

						<div class="compareItem inline pull-left">
							<a href="<?php echo $compare; ?>" id="compare-total" class="btn"><?php echo $text_compare; ?></a>
						</div><!--end compareItem-->

						<div class="displaytBy inline pull-right">
							<?php echo $text_display; ?>
							<div class="btn-group">
									<a onclick="switchtab('tab_grid');" title="<?php echo $text_grid; ?>"  class="btn btn-primary active"><i class="icon-th"></i></a>
								<a onclick="switchtab('tab_list');" title="<?php echo $text_list; ?>"  class="btn"><i class="icon-list"></i></a>
							</div>
						</div><!--end displaytBy-->

					</div><!--end productFilter-->
					
  
  
  

<div id="tab_list" class="row" style="display:none;">
						<ul class="listProductItems clearfix">
   <?php foreach ($products as $product) { ?>
<li class=" clearfix">
<div class="span3">
						<?php if ($product['thumb']) { ?>
									<div class="thumbnail">
								
       <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
       
		
									</div> <?php } ?>
								</div>
<div class="span6">								
									
									<div class="thumbSetting">
										<div class="thumbTitle">
											<a href="<?php echo $product['href']; ?>" class="invarseColor">
											<?php echo $product['name']; ?>
											</a>
										</div>
										
										<div class="thumbPriceRate clearfix">
										 <?php if ($product['price']) { ?>   
										 <?php if (!$product['special']) { ?>
											<span> <?php echo $product['price']; ?></span>
 <?php } else { ?>
        <span><span class="strike-through"><?php echo $product['price']; ?></span> <?php echo $product['special']; ?></span>
        <?php } ?> 
		<?php } ?>
		 <ul class="rating">
<?php if ($product['rating']) { ?>
<li><img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></li>
 <?php } else { ?>
<li><img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" />
</li>
<?php } ?>
</ul>
										</div>  
										
										
<div class="thumbDesc">
											<p>
												<?php echo $product['description']; ?>
											</p>
										</div>
										
										<div class="thumbButtons">
											<button id="cart" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-small" data-title="<?php echo $button_cart; ?>" data-placement="top" data-toggle="tooltip">
												<i class="icon-shopping-cart"></i>
											</button>
											<button id="wishlist" onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="<?php echo $button_wishlist; ?>" data-placement="top" data-toggle="tooltip">
												<i class="icon-heart"></i>
											</button>
										
											<button id="compare" onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="<?php echo $button_compare; ?>" data-placement="top" data-toggle="tooltip">
												<i class="icon-refresh"></i>
											</button>
										</div>

       
       
									</div>	
									</div>
							</li> 
<?php } ?>

</ul>
					</div><!--end row-->


<div id="tab_grid" style="display: block;" class="row">  <?php foreach ($products as $product) { ?>
				    <ul class="hProductItems clearfix">
							<li class="span3 clearfix">
								<div class="thumbnail">
									  <?php if ($product['thumb']) { ?>
    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a>
      <?php } ?>
								</div>
								<div class="thumbSetting">
									<div class="thumbTitle">
										<a href="<?php echo $product['href']; ?>" class="invarseColor">
											<?php echo $product['name']; ?>
										</a>
									</div>
 <?php if ($product['price']) { ?>
									<div class="thumbPrice">
 <?php if (!$product['special']) { ?>
        <span><?php echo $product['price']; ?></span>
 <?php } else { ?>
        <span><span class="strike-through"><?php echo $product['price']; ?></span> <?php echo $product['special']; ?></span>
        <?php } ?>
									</div>
  <?php } ?>

									<div class="thumbButtons">
										<button onclick="addToCart('<?php echo $product['product_id']; ?>');"  class="btn btn-primary btn-small" data-title="+<?php echo $button_cart; ?>" data-placement="top" data-toggle="tooltip">
											<i class="icon-shopping-cart"></i>
										</button>
										<button onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+<?php echo $button_wishlist; ?>" data-placement="top" data-toggle="tooltip">
											<i class="icon-heart"></i>
										</button>
									
										<button onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+<?php echo $button_compare; ?>" data-placement="top" data-toggle="tooltip">
											<i class="icon-refresh"></i>
										</button>
									</div>

									<ul class="rating">
<?php if ($product['rating']) { ?>
										<li><img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></li>
 <?php } else { ?>
										<li><img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" /></li> <?php } ?>
										
									</ul>
								</div>
							</li>   <?php } ?>
					</ul>
						
                    </div>


				
 <div class="pagination pagination-right"><?php echo $pagination; ?></div>
  
  
  
  
  
  

  
  <?php } else { ?>
  <div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Oh, We're So Sorry</h4>
						<?php echo $text_empty; ?>
					</div><!--end alert-->

					

  <?php }?>
<?php echo $content_bottom; ?>
  </div><!--end span9-->
 
  </div><!--end row-->
  
</div>
  
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
						
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 
<?php echo $footer; ?>