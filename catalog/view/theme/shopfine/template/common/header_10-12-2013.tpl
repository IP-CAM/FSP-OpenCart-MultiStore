<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="<?php echo $lang; ?>"> <!--<![endif]-->


    <head>
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <meta name="title" content="<?php echo $title; ?>" />

        <!-- Favicons ================================================== 
        <link rel="shortcut icon" href="catalog/view/theme/shopfine/images/favicon.ico">-->

        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>" />
        <?php } ?>

        <!-- Favicon Icon -->
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="shortcut icon" />
        <?php } ?>
        <!-- Favicon Icon -->

        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>

        <!-- Mobile Specific Metas ================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
        <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />

        <!-- CSS ================================================== -->
        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/bootstrap.min.css" media="screen">
        <!-- jquery ui css -->
        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/jquery-ui-1.10.1.min.css">

        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/customize.css">
        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/font-awesome.css">
        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/style.css">
        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/backgrounds/flowers.css">

        <!-- flexslider css-->
        <link rel="stylesheet" href="catalog/view/theme/shopfine/css/flexslider.css">

        <!-- fancybox -->
        <link rel="stylesheet" href="catalog/view/theme/shopfine/js/fancybox/jquery.fancybox.css">
        <script type="text/javascript" src="catalog/view/theme/shopfine/js/fancybox/jquery.fancybox.js"></script>
        <script type="text/javascript" src="catalog/view/theme/shopfine/js/fancybox/jquery.fancybox.pack.js"></script>

        <!--[if lt IE 9]>
                <script type="text/javascript" src="catalog/view/javascript/ie.shims.js"></script>
                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                <link rel="stylesheet" href="catalog/view/theme/shopfine/css/font-awesome-ie7.css">
        <![endif]-->

        <?php foreach ($styles as $style) { ?>
        <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>

        <?php foreach ($scripts as $script) { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
        <?php } ?>
        <!--   
                
                        <?php if ($stores) { ?>
                        <script type="text/javascript"><!--
                            $(document).ready(function() {
                                < ?php foreach ($stores as $store) { ? >
                                        $('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
                                < ?php } ? >
                            });
                            //</script>
                        <?php } ?>
                        <?php // echo $google_analytics; ?>
                
        -->


        <?php 
        if(isset($themeSettings['backgroundStyle']) && $themeSettings['backgroundStyle']=='image') { 
        if(isset($themeSettings['custom_background_pattern']) && $themeSettings['custom_background_pattern']!=''){ 
        $bodyClass = ''; ?>
        <style type="text/css">
            body {
                background-image:url("<?php echo HTTP_IMAGE . $themeSettings['custom_background_pattern']; ?>")!important;
            }
        </style>
        <?php 
        } else { 
        $bodyClass = $themeSettings['background_pattern']; 
        } 
        }
        else if(isset($themeSettings['backgroundStyle']) && $themeSettings['backgroundStyle']=='color') { 
        if(isset($themeSettings['custom_background_color']) && $themeSettings['custom_background_color']!=''){ 
        $bodyClass = ''; 
        ?>
        <style type="text/css">
            body {
                background: <?php echo $themeSettings['custom_background_color']; ?>!important;
            }
        </style>
        <?php 
        } else {
        $bodyClass = $themeSettings['background_color']; 
        }
        }
        ?>
        <?php if(isset($themeSettings['productMinHeight']) && ($themeSettings['productMinHeight'] != '')){ ?>
        <style type="text/css">
            .portfolio-item .post-info .post-title {
                min-height: <?php echo $themeSettings['productMinHeight']; ?>px!important;
            }
        </style>
        <?php } ?>
        <?php if(isset($themeSettings['customCss']) && ($themeSettings['customCss'] != '')){ ?>
        <style type="text/css">
            <?php echo $themeSettings['customCss']; ?>
        </style>
        <?php } ?>


        <?php $themeSettings =  $this->config->get('shopfine'); ?>

        <link rel="stylesheet" id="theme" type="text/css" href="catalog/view/theme/shopfine/css/color/green.css" />
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/imMenu.css" />
    </head>
    <body>
        <div id="mainContainer" class="<?php if(isset($themeSettings['layoutStyle']) && $themeSettings['layoutStyle']!=''){ echo $themeSettings['layoutStyle']; } else { echo 'wide'; }?>" >

            <!--begain header-->
            <header class="clearfix">
                <div class="upperHeader">
                    <div id="welcome" class="container">
                        <ul class="pull-right inline">
                            <li><?php echo $currency; ?></li>
                            <li class="divider-vertical"></li>
                            <li><a class="invarseColor" href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                            <li class="divider-vertical"></li>
                            <li><a class="invarseColor" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>
                            <li class="divider-vertical"></li>
                            <li><a class="invarseColor" href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>
                            <li class="divider-vertical"></li>
                            <li><a class="invarseColor" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                        </ul>
                        <p>
                            <?php if (!$logged) { ?>
                            <?php echo $text_welcome; ?>
                            <?php } else { ?>
                            <?php echo $text_logged; ?>
                            <?php } ?>
                        </p>
                    </div><!--end container-->
                </div><!--end upperHeader-->

                <div id="header" class="middleHeader">
                    <div class="container">

                        <div class="middleContainer clearfix">
                            <?php if ($logo) { ?>
                            <div id="logo" class="siteLogo pull-left">
                                <h1>
                                    <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                                </h1>  
                            </div>
                            <?php } ?>
                            <div class="pull-right">
                                <?php // echo $language; ?>
                                <?php echo $cart; ?>
                            </div>
                            <div class="pull-right">
                                <div id="search" class="siteSearch">
                                    <div  class="input-append">
                                        <input class="span2" type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" >
                                        <button class="btn-warning btn" type="submit" name=""><i class="icon-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div><!--end middleCoontainer-->

                    </div><!--end container-->
                </div><!--end middleHeader-->

                <?php if ($categories) {  ?> 
                <div id="menu" class="mainNav">
                    <div class="container">
                        <div class="navbar" >
                            <ul class="nav">		
                                <li <?php if($category_id == 0){ echo 'class="active"'; } ?> id="home_icon"><a href="<?php echo $home; ?>"><i class="icon-home"></i></a></li>
                                <?php foreach ($categories as $category) { ?>
                                <li id="mainNavParent_<?php echo $category['category_id']; ?>" <?php if($category['category_id'] == $category_id){ echo 'class="active"'; } ?>>
                                    <a href="<?php echo $category['href']; ?>"  >  <?php echo $category['name']; ?><i <?php if ($category['children']) { echo "class=\"icon-caret-down\""; } ?> ></i></a>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </div><!--end container-->
                    <div class="nav-children">		
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                        <div id="mainNavChild_<?php echo $category['category_id']; ?>" class="mainNavChild clearfix" style="display:none">
                            <?php if (count($category['children']) > 0) { ?>
                            <?php $column = ($category['column'])?$category['column']:4; ?>
                            <?php $i = ceil(count($category['children'])/$column); ?>
                            <?php $j = 0; ?>
                            <?php foreach($category['children'] as $key => $category){ ?>
                            <?php if($j%$i == 0){ ?>
                            <ul>
                                <?php } ?>
                                <?php if(isset($category['children']) && !empty($category['children'])){ ?>
                                <li class="parent">
                                    <a href="<?php echo $category['href']; ?>" <?php if($category['id'] == $fstCatKey){ echo 'style="text-decoration:underline;"'; } ?>><span><?php echo $category['name']; ?></span></a>
                                    <div class="second-child">
                                        <ul>
                                            <?php foreach($category['children'] as $key => $category){ ?>
                                            <li>
                                                <a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>
                                            </li>
                                            <?php } ?>
                                        </ul>
                                    </div>
                                </li>
                                <?php }else{ ?>
                                <li>
                                    <a href="<?php echo $category['href']; ?>" <?php if($category['id'] == $fstCatKey){ echo 'style="text-decoration:underline;"'; } ?>><span><?php echo $category['name']; ?></span></a>
                                </li>
                                <?php } ?>
                                <?php $j++; ?>
                                <?php if($j%$i == 0){ ?>
                            </ul>
                            <?php } ?>

                            <?php } ?>
                            <?php } ?>
                        </div><!--end nav-children -->
                        <?php } ?>  
                        <?php } ?>  
                    </div>
                </div><!--end mainNav-->
                <?php } ?>  

            </header>
            <!-- end header -->





            <div class="container">
                <div id="notification"></div>
