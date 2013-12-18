<?php 
$themeSettings =  $this->config->get('shopfine');

$bgpatterns = array(
'pattern1' 		=> 'Pattern 1',
'pattern2' 		=> 'Pattern 2',
'pattern3' 		=> 'Pattern 3',
'pattern4' 		=> 'Pattern 4',
'pattern5' 		=> 'Pattern 5',
'pattern6' 		=> 'Pattern 6',
'pattern7' 		=> 'Pattern 7',
'pattern8' 		=> 'Pattern 8',
'pattern9' 		=> 'Pattern 9',
'pattern10' 	=> 'Pattern 10',
'pattern11' 	=> 'Pattern 11',
'pattern12' 	=> 'Pattern 12',
'pattern13' 	=> 'Pattern 13',
'pattern14' 	=> 'Pattern 14',
'pattern15' 	=> 'Pattern 15',
'pattern16' 	=> 'Pattern 16',
'pattern17' 	=> 'Pattern 17',
'pattern18' 	=> 'Pattern 18',
'pattern19' 	=> 'Pattern 19',
'pattern20' 	=> 'Pattern 20',
'pattern21' 	=> 'Pattern 21',
'pattern22' 	=> 'Pattern 22',
'pattern23' 	=> 'Pattern 23',
'pattern24' 	=> 'Pattern 24',
'pattern25' 	=> 'Pattern 25',
'pattern26' 	=> 'Pattern 26',
'pattern27' 	=> 'Pattern 27'

);

$colorschemes = array(
'blue' 		=> 'Theme blue',
'brown' 		=> 'Theme brown',
'green' 		=> 'Theme green',
'orange' 		=> 'Theme orange',
'red' 		=> 'Theme red',

);

$bgcolors = array(
'col1' 			=> 'Color 1',
'col2' 			=> 'Color 2',
'col3' 			=> 'Color 3',
'col4' 			=> 'Color 4',
'col5' 			=> 'Color 5',
'col6' 			=> 'Color 6',
'col7' 			=> 'Color 7',
'col8' 			=> 'Color 8',
'col9' 			=> 'Color 9',
'col10' 		=> 'Color 10',
'col11' 		=> 'Color 11',
'col12' 		=> 'Color 12',
'col13' 		=> 'Color 13',
'col14' 		=> 'Color 14',
'col15' 		=> 'Color 15',
'col16' 		=> 'Color 16',
'col17' 		=> 'Color 17',
'col18' 		=> 'Color 18',
'col19' 		=> 'Color 19',
'col20' 		=> 'Color 20',
'col21' 		=> 'Color 21',
'col22' 		=> 'Color 22',
'col23' 		=> 'Color 23',
'col24' 		=> 'Color 24',
'col25' 		=> 'Color 25',
'col26' 		=> 'Color 26',
'col27' 		=> 'Color 27'

);

$s_links = array(
'facebook' 				=> 'Facebook',
'twitter' 				=> 'Twitter',
'googleplus' 			=> 'Google+',
'pinterest' 			=> 'Pinterest',
'dribbble' 				=> 'Dribbble',
'rss' 					=> 'RSS',
'flickr' 				=> 'Flickr',
'linkedin' 				=> 'Linkedin',
'skype' 				=> 'Skype',
'vimeo' 				=> 'Vimeo',
'tumblr' 				=> 'Tumblr',
'behance' 				=> 'Behance',
'youtube' 				=> 'Youtube',
'yahoo' 				=> 'Yahoo',
'stumbleupon' 			=> 'Stumbleupon',
'forrst' 				=> 'Forrst',
'instagram' 			=> 'Instagram',
'amazon' 				=> 'Amazon',
'lastfm' 				=> 'Lastfm',
'picasa' 				=> 'Picasa',
'paypal' 				=> 'Paypal',
'deviantart' 			=> 'Deviantart',
'digg' 					=> 'Digg',
'blogger' 				=> 'Blogger',
'wordpress' 			=> 'Wordpress',
'github' 				=> 'Github',
'spotify' 				=> 'Spotify',
'dropbox' 				=> 'Dropbox',
'evernote' 				=> 'Evernote'

);

$count = 0;
foreach ($s_links as $sv => $sc) {

if(isset($themeSettings[$sv])){ 
if($themeSettings[$sv] != '') { 
$count++;
}
}
}
?>
<div class="row">

    <?php if(isset($themeSettings['infoEnable']) && ($themeSettings['infoEnable'] == 'enable')){ ?>
    <div class="">
        <div id="aboutUs">

            <!-- <div class="titleHeader clearfix">
                 <h3><?php echo $themeSettings['aboutTitle']; ?></h3>
                 <div class="pagers">
                     <div class="btn-toolbar">
                         <button class="btn btn-mini">Know More</button>
                     </div>
                 </div>
             </div>--><!--end titleHeader-->

            <?php echo html_entity_decode($themeSettings['footer_information']); ?>
        </div>
    </div><!--end span4-->
    <?php } ?>

    <div class="tweet">
        <script>
        function latestTweets() {	
           
        }
        </script>
        <!-- tweets will generate automaticlly here-->
    </div><!--end tweet-->

   

  

