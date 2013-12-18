
<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php $total_breadcrumbs = count($breadcrumbs); ?>
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a <?php if($total_breadcrumbs != 1){ echo 'style="text-decoration: underline;"'; } ?> href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php $total_breadcrumbs--; ?>
        <?php } ?>
    </div>
    <div class="row">
        <div class="span3">	
            <?php echo $column_left; ?>
            <?php echo $column_right; ?>			
        </div>	
        <div class="span9"><?php echo $content_top; ?>
            <div class="row">

                <div class="product-details clearfix">

                    <div class="span5">
                        <div class="product-title">
                            <h1><?php echo $heading_title; ?></h1>
                        </div>
                        <?php if ($thumb || $images) { ?>
                        <div class="product-img">
                            <?php if ($thumb) { ?>
                            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="fancybox" rel="fancybox">
                                <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                            </a>
                            <?php } ?>


                        </div><!--end product-img-->
                        <?php if ($images) { ?>
                        <div class="product-img-thumb">
                            <?php foreach ($images as $image) { ?>
                            <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="fancybox" rel="fancybox">
                                <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                            </a>
                            <?php } ?>
                        </div><!--end flexslider-thumb-->
                        <?php } ?>
                    </div><!--end span5-->
                    <?php } ?>
                    <div class="span4">
                        <div class="product-set">
                            <?php if ($price) { ?>
                            <div class="product-price">
                                <?php if (!$special) { ?><span><?php echo $price; ?></span>
                                <?php } else { ?>
                                <span><span class="strike-through"><?php echo $price; ?></span> <?php echo $special; ?></span>
                                <?php } ?>
                            </div><!--end product-price-->
                            <?php } ?>

                            <div class="product-rate clearfix">
                                <h4><?php echo $heading_title; ?></h4>
                                <h5><?php echo $tag;  //if (!$special) {  echo $price;  } else { echo '<span class="strike-through">'.$price.'</span>'.$special; } ?></h5>
                                <?php if($description){ ?>
                                <div class="des" style="height: 60px;margin-top: 10px;overflow: hidden;text-align: justify;position: relative;">
                                    <?php echo $description; ?>
                                    <?php if(strlen($description) >= 170){ ?>
                                    <a href="" data-toggle="tab" class="more" onclick="showHide(this);" style="position: absolute;right: 0;bottom: 0;background-color: #fff;cursor: pointer;">. . .More</a>
                                    <?php } ?>
                                </div>
                                <?php } ?>
                                <!--   <ul class="rating">
                                       <?php if ($review_status) { ?>
                                       <li><img src="catalog/view/theme/shopfine/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /></li>
                                       <?php } else { ?>
                                       <li><img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $reviews; ?>" /></li>
                                       <?php } ?>
                                   </ul>
   
   
                                   <?php if ($review_status) { ?>
                                   <span>
                                       <?php echo $reviews; ?> 
   
                                       <a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a>
                                   </span>
                                   <?php } ?>
                                -->
                            </div><!--end product-rate -->

                            <div class="product-info product_info_prod_details">
                                <!--  <dl class="dl-horizontal">
                                      <dt><?php echo $text_stock; ?></dt>
                                      <dd><?php echo $stock; ?></dd>
  
                                      <dt><?php echo $text_model; ?></dt>
                                      <dd><?php echo $model; ?></dd>
  
                                      <?php if ($manufacturer) { ?>
                                      <dt><?php echo $text_manufacturer; ?></dt>
                                      <dd><a href="<?php echo $manufacturers; ?>">
                                              <?php echo $manufacturer; ?></a>
                                      </dd>
                                      <?php } ?>
  
                                      <?php if ($reward) { ?>
                                      <dt><?php echo $text_reward; ?></dt>
                                      <dd><?php echo $reward; ?></dd>
                                      <?php } ?>
                                  </dl> -->

                                <dl class="dl-horizontal">
                                    <?php if ($options) { ?>
                                    <?php foreach ($options as $option) { ?>
                                    <?php if ($option['type'] == 'information') { 
                                    $all_options= $alloptions[$option['option_id']];
                                    $info_view_type = $all_options['info_view_type'];
                                    if($info_view_type > 2 ){
                                    if($info_view_type == 3){
                                    ?>
                                    <dt><?php echo $option['name']; ?>:</dt>
                                    <dd>
                                        <?php 
                                        $i=0;
                                        $totalOp=count($option['option_value']);
                                        foreach ($option['option_value'] as $option_value) {
                                        foreach($all_options as $value){
                                        if(is_array($value) && is_array($option_value)){
                                        if($value['option_value_id'] == $option_value['option_value_id']){
                                        if(!preg_match ( '/\bno_image\b/i' , $option_value['image'])){ ?>
                                        <img src="<?php echo $option_value['image']; ?>" title="<?php echo $option_value['name']; ?>"  />
                                        <?php }elseif(!empty($value['html'])){ ?>
                                        <span class="filter-options-info" style="background-color: <?php echo $value['html']; ?>" ></span>
                                        <?}else{
                                        if($i >0)
                                        echo ",".$option_value['name'];
                                        else
                                        echo $option_value['name']; 
                                        }
                                        }
                                        }
                                        }
                                        $i++;
                                        } ?>
                                    </dd>
                                    <?php
                                    }
                                    if($info_view_type == 4){
                                    ?>
                                    <dt></dt>
                                    <dd><?php echo $option['name']; ?></dd>
                                    <?php
                                    }
                                    }
                                    } ?>
                                    <?php } } ?>
                                </dl>



                              <!--  <?php if ($price) { ?>
                                <dl class="dl-horizontal">
                                    <?php if ($tax) { ?>
                                    <dt><?php echo $text_tax; ?></dt>
                                    <dd><?php echo $tax; ?></dd>
                                    <?php } ?>
                                    <?php if ($points) { ?>
                                    <dt><?php echo $text_points; ?></dt>
                                    <dd><?php echo $points; ?></dd>
                                    <?php } ?>

                                    <?php if ($discounts) { ?>
                                    <?php foreach ($discounts as $discount) { ?>
                                    <dt><?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?></dt>
                                    <dd></dd>
                                    <?php } ?>
                                    <?php } ?>


                                </dl>
                                <?php } ?> -->
                            </div><!--end product-info-->



                            <div class="product-inputs">
                                <form>
                                    <?php if ($options) { ?>
                                    <?php foreach ($options as $option) { ?>

                                    <?php if ($option['type'] == 'image') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="product-info">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <table class="table-cart">
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <tr>
                                                <td style="width: 1px;">
                                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                </td>
                                                <td>
                                                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
                                                    </label>
                                                </td>
                                                <td>
                                                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                        <?php } ?>
                                                    </label>
                                                </td>
                                            </tr>
                                            <?php } ?>
                                        </table>


                                    </div><!--end product-info-->
                                    <?php } ?>


                                    <?php if ($option['type'] == 'checkbox') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="product-info">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />

                                        <dl class="dl-horizontal">
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <dt><input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></dt>
                                            <dd><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label>
                                            </dd>
                                            <?php } ?>
                                        </dl>
                                    </div><!--end product-info-->
                                    <?php } ?>

                                    <?php if ($option['type'] == 'radio') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="product-info">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />

                                        <table class="dl-horizontal table-product-inputs">
                                            <?php 
                                            $k=0;
                                            foreach ($option['option_value'] as $option_value) { ?>
                                            <tr>
                                                <td>
                                                    <input type="radio" <?php if($k==0){ echo "checked='checked'";  }?>name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                </td>
                                                <td>
                                                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?></label>
                                                </td>
                                                <?php if ($option_value['price']) { ?>
                                                <td><label style="margin-left: 10px;"><?php 
                                                        if($option_value['price_prefix']=='+')
                                                        { 
                                                        echo preg_replace('/[0-9]+.[0-9]+/',preg_replace('/^[^0-9]+/','',$price)+preg_replace('/^[^0-9]+/','',$option_value['price']),$option_value['price']);
                                                        }else{
                                                        echo $price-$option_value['price'];
                                                        } ?>
                                                    </label></td>
                                                <?php }else{ ?>
                                                <td><label style="margin-left: 10px;"><?php echo $price; ?></label></td>
                                                <?php } ?>
                                            </tr>
                                            <?php $k++;} ?>
                                        </table>
                                    </div><!--end product-info-->
                                    <?php } ?>

                                    <?php if ($option['type'] == 'file') { ?>
                                    <!-- Chua fix-->
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                        <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                    </div><!--end controls-row-->
                                    <?php } ?>


                                    <?php if ($option['type'] == 'date') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                                    </div><!--end controls-row-->
                                    <?php } ?>

                                    <?php if ($option['type'] == 'datetime') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                                    </div><!--end controls-row-->
                                    <?php } ?>


                                    <?php if ($option['type'] == 'time') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
                                    </div><!--end controls-row-->
                                    <?php } ?>



                                    <?php if ($option['type'] == 'text') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <input type="text" class="span3" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                    </div><!--end controls-row-->
                                    <?php } ?>

                                    <?php if ($option['type'] == 'select') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />
                                        <select class="span2" name="option[<?php echo $option['product_option_id']; ?>]">
                                            <option value=""><?php echo $text_select; ?></option>

                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                <?php } ?>
                                            </option>
                                            <?php } ?>
                                        </select>

                                    </div><!--end controls-row-->
                                    <?php } ?>




                                    <?php if ($option['type'] == 'textarea') { ?>
                                    <div id="option-<?php echo $option['product_option_id']; ?>" class="controls-row">
                                        <b><?php echo $option['name']; ?>:</b>
                                        <?php if ($option['required']) { ?>
                                        <span class="text-error">*</span>
                                        <?php } ?>
                                        <br />

                                        <textarea name="option[<?php echo $option['product_option_id']; ?>]" class="span4" placeholder=""><?php echo $option['option_value']; ?></textarea>
                                    </div><!--end controls-row-->
                                    <?php } ?> 

                                    <?php } ?>

                                    <?php } ?>

                                    <div class="input-append">
                                        <input class="span1" type="text"  name="quantity" value="<?php echo $minimum; ?>" placeholder="<?php echo $text_qty; ?>" />
                                        <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                                        <a id="button-cart" class="btn btn-primary"><i class="icon-shopping-cart"></i> <?php echo $button_cart; ?></a>

                                        <a onclick="addToWishList('<?php echo $product_id; ?>');" class="btn" data-toggle="tooltip" data-title="+<?php echo $button_wishlist; ?>"><i class="icon-heart"></i></a>
                                        <!-- <a onclick="addToCompare('<?php echo $product_id; ?>');" class="btn" data-toggle="tooltip" data-title="+<?php echo $button_compare; ?>"><i class="icon-refresh"></i></a> -->
                                        <?php if ($minimum > 1) { ?>
                                        <div class="minimum"><?php echo $text_minimum; ?></div>
                                        <?php } ?>
                                    </div>

                                </form><!--end form-->

                            </div><!--end product-inputs-->


                        </div><!--end product-set-->
                    </div><!--end span4-->

                </div><!--end product-details-->

                <!-- Filter Opetions -->
                <div class="span7 content-filter-options">
                    <?php if ($options) { 
                    $showPeriodImage = 'plant';
                    foreach ($options as $option) { 
                    if ($option['type'] == 'information') { 
                    $all_options= $alloptions[$option['option_id']];
                    $info_view_type = $all_options['info_view_type'];
                    unset($all_options['info_view_type']);
                    if ($info_view_type == '0') { ?>
                    <div class="text-filter-options">
                        <?php if($showPeriodImage == 'plant'){ ?>
                        <img src="catalog/view/theme/shopfine/image/trowel.png" />
                        <?php }elseif($showPeriodImage = 'Flowering'){ ?>
                        <img src="catalog/view/theme/shopfine/image/black-flower.png" />
                        <?php } ?>
                        <?php 
                        foreach($all_options as $dataOptions)
                        {
                        $selected = 'class="filter-options-info"';
                        foreach ($option['option_value'] as $option_value) { 
                        if($option_value['option_value_id']==$dataOptions['option_value_id'])
                        {
                        $selected = 'class="filter-options-info-selected"'; 
                        }
                        }
                        $showPeriodImage = 'Flowering';
                        ?>
                        <span <?php echo $selected;?> title="<?php echo $dataOptions['name']; ?>" ><?php echo $dataOptions['name'][0]; ?></span>
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <?php if ($info_view_type == '1') { ?>
                    <div class="image-filter-options">
                        <span><?php echo $option['name']; ?></span>
                        <?php foreach ($option['option_value'] as $option_value) { ?>
                        <img src="<?php echo $option_value['image']; ?>" />
                        <?php } ?>
                    </div>
                    <?php } ?>
                    <?php if ($info_view_type == '2') { ?>
                    <div class="html-filter-options">
                        <?php foreach ($all_options as $dataOptions) { 
                        foreach ($option['option_value'] as $option_value) { 
                        if($option_value['option_value_id']==$dataOptions['option_value_id'])
                        { ?> 
                        <span class="filter-options-info" style="background-color: <?php echo html_entity_decode($dataOptions['html']); ?>" ></span>
                        <?php } } } ?>
                    </div>
                    <?php } ?>

                    <?php } ?>
                    <?php }  ?>
                    <?php }  ?>
                </div>
                <!-- Filter Opetions End -->


            </div><!--end row-->




            <div class="product-tab">
                <ul class="nav nav-tabs">
                    <!-- <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li> 
                     <?php if ($attribute_groups) { ?>
                     <li>
                         <a href="#tab-attribute" data-toggle="tab"><?php echo $tab_attribute; ?></a>
                     </li>
                     <?php } ?>-->
                    <!--<li>
                          <a href="#return-info" data-toggle="tab">Return Info</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><?php echo $tab_review; ?> <i class="icon-caret-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="#review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                            <li><a href="#tab-review" data-toggle="tab"><?php echo $text_write; ?></a></li>
                        </ul>
                    </li>-->
                    <div id="after-all-tabs-tab"></div>
                </ul>
                <div class="tab-content">
                    <!--<div class="tab-pane active" id="tab-description"><p><?php echo $description; ?></p></div>
                    <div class="tab-pane" id="tab-attribute">
                        <table class="table table-compare">
                            <?php foreach ($attribute_groups as $attribute_group) { ?>
                            <tr>
                                <td class="aligned-color"><h5><?php echo $attribute_group['name']; ?></h5></td>
                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                <td><?php echo $attribute['name']; ?></td>
                                <td><?php echo $attribute['text']; ?></td>
                                <?php } ?>
                            </tr>
                            <?php } ?>
                        </table>
                    </div>

                    <div class="tab-pane" id="return-info">
                            <h4>Read our Returning info</h4><br>
                            <p>
                                    Suspendisse potenti. In non nisl sem, eu rutrum augue. Donec eu dolor vel massa ornare cursus id eget erat. Mauris in ante magna. Curabitur eget risus mi, non interdum lacus. Duis magna leo, rhoncus eget malesuada quis, semper a quam. Morbi imperdiet imperdiet lectus ac pellentesque. Integer diam sem, vulputate in feugiat ut, porttitor eu libero. Integer non dolor ipsum. Cras condimentum mattis turpis quis vestibulum. Nulla a augue ipsum. Donec aliquam velit vel metus fermentum dictum sodales metus condimentum. Nullam id massa quis nulla molestie ultrices eget sed nulla. Cras feugiat odio at tellus euismod lacinia.
                                    
                            </p>
                    </div>-->

                    <div id="btw-attribute-review"></div>

                    <!--
                    <?php if ($review_status) { ?>
                    <div class="tab-pane" id="review"></div>

                    <div class="tab-pane" id="tab-review">
                        <form class="form-horizontal">
                            <div  id="review-title" class="control-group" style="display:none;">  </div>

                            <div  class="control-group">
                                <label class="control-label" for="inputName"><?php echo $entry_name; ?> <span class="text-error">*</span></label>
                                <div class="controls">
                                    <input type="text" name="name" value="" placeholder="<?php echo $entry_name; ?>...">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputReview"><?php echo $entry_review; ?> <span class="text-error">*</span></label>
                                <div class="controls">
                                    <textarea name="text" placeholder="<?php echo $entry_review; ?>..."></textarea>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputReview"><?php echo $entry_rating; ?><span class="text-error">*</span></label>
                                <div class="controls">


                                    <div data-toggle="buttons-radio">

                                        <input type="radio" name="rating" value="1" />
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="rating" value="2" />
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="rating" value="3" />
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="rating" value="4" />
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="rating" value="5" />

                                        <br /> </div>


                                </div>

                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputReview"><?php echo $entry_captcha; ?><span class="text-error">*</span></label>
                                <div class="controls">
                                    <input class="span2" type="text" name="captcha" value="" />
                                    <br /><br />
                                    <img src="index.php?route=product/product/captcha" alt="" id="captcha" />
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <a id="button-review" class="btn btn-primary" ><?php echo $button_continue; ?></a>
                                </div>
                            </div>
                        </form>
                </div>
                <?php } ?> 
                    --><!--end form-->
                    <div id="after-all-tabs-content"></div>
                </div><!--end tab-content-->
            </div><!--end product-tab-->


            <?php if ($products) { ?>
            <div class="related-product">
                <div class="titleHeader clearfix">
                    <h3><?php echo $tab_related; ?></h3>
                </div>


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
                                    <button onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-small" data-title="+To Cart" data-placement="top" data-toggle="tooltip">
                                        <i class="icon-shopping-cart"></i>
                                    </button>
                                    <button onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+To WishList" data-placement="top" data-toggle="tooltip">
                                        <i class="icon-heart"></i>
                                    </button>

                                    <!-- <button onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="btn btn-small" data-title="+To Compare" data-placement="top" data-toggle="tooltip">
                                         <i class="icon-refresh"></i>
                                     </button> -->
                                </div>

                                <!--
                                                                <ul class="rating">
                                                                    <?php if ($product['rating']) { ?>
                                                                    <li><img src="catalog/view/theme/shopfine/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></li>
                                                                    <?php } else { ?>
                                                                    <li><img src="catalog/view/theme/shopfine/image/stars-0.png" alt="<?php echo $product['reviews']; ?>" /></li>
                                                                    <?php } ?>
                                                                </ul>
                                -->
                            </div>
                        </li>
                        <?php } ?>
                    </ul>
                </div>

                <div class="custom-tabs"></div>
            </div>
            <!--end related-product-->
            <?php } ?>

        </div><!--end span9-->
    </div>


    <?php echo $content_bottom; ?>
