<div class="row">
    <div class="span12" style="margin-top:0px;">
        <div id="shopfine_featured">
            <!-- <div class="span12"> -->
            <div class="titleHeader clearfix">
                <h2 style="color: #F16325"><?php echo $heading_title; ?></h2>
                <div class="pagers">

                </div>
            </div><!--end titleHeader-->
            <!-- </div> -->

            <div class="row">
                <ul class="hProductItems clearfix">
                    <?php foreach ($products as $product) { ?>
                    <li class="span3 clearfix">
                        <?php if ($product['thumb']) { ?>
                        <div class="thumbnail">
                            <a href="<?php echo $product['href']; ?>">
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                <span class="thumbnail-featured-ribbon-img" ><?php echo $text_offer; ?></span>
                            </a>
                        </div> <?php } ?>


                        <div class="thumbSetting">
                            <div class="thumbTitle">
                                <a href="<?php echo $product['href']; ?>" class="invarseColor">
                                    <?php echo $product['name']; ?>
                                </a>
                            </div>
                            <?php if ($product['price']) { ?>
                            <div class="thumbPrice">
                                <?php if (!$product['special']) { ?>
                                <span class="strike-through"><?php echo $product['price']; ?></span> 
                                <?php } else { ?>
                                <span><span class="strike-through"><?php echo $product['price']; ?></span> 
                                    <?php echo $product['special']; ?></span>
                                <?php } ?>
                            </div>  
                            <?php } ?>

                            <div class="thumbButtons">
                                <button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-small" data-title="<?php echo $button_cart; ?>" data-placement="top" data-toggle="tooltip">
                                    <i class="icon-shopping-cart"></i>
                                </button>
                                <button onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="<?php echo $button_wishlist; ?>" data-placement="top" data-toggle="tooltip">
                                    <i class="icon-heart"></i>
                                </button>

                                <!--    <button onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="<?php echo $button_compare; ?>" data-placement="top" data-toggle="tooltip">
                                        <i class="icon-refresh"></i>
                                    </button> -->
                            </div>

                            <!--    <div class="rating">
                                    <?php if ($product['rating']) { ?>
                                    <img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
                                    <?php } else { ?>
                                    <img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" /><?php } ?>
                                </div> -->

                            <!--<ul class="rating">
                                    <li><i class="star-on"></i></li>
                                    <li><i class="star-on"></i></li>
                                    <li><i class="star-on"></i></li>
                                    <li><i class="star-on"></i></li>
                                    <li><i class="star-off"></i></li>
                            </ul>-->

                        </div>
                    </li>
                    <?php } ?>
                    <li class="span3 clearfix"><?php if(isset($info['description'])){ echo html_entity_decode($info['description']); } ?></li>
                    
                </ul>
            </div><!--end row-->
        </div><!--end shopfine_featuredItems-->
    </div><!--end span12-->

</div><!--end row-->


<!--<div class="box">
<div class="box-heading"><?php echo $heading_title; ?></div>
<div class="box-content">
<div class="box-product">
<?php foreach ($products as $product) { ?>
<div>
<?php if ($product['thumb']) { ?>
<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
<?php } ?>
<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
<?php if ($product['price']) { ?>
<div class="price">
<?php if (!$product['special']) { ?>
<?php echo $product['price']; ?>
<?php } else { ?>
<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
<?php } ?>
</div>
<?php } ?>
<?php if ($product['rating']) { ?>
<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
<?php } ?>
<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
</div>
<?php } ?>
</div>
</div>
</div>-->