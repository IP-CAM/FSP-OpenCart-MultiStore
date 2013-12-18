
<!-- <div class="span8" > -->
<div class="flexslider" id="slideshow<?php echo $module; ?>" >
    <ul class="slides">
        <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
        <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a></li>
        <?php } else { ?><li>
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></li>
        <?php } ?>
        <?php } ?>

    </ul>  	
</div><!--end flexslider-->
<!-- </div> end span8-->