</div><!--end row-->

<script type="text/javascript"><!--
    $(document).ready(function() {
    $('.fancybox').fancybox({
    cyclic: true,
    opacity: 0.5,
    rel: "colorbox"
});
});
//--></script>



<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
$.ajax({
url: 'index.php?route=checkout/cart/add',
type: 'post',
data: $('.product-inputs input[type=\'text\'], .product-inputs input[type=\'hidden\'], .product-inputs input[type=\'radio\']:checked, .product-inputs input[type=\'checkbox\']:checked, .product-inputs select, .product-inputs textarea'),
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, information, .error').remove();
			
if (json['error']) {
if (json['error']['option']) {
for (i in json['error']['option']) {
$('#option-' + i).after('<span class="text-error">' + json['error']['option'][i] + '</span>');
}
}
} 
			
if (json['success']) {
$('#notification').html('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>' + json['success'] + '</div>');
					
$('.success').fadeIn('slow');

var cart_items = json['total'].split("-");
        
$('#cart-total').html(cart_items[0]);
				
$('html, body').animate({ scrollTop: 0 }, 'slow'); 
}	
}
});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
action: 'index.php?route=product/product/upload',
name: 'file',
autoSubmit: true,
responseType: 'json',
onSubmit: function(file, extension) {
$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
},
onComplete: function(file, json) {
$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
$('.error').remove();
		
if (json['success']) {
alert(json['success']);
			
$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
}
		
if (json['error']) {
$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="text-error">' + json['error'] + '</span>');
}
		
$('.loading').remove();	
}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
$('#review').fadeOut('slow');
		
