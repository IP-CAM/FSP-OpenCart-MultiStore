<?php echo $header; ?>

<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<div id="content">
    <div class="row">
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span3 margin-top-10">
                <?php echo $column_left; ?>
            </div>
            <div class="span9" style="margin-top: 10px;">
                <div id="tab_grid" class="row" ></div>
                <!-- Bottom pagination -->
                <div id="pagination" class="pagination pagination-right clearfix" style="display: none;"></div>
            </div>
            <div class="span3 margin-top-10">
                <?php echo $column_right; ?>
            </div>

        </div><!--end row-->
    </div>
    <?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>