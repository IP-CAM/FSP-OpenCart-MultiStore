<?php echo $header; ?>




<div id="content">

<?php if ($success) { ?>
<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>

<?php echo $success; ?></div>
<?php } ?>

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<div class="row">
<div class="span12">

  <!--<h3><?php echo $heading_title; ?></h3>-->
  <?php if ($products) { ?>
 <table class="table table-compare">
    
      <!--<tr>
        <td class="aligned-color" colspan="<?php echo count($products) + 1; ?>"><?php echo $text_product; ?></td>
      </tr>-->
  
  
      <tr>
        <td class="aligned-color"><h3><?php echo $text_name; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><h4><a href="<?php echo $products[$product['product_id']]['href']; ?>" class="invarseColor"><?php echo $products[$product['product_id']]['name']; ?></a></h4></td>
        <?php } ?>
      </tr>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_image; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><?php if ($products[$product['product_id']]['thumb']) { ?>
          <img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
          <?php } ?></td>
        <?php } ?>
      </tr>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_price; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td class="price">
<?php if ($products[$product['product_id']]['price']) { ?>
          <?php if (!$products[$product['product_id']]['special']) { ?>
          <?php echo $products[$product['product_id']]['price']; ?>
          <?php } else { ?>
          <span class="strike-through"><?php echo $products[$product['product_id']]['price']; ?></span> <span><?php echo $products[$product['product_id']]['special']; ?></span>
          <?php } ?>
          <?php } ?>
</td>
        <?php } ?>
      </tr>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_model; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['model']; ?></td>
        <?php } ?>
      </tr>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_manufacturer; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td class="aligned-color"><h3><?php echo $text_availability; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['availability']; ?></td>
        <?php } ?>
      </tr>
	  <?php if ($review_status) { ?>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_rating; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><img src="catalog/view/theme/shopfine/image/stars-<?php echo $products[$product['product_id']]['rating']; ?>.png" alt="<?php echo $products[$product['product_id']]['reviews']; ?>" /><br />
          <small><?php echo $products[$product['product_id']]['reviews']; ?></small></td>
        <?php } ?>
      </tr>
      <?php } ?>
	  <tr>
        <td class="aligned-color"><h3><?php echo $text_summary; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
        <?php } ?>
      </tr>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_weight; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['weight']; ?></td>
        <?php } ?>
      </tr>
      <tr>
         <td class="aligned-color"><h3><?php echo $text_dimension; ?></h3></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
        <?php } ?>
      </tr>
   

 <?php foreach ($attribute_groups as $attribute_group) { ?>
    
      <tr>
        <td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
      </tr>
   
    <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
 
      <tr>
        <td><?php echo $attribute['name']; ?></td>
        <?php foreach ($products as $product) { ?>
        <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
        <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
        <?php } else { ?>
        <td></td>
        <?php } ?>
        <?php } ?>
      </tr>
   
    <?php } ?>
    <?php } ?>


<tr>
 <td class="aligned-color"></td>
      <?php foreach ($products as $product) { ?>


<td>
							<button class="btn btn-small btn-primary" data-toggle="tooltip" data-title="+<?php echo $button_cart; ?>" data-placement="top" onclick="addToCart('<?php echo $product['product_id']; ?>');"><i class="icon-shopping-cart"></i></button>
							<button class="btn btn-small" data-toggle="tooltip" data-title="+To Wishlist" data-placement="top" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="icon-heart"></i></button>
							<a  href="<?php echo $product['remove']; ?>" class="btn btn-small btn-danger" data-toggle="tooltip" data-title="<?php echo $button_remove; ?>" data-placement="top"><i class="icon-trash"></i></a>
						</td>

      <?php } ?>
    </tr>

   
  </table>
 <!--<div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>-->
  
 
  <?php } else { ?>

  				<div class="alert alert-error">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
						<h4>Oh, We're So Sorry</h4>
  <?php echo $text_empty; ?></div>


  
<div class="control-group">
							    <div class="controls">
		     
								  
								    <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
							    </div>


							</div><!--end control-group-->
  <?php } ?>


</div><!--end span12-->

<?php echo $content_top; ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
  <?php echo $content_bottom; ?>

</div><!--end row-->
</div>



<?php echo $footer; ?>