$('#review').load(this.href);
	
$('#review').fadeIn('slow');
	
return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
$.ajax({
url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
type: 'post',
dataType: 'json',
data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
beforeSend: function() {
$('.success, .warning').remove();
$('#button-review').attr('disabled', true);
$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
},
complete: function() {
$('#button-review').attr('disabled', false);
$('.attention').remove();
},
success: function(data) {
if (data['error']) {
$('#review-title').after('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">&times;</button>' + data['error'] + '</div>');
}
			
if (data['success']) {
$('#review-title').after('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">&times;</button>' + data['success'] + '</div>');
								
$('input[name=\'name\']').val('');
$('textarea[name=\'text\']').val('');
$('input[name=\'rating\']:checked').attr('checked', '');
$('input[name=\'captcha\']').val('');
}
}
});
});
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
if ($.browser.msie && $.browser.version == 6) {
$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
dateFormat: 'yy-mm-dd',
timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script>
<script type="text/javascript"><!--
function showHide(ele){
if($(ele).attr("class") == 'more'){
$('.des').css("height" , '');
$('.des').css("overflow" , 'visible');
$(ele).css("bottom","-15px");
$(ele).css("line-height","12px");
$(ele).text("Less");
$(ele).removeClass("more").addClass("less");
}else{
if($(ele).attr("class") == 'less'){
$('.des').css("height" , '60px');
$('.des').css("overflow" , 'hidden');
$(ele).css("bottom","0");
$(ele).css("line-height","19px");
$(ele).text(". . .More");
$(ele).removeClass("less").addClass("more");
}
}
}
//--></script>

<script type="text/javascript"><!--
function a(){ 
$.ajax({
url: 'index.php?route = custom/product/add',
type: 'post',
data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
dataType: 'json',
success: function(json) {
$('.success, .warning, .attention, information, .error').remove();
if (json['error']) {
if (json['error']['option']) {
for (i in json['error']['option']) {
$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
}
}
} 
if (json['success']) {
$('.opprice').html ('<?php echo $text_oprice; ?>' + json['total']);
$('.price-tax').html ('<?php echo $text_tax; ?> ' + json['tax']);
}
}
});
} 
$(document).on("change", ".option", a);
$(document).on("keyup", "#bc", a);    

//--></script>

</div>
<?php  echo $footer; ?>