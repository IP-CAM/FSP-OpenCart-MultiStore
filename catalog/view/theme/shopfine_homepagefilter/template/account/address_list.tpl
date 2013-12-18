<?php echo $header; ?>

<div id="content">

<?php if ($success) { ?>
<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button><?php echo $success; ?></div>
<?php } ?>

<?php if ($error_warning) { ?>
<div class="alert"><button type="button" class="close" data-dismiss="alert">×</button>
<?php echo $error_warning; ?></div>
<?php } ?>



  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

<div class="row">


 <div class="span9"><?php echo $content_top; ?>
<div class="register ">

						<div class="titleHeader clearfix">
							<h3><?php echo $heading_title; ?></h3>
						</div><!--end titleHeader-->

  <form class="form-horizontal">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $text_address_book; ?></h4>
  <?php foreach ($addresses as $result) { ?>
  <div class="content">
    <table style="width: 100%;">
      <tr>
<td>&nbsp;</td>
        <td style="width: 234px;"><?php echo $result['address']; ?></td>

        <td style="text-align: left;">

<a href="<?php echo $result['update']; ?>" class="btn btn-small btn-success" data-title="<?php echo $button_edit; ?>" data-placement="top" data-toggle="tooltip"><i class="icon-pencil"></i></a>

<a href="<?php echo $result['delete']; ?>" class="btn btn-small btn-danger" data-title="<?php echo $button_delete; ?>" data-placement="top" data-toggle="tooltip"><i class="icon-trash"></i></a>
								

</td>
      </tr>
    </table>
  </div>
<br/>
  <?php } ?>
<br/>


<div class="control-group">
							    <div class="controls">
							     
								  
								    <a href="<?php echo $back; ?>" class="btn btn-primary"><?php echo $button_back; ?></a>
							
							     
								  
								    <a href="<?php echo $insert; ?>" class="btn btn-info"><?php echo $button_new_address; ?></a>
							    </div>


							</div><!--end control-group-->

</form>
   <?php echo $content_bottom; ?>
</div>

  </div><!--end span9-->


<div class="span3">
<?php echo $column_left; ?>
<?php echo $column_right; ?>

  
</div>
 

</div><!--end row-->


</div>
<?php echo $footer; ?>