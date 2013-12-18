<?php echo $header; ?>




<div id="content">

<?php if ($success) { ?>
<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button><?php echo $success; ?></div>
<?php } ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">
 <div class="span9"><?php echo $content_top; ?>
  <!--<h3><?php echo $heading_title; ?></h3>-->
  <?php if ($products) { ?>

   <table class="table">
      <thead>
        <tr>
          <th><?php echo $column_image; ?></th>
          <th class="desc"><?php echo $column_name; ?></th>
          <th><?php echo $column_model; ?></th>
          <th><?php echo $column_stock; ?></th>
          <th><?php echo $column_price; ?></th>
          <th><?php echo $column_action; ?></th>
        </tr>
      </thead>
      <?php foreach ($products as $product) { ?>
      <tbody id="wishlist-row<?php echo $product['product_id']; ?>">
        <tr>
          <td><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="desc"><h4><a href="<?php echo $product['href']; ?>" class="invarseColor"><?php echo $product['name']; ?></a></h4></td>
         	<td class="quantity"><?php echo $product['model']; ?></td>
         	<td><?php echo $product['stock']; ?></td>
          <td class="total-price">
<?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <s><?php echo $product['price']; ?></s> <b><?php echo $product['special']; ?></b>
              <?php } ?>
            </div>
            <?php } ?>
</td>
          <td>
		<button alt="<?php echo $button_cart; ?>" title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-small btn-primary" data-title="+<?php echo $button_cart; ?>" data-placement="top" data-toggle="tooltip"><i class="icon-shopping-cart"></i></button>
									<a href="<?php echo $product['remove']; ?>" class="btn btn-small btn-danger" data-title="<?php echo $button_remove; ?>" data-placement="top" data-toggle="tooltip"><i class="icon-trash"></i></a>

</td>
        </tr>
      </tbody>
      <?php } ?>
    </table>


<br/>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>


  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
<br/>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>

  <?php } ?>
<?php echo $content_bottom; ?>
</div><!--end span9-->
<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->


  

</div><!--end row-->
 </div>
<?php echo $footer; ?>