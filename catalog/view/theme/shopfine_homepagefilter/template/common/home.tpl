<?php echo $header; ?>

<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<div id="content">
    <div class="row">
        <?php echo $content_top; ?>
    </div><!--end row-->
    <div class="row">
        <div class="span3 margin-top-10">
            <?php echo $column_left; ?>
        </div>
        <div class="span9" style="margin-top: 10px;">

            <?php if(isset($categories) && !empty($categories)) { ?>
            <div id="cat_list" class="row" style="display: block;">
                <ul id="cat_list_ul" class="hProductItems clearfix">
                    <?php foreach($categories as $category) { ?>
                    <li class="clearfix image-desc span3">
                        <div class="thumbnail">
                            <a href="<?php echo $category['href']; ?>" class="thumb-info">
                                <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" />
                                <span class="image-name"><?php echo $category['name']; ?></span>
                                <span class="image-descall">
                                    <span class="image-action" style="display:block;"><?php echo html_entity_decode($category['desc'],ENT_QUOTES,"UTF-8");  ?></span>
                                </span>
                                <span class="top-count"><span class="top-count-action"><?php echo $category['prod_count']; ?></span></span>
                            </a>
                        </div>
                    </li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?>



            <div id="sort" class="clearfix" style="display: none;"></div>
            <div id="tab_grid" class="row" style="display: none;"></div>
            <div id="pagination" class="pagination pagination-right clearfix" style="display: none;"><!-- Bottom pagination --></div>
            <?php echo $column_right; ?>
        </div>
    </div>
    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>