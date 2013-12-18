<?php if($banners['config']['bannerType']=='image') { ?>
<div id="banner<?php echo $module; ?>" class="banner image">
    <?php foreach ($banners['banners'] as $banner) { ?>
    <?php foreach ($banner['image'] as $image) { ?>
    <?php if ($banner['link']) { ?>
    <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
    <?php } else { ?>
    <div><img src="<?php echo $image; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
    <?php } ?>
    <?php } ?>
    <?php } ?>
</div>
<?php }elseif($banners['config']['bannerType']=='html'){ ?>
<div id="bannerHTML<?php echo $module; ?>" class="banner">
    <?php foreach ($banners['banners'] as $banner) { ?>
    <?php echo $banner['bannerHTML']; ?>
    <?php } ?>   
</div>
<?php } ?>

<?php if($banners['config']['bannerType']=='image' && $banners['config']['bannerStyle']==1) { ?>
<?php foreach ($banners as $banner) { ?>
<script type="text/javascript"><!--
    $(document).ready(function() {
	$('#banner<?php echo $module; ?> div:first-child').css('display', 'block');
    });
     var banner = function() {
     console.log("test");
        $('#banner<?php echo $module; ?>').cycle({
            before: function(current, next) {
            //console.log(current);
            //console.log(next);
                $(next).parent().height($(next).outerHeight());
            }
        });
    }
    setTimeout(banner, 2000);
    //--></script>
<?php } ?>
<?php } ?>