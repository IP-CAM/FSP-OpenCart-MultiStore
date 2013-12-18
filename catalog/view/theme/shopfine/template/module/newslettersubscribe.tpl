<div class="span3">
   
  <div class="titleHeader clearfix"><h3><?php echo $heading_title; ?></h3></div>
  <div class="box-content" style="text-align: center;">
  
  <?php 
   if($thickbox) { ?>
	<a href="#frm_subscribe" title="Newsletter Subscribe" class="fancybox_sub"> <?php echo($text_subscribe); ?> </a>
  <?php }  ?>
  <?php 
   if($thickbox) { ?> <div id="frm_subscribe_hidden" style="display:none;"> <?php } ?>
  <div id="frm_subscribe" class="newslatter">
  <form name="subscribe" id="subscribe">

  <input type="text" value="" name="subscribe_email" id="subscribe_email" placeholder="*<?php echo $entry_email; ?>" class="input-block-level">
   <input type="text" value="" name="subscribe_name" id="subscribe_name" placeholder="<?php echo $entry_name; ?>" class="input-block-level">
  
     <table border="0" cellpadding="2" cellspacing="2">
   <?php 
     for($ns=1;$ns<=$option_fields;$ns++) {
     $ns_var= "option_fields".$ns;
   ?>
   <tr>
    <td align="left">
      <?php 
       if($$ns_var!=""){
         echo($$ns_var."&nbsp;<br/>");
         echo('<input type="text" value="" name="option'.$ns.'" id="option'.$ns.'">');
       }
      ?>
     </td>
   </tr>
   <?php 
     }
   ?>
   <tr>
     <td align="left">
     
     </td>
   </tr>
   <tr>
    
   </tr>
  </table>
    <a class="btn btn-block" onclick="email_subscribe()"><span><?php echo $entry_button; ?></span></a><?php if($option_unsubscribe) { ?>
          <a class="btn btn-block" onclick="email_unsubscribe()"><span><?php echo $entry_unbutton; ?></span></a>
      <?php } ?>   
      <br/>
      <div id="subscribe_result" class="warning" style="display:none;"></div>
       <div id="subscribe_result2" class="alert alert-success" style="display:none;"></div>
  </form>
  </div>
  <?php if($thickbox) { ?> </div> <?php } ?>
  </div>
 
<script language="javascript">
	<?php 
  		if(!$thickbox) { 
	?>	
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
                
                       $('#subscribe_result').css("display","none");
                        $('#subscribe_result2').css("display","none");
				eval(html);
			}}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
   <?php }else{ ?>
function email_subscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
function email_unsubscribe(){
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/unsubscribe',
			dataType: 'html',
            data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}}); 
}
   <?php } ?>
   
$('.fancybox_sub').fancybox({
	width: 180,
	height: 180,
	autoDimensions: false
});
</script>
</div>
