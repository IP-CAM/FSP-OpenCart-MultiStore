<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">
<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

 </div><!--end span3-->


<div class="span9"><?php echo $content_top; ?>
 <div class="register">
	
	<div class="titleHeader clearfix">
  <h3><?php echo $heading_title; ?></h3>
	</div><!--end titleHeader-->


<p><?php echo $text_description; ?></p>
<form class="form-horizontal">
  <h4>&nbsp;&nbsp;&nbsp;&nbsp;
<?php echo $text_code; ?></h4>

<div class="control-group">

							    <div class="controls">
							   <textarea class="span4"><?php echo $code; ?></textarea>
							
							    </div>
							</div><!--end control-group-->

  

<h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_generator; ?></h4>

<div class="control-group">

							    <div class="controls">
							<input type="text" class="span3" name="product" value="" />
							
							    </div>
							</div><!--end control-group-->



<h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_link; ?></h4>

<div class="control-group">

							    <div class="controls">
							
    <textarea name="link" class="span4"></textarea>
							
							    </div>
							</div><!--end control-group-->


<br/>
<div class="control-group">
							    <div class="controls">
		     
								  
								    <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
							    </div>


							</div><!--end control-group-->


</form>
</div> 
 <?php echo $content_bottom; ?>
</div>
</div>


</div>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.link
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'product\']').attr('value', ui.item.label);
		$('textarea[name=\'link\']').attr('value', ui.item.value);
						
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});
//--></script> 
<?php echo $footer; ?>