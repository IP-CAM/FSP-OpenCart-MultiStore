<?php echo $header; ?>


<div id="content">


  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<div class="row">

				<div class="span13"><?php echo $content_top; ?>
  <h3><?php echo $heading_title; ?></h3>
  <?php echo $description; ?>

  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?>
</div><!--end span9-->
<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->


</div>

</div><!--end row-->


<?php echo $footer; ?>