</div><!--end row-->





</div><!--end conatiner-->


<footer>
    <div class="footerOuter">
        <div class="container">
            <div class="row-fluid">

                <div class="span6">
                    <div class="titleHeader clearfix">
                        <h3><?php echo $text_information; ?></h3>
                    </div>
                    <div class="usefullLinks">
                        <div class="row-fluid">

                            <div class="span6">
                                <ul class="unstyled">
                                    <li><a class="invarseColor" href="<?php echo $contact; ?>"><i class="icon-caret-right"></i> <?php echo $text_contact; ?></a></li>
                                    <!--    <li><a class="invarseColor" href="<?php echo $voucher; ?>"><i class="icon-caret-right"></i> <?php echo $text_voucher; ?></a></li>
                                        <li><a class="invarseColor" href="<?php echo $affiliate; ?>"><i class="icon-caret-right"></i> <?php echo $text_affiliate; ?></a></li> -->
                                    <li><a class="invarseColor" href="<?php echo $special; ?>"><i class="icon-caret-right"></i> <?php echo $text_special; ?></a></li>
                                </ul>
                            </div>

                            <?php if ($informations) { ?>
                            <div class="span6"> 
                                <ul class="unstyled">
                                    <?php foreach ($informations as $information) { ?>
                                    <li>
                                        <a class="invarseColor" href="<?php echo $information['href']; ?>"><i class="icon-caret-right"></i> <?php echo $information['title']; ?></a>
                                    </li>
                                    <?php } ?>
                                </ul>	
                            </div> 
                            <?php } ?>

                        </div>

                    </div>

                </div><!--end span6-->




                <!--<div class="span3">
                        <div class="titleHeader clearfix">
                                <h3><?php echo $text_service; ?></h3>
                        </div>

                        <div class="contactInfo">
                                <div class="row-fluid">
                        <div>
                                                <ul class="unstyled">
                                                        <li><a class="invarseColor" href="<?php echo $text_contact; ?>"><i class="icon-caret-right"></i> <?php echo $text_contact; ?></a></li>
                                                        <li><a class="invarseColor" href="<?php echo $return; ?>"><i class="icon-caret-right"></i> <?php echo $text_return; ?></a></li>
                                                        <li><a class="invarseColor" href="<?php echo $sitemap; ?>"><i class="icon-caret-right"></i> <?php echo $text_sitemap; ?></a></li>
                                                <li><a class="invarseColor" href="<?php echo $account; ?>"><i class="icon-caret-right"></i> <?php echo $text_account; ?></a></li>
                                                
                                                
                                                </ul>
                                        </div>
                                        </div>
                        </div>

                </div>--><!--end span3-->



                <?php if(isset($themeSettings['customEnable']) && ($themeSettings['customEnable'] == 'enable')){ ?>
                <div class="span3">
                    <div class="titleHeader clearfix">
                        <h3><?php echo $themeSettings['customTitle']; ?></h3>
                    </div>

                    <div class="contactInfo">
                        <ul class="unstyled">
                            <li>
                                <button class="btn btn-small">
                                    <i class="icon-volume-up"></i>
                                </button>
                                <?php if(isset($themeSettings['telephone']) && ($themeSettings['telephone'] != '')){ ?>

                                <?php echo $themeSettings['telephone']; ?>

                                <?php } ?>
                            </li>
                            <!--<li>
                                    <button class="btn btn-small">
                                            <i class="icon-print"></i>
                                    </button>
                            <?php if(isset($themeSettings['fax']) && ($themeSettings['fax'] != '')){ ?>
    
                    <?php echo $themeSettings['fax']; ?>
            
            <?php } ?>
                            </li>-->
                            <li>
                                <button class="btn btn-small">
                                    <i class="icon-envelope-alt"></i>
                                </button>
                                <?php if(isset($themeSettings['email']) && ($themeSettings['email'] != '')){ ?>

                                <a class="invarseColor" href="javascript:void(0);"><?php echo $themeSettings['email']; ?></a>

                                <?php } ?>
                            </li>
                            <!-- <li>
                                <button class="btn btn-small">
                                    <i class="icon-map-marker"></i>
                                </button>
                                <?php if(isset($themeSettings['adress']) && ($themeSettings['adress'] != '')){ ?>

                                <?php echo html_entity_decode($themeSettings['adress']); ?>

                                <?php } ?>
                            </li> -->
                        </ul>
                    </div>

                </div><!--end span3-->

                <?php } ?>

                <?php if($modules){ 
                foreach($modules as $module) {
                echo $module;
                }
                ?>
                <?php } ?>
                <!--<div class="span3">
                    <div class="titleHeader clearfix">
                        <h3>Newsletter</h3>
                    </div>

                    <div class="newslatter">
                        <form method="get" action="#">
                            <input class="input-block-level" type="text" name="name" value="" placeholder="Your Name...">
                            <input class="input-block-level" type="text" name="email" value="" placeholder="Your E-Mail...">
                            <button class="btn btn-block" type="submit" name="">Join Us Now</button>
                        </form>
                    </div>

                </div>--><!--end span3-->


            </div><!--end row-fluid-->

        </div><!--end container-->
    </div><!--end footerOuter-->

    <div class="container">
        <div class="row">
            <div class="span12">
                <ul class="payments inline pull-right">
                    <li class="visia"></li>
                    <li class="paypal"></li>
                    <li class="electron"></li>
                    <li class="discover"></li>
                </ul>
                <p><?php if(isset($themeSettings['footer_copyright']) && ($themeSettings['footer_copyright'] != '')){ ?>
                    <?php echo html_entity_decode($themeSettings['footer_copyright']); ?>
                    <?php } else { ?>
                    <?php echo $powered; ?><?php } ?></p>
            </div>
        </div>
    </div>
