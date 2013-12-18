<?php echo $header; ?>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">
 <div class="span9"><?php echo $content_top; ?>
  <h3><?php echo $heading_title; ?></h3>
  <p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>





<table class="table">
    <thead>
      <tr>


<th><?php echo $column_date_added; ?></th>
								<th class="desc"><?php echo $column_description; ?></th>
								<th><?php echo $column_amount; ?></th>

      
      </tr>
    </thead>
    <tbody>
      <?php if ($transactions) { ?>
      <?php foreach ($transactions  as $transaction) { ?>
      <tr>
        <td><?php echo $transaction['date_added']; ?></td>
        <td class="desc"><?php echo $transaction['description']; ?></td>
        <td class="total-price"><?php echo $transaction['amount']; ?></td>
      </tr>
      <?php } ?>
      <?php } else { ?>
      <tr>
        <td class="center" colspan="5"><?php echo $text_empty; ?></td>
      </tr>
      <?php } ?>
    </tbody>
  </table>

<div class="pagination pagination-right"><?php echo $pagination; ?></div>



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

 </div><!--end span3-->
  

</div><!--end row-->
</div>


<?php echo $footer; ?>