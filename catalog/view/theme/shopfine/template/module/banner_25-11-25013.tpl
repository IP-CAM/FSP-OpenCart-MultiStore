
<div id="banner<?php echo $module; ?>" class="banner" style="width:180px;overflow:hidden">
    <?php foreach ($banners as $banner) { ?>
    <?php if($banner['bannerType']=='image') { ?>
    <?php if ($banner['link']) { ?>
    <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
    <?php } else { ?>
    <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
</div>

<div  class="banner" id="bannerHTML<?php echo $module; ?>" style="overflow:hidden">
    <?php foreach ($banners as $banner) { ?>
    <?php if($banner['bannerType']=='html') { ?>

    <?php echo $banner['bannerHTML']; ?>

    <?php } ?>
    <?php } ?>
</div>

<?php foreach ($banners as $banner) { ?>
<?php if($banner['bannerType']=='html' && $banner['bannerStyle']=='1') { ?>
<script type="text/javascript"><!-- 
    var banner = function() {
    $('#bannerHTML<?php echo $module; ?>').cycle({
    before: function(current, next) {
    $(next).parent().height($(next).outerHeight());
}
});
}
            
setTimeout(banner, 2000);
//--></script>
<?php } else if($banner['bannerType']=='image' && $banner['bannerStyle']==1) { ?>

<script type="text/javascript"><!-- 
var banner = function() {
$('#banner<?php echo $module; ?>').cycle({
before: function(current, next) {
$(next).parent().height($(next).outerHeight());
}
});
}
            
setTimeout(banner, 2000);
//--></script>
<?php } ?>
<?php } ?>