</footer>
<!--end footer-->

</div><!--end mainContainer-->

<!-- Sidebar Widget
================================================== 
<?php if(isset($themeSettings['themePanel']) && ($themeSettings['themePanel'] == 'enable')){ ?>
<script src="catalog/view/theme/shopfine/js/jquery.style-switcher.js"></script>
<script src="catalog/view/theme/shopfine/js/themes_panel.js"></script>
<div class="switcher">
    <h3>Site Switcher</h3>
    <a class="Widget-toggle-link">+</a>

    <div class="switcher-content clearfix">
        <div id="layouts" class="layout-switch">
            <h4>Layout Style</h4>
            <div class="btn-group">
                <a href="javascript: void(0)" id="wide" class="btn">Wide</a>
                <a href="#" id="boxed" class="btn">Boxed</a>
            </div>
        </div><!--end layout-switch

        <div class="color-switch clearfix">
            <h4>Color Style</h4>
            <a href="javascript: void(0)" id="orange-color" class="color-switch-link">orange</a>
            <a href="javascript: void(0)" id="blue-color" class="color-switch-link">blue</a>
            <a href="javascript: void(0)" id="green-color" class="color-switch-link">green</a>
            <a href="javascript: void(0)" id="brown-color" class="color-switch-link">brown</a>
            <a href="javascript: void(0)" id="red-color" class="color-switch-link">red</a>
        </div><!--end color-switch

        <div class="pattern-switch">
            <h4>BG Pattern</h4>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/retina_wood.png);">retina_wood</a>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/bgnoise_lg.png);">bgnoise_lg</a>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/purty_wood.png);">purty_wood</a>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/irongrip.png);">irongrip</a>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/low_contrast_linen.png);">low_contrast_linen</a>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/tex2res5.png);">tex2res5</a>
            <a href="#" style="background:url(catalog/view/theme/shopfine/img/backgrounds/wood_pattern.png);">wood_pattern</a>
        </div><!--end pattern-switch

    </div><!--end switcher-content
</div>
<?php } ?>
<!-- End Sidebar Widget-->

<!-- JS
================================================== -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/jquery-ui.min.js"></script>-->
<!-- jQuery.Cookie -->
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<!-- bootstrap -->
<script src="catalog/view/theme/shopfine/js/bootstrap.min.js"></script>
<!-- flexslider -->
<script src="catalog/view/theme/shopfine/js/jquery.flexslider-min.js"></script>
<!-- cycle2 -->
<script src="catalog/view/theme/shopfine/js/jquery.cycle2.min.js"></script>
<script src="catalog/view/theme/shopfine/js/jquery.cycle2.carousel.min.js"></script>
<!-- custom function-->
<script src="catalog/view/theme/shopfine/js/custom.js"></script>

<div id="back-top" class="goTop" style="display: block;">
    <a href="javascript:void(0);" data-placement="left" rel="tooltip" data-original-title="Back To Top">
        BackTop
    </a>
</div>

<div id="overlay" class="overlay">
    <img src="catalog/view/theme/shopfine/img/ovellay_loading.gif" />
</div>
</body>

</html>