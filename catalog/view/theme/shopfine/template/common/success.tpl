<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="row">
        <div class="span9">
            <?php echo $content_top; ?>
            <h3>Thank You !!!</h3>
            <br/>
            <div class="alert alert-error">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <h4><?php //echo $heading_title; ?></h4>
                <?php echo $text_message; ?></div>
            <div class="control-group">
                <div class="controls">
                    <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
                </div>
            </div><!--end control-group-->
            <?php echo $content_bottom; ?>
        </div><!--end span9-->
        <div class="span3">
            <?php echo $column_left; ?>
            <?php echo $column_right; ?>
        </div>
    </div><!--end row-->
</div>
<?php echo $footer; ?>