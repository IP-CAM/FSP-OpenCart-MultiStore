<?php if ($position == 'content_top'  or $position == 'content_bottom') { ?>
<div class="titleHeader clearfix">
    <h2><?php echo $heading_title; ?></h2>
</div>


<div class="row">  <?php foreach ($products as $product) { ?>
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
                    <button onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+To Wish List" data-placement="top" data-toggle="tooltip">
                        <i class="icon-heart"></i>
                    </button>

                    <!--     <button onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+To Compare" data-placement="top" data-toggle="tooltip">
                             <i class="icon-refresh"></i>
                         </button> -->
                </div>

                <!-- <ul class="rating">
                     <?php if ($product['rating']) { ?>
                     <li><img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></li>
                     <?php } else { ?>
                     <li><img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" /></li> <?php } ?>
 
                 </ul> -->
            </div>
        </li>   <?php } ?>
    </ul>
    <br/>	
</div>


<?php } else if ($position == 'column_left' or $position == 'column_right') { ?>
<div class="aside-inner" id="product-aside">
    <div class="special">
        <div class="titleHeader clearfix">
            <h3><?php echo $heading_title; ?></h3>
        </div><!--end titleHeader-->

        <ul class="vProductItemsTiny"><?php foreach ($products as $product) { ?>
            <li class="span4 clearfix">
                <div class="thumbImage">
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
                    <?php if ($product['price']) { ?>
                    <div class="thumbPrice">

                        <span><?php if (!$product['special']) { ?><span class="strike-through"><?php echo $product['price']; ?></span><?php } else { ?> <?php echo $product['special']; ?>   <?php } ?></span>


                    </div>
                    <?php } ?>
                    <ul class="rating">
                        <?php if ($product['rating']) { ?>
                        <li>  <img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></li>
                        <?php } else { ?>
                        <li>  <img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" /></li>

                        <?php } ?>

                    </ul>
                </div>
            </li>
            <?php } ?>


        </ul>
    </div><!--end special-->
</div><!--end aside-inner-->
<?php } ?>