<?php if($banners['config']['bannerType']=='image') { ?>
<div id="banner<?php echo $module; ?>" class="banner">
    <?php foreach ($banners['banners'] as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <div><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
    <?php } else { ?>
    <div><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
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