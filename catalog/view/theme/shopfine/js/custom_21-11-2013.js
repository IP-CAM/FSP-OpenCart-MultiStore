function switchtab(tab_list) {
    var thearray = new Array("tab_list", "tab_grid");
    for (i = 0; i < thearray.length; i++) {
        if (thearray[i] == tab_list) {
            document.getElementById(tab_list).style.display = "block";
        } else {
            document.getElementById(thearray[i]).style.display = "none";
        }
    }
}

jQuery(function() {

    jQuery("#back-top").hide();
    jQuery(window).scroll(function() {
        if (jQuery(this).scrollTop() > 600) {
            jQuery('#back-top').fadeIn();
        } else {
            jQuery('#back-top').fadeOut();
        }
    });
    jQuery('#back-top a').click(function() {
        jQuery('body,html').animate({
            scrollTop: 0
        }, 400);
        return false;
    });


    jQuery('#back-top a').hover(function() {
        jQuery(this).stop().animate({
            opacity: 1.0
        }, 500);
    },
    function() {
        jQuery(this).stop().animate({
            opacity: 0.9
        }, 500);
    });
});





function topNavToSelect() {
    // building select menu
    $('<select class="upper-nav" />').appendTo('.upperHeader .container');

    // building an option for select menu
    $('<option />', {
        'selected': 'selected',
        'value': '',
        'text': 'Choose Page...'
    }).appendTo('.upperHeader .container select');

    $('.upperHeader ul.inline li a').each(function() {
        var target = $(this);

        $('<option />', {
            'value': target.attr('href'),
            'text': target.text()
        }).appendTo('.upperHeader .container select');
    });
    // on clicking on link
    $('.upperHeader .container select').on('change', function() {
        window.location = $(this).find('option:selected').val();
    });
}

// building select .navbar for mobile width only
function NavToSelect() {

    // building select menu
    $('<select />').appendTo('.navbar');

    // building an option for select menu
    $('<option />', {
        'selected': 'selected',
        'value': '',
        'text': 'Choose Page...'
    }).appendTo('.navbar select');

    $('.navbar ul li a').each(function() {
        var target = $(this);

        $('<option />', {
            'value': target.attr('href'),
            'text': target.text()
        }).appendTo('.navbar select');
    });
    // on clicking on link
    $('.navbar select').on('change', function() {
        window.location = $(this).find('option:selected').val();
    });

}


// bootstrap tooltip invocking
function showtooltip() {
    $('a[data-toggle=tooltip], button[data-toggle=tooltip], input[data-toggle=tooltip]')
    .tooltip({
        animation: false
    });
}

function cartContent() {
    var $cartContent = $('.cart-content');


    $cartContent.find('table').click(function() {

        e.stopPropagation();
    });

}



// flexslider on home page
function flexSlideShow() {
    $('.flexslider').flexslider({
        animation: "slide",
        slideshowSpeed: 4000,
        directionNav: false,
        pauseOnHover: true,
        directionNav: false
    });
}

// bootstrap carousel in caregories grid and list
function productSlider() {
    $('.carousel').carousel();
}


// link fancybox plugin on product detail
function productFancyBox() {
    $(".fancybox").fancybox({
        openEffect: 'none',
        closeEffect: 'none'
    });
}

// dropdown mainnav
function dropdownMainNav() {
    var navMenu = $('div#menu');
    
    var navLis = $('div.navbar > ul.nav > li');
    var ParentCatStr = new Array();
    var ParentCat = '';
    var CurrentChild = '';
    if ($('div.navbar > ul.nav > li.active').length) {
        var ParentCatStrActive = $('div.navbar > ul.nav > li.active').attr("id").split('_');
        var ParentCatActive = ParentCatStrActive[1];
    }
    $('.nav-children #mainNavChild_' + ParentCatActive).slideDown(0);
    navLis.hover(function() {
        ParentCatStr = $(this).attr("id").split('_');
        ParentCat = ParentCatStr[1];
        if (!isNaN(ParentCat)) {
            CurrentChild = $(".nav-children #mainNavChild_" + ParentCat);
            if(CurrentChild.length) {
                
                CurrentChild.parent().children('div').not(".nav-children #mainNavChild_" + ParentCat).slideUp(0);CurrentChild.slideDown(0);
            }else {
                $(".nav-children").children('div').slideUp(50);
            }
        }
    },
    function() {
            
        });
    
    navMenu.hover(function(){
        
        },
        function() {
            
            $(".nav-children").children('div').not('#mainNavChild_' + ParentCatActive).slideUp(0);$('.nav-children #mainNavChild_' + ParentCatActive).slideDown(0);
        });
}

//$("#menu").mouseleave(function() {
//    ParentCatStrActive = $('div.navbar > ul.nav > li.active').attr("id").split('_');
//    ParentCatActive = ParentCatStrActive[1];
//    $(".nav-children").children('div').not('#mainNavChild_' + ParentCatActive).slideUp(150);
//    $('.nav-children #mainNavChild_' + ParentCatActive).slideDown(150);
//});

function showlist() {

    var navLis = $('div.nav-children .mainNavChild  > ul > li.parent');
    navLis.hover(
        function() {
            // hide the css default behavir
            $(this).children('div').css('display', 'none');
            //show its submenu
            $(this).children('div').slideDown(150);
        },
        function() {
            //hide its submenu
            $(this).children('div').slideUp(50);
        }
        );
}

// open and hide the side panel
function openSidePanel() {
    var widgetToggleLink = $('a.Widget-toggle-link'),
    $switcher = $(".switcher");

    widgetToggleLink.on('click', function(e) {
        e.preventDefault();
        var left = $switcher.css('left');
        if (left <= '-170px') {
            $switcher.animate({
                left: 0
            }, 200, function() {
                $(this).find(widgetToggleLink).text('-');
            });
        } else {
            $switcher.animate({
                left: '-170px'
            }, 200, function() {
                $(this).find(widgetToggleLink).text('+');
            });
        }
    });
}


// change background pattern
function changeBackgroundPattern() {
    /* cookie vars */
    var cookie_name1 = "site_pattern";
    var cookie_options1 = {
        path: '/',
        expires: 30
    };
    var get_cookie1 = $.cookie('site_pattern');
    if (get_cookie1 == null) {
        get_cookie1 = 'retina_wood'
    }
    // backgrounds
    $('head').append('<link rel="stylesheet" id="active-bg" href="catalog/view/theme/shopfine/css/backgrounds/flowers.css">');
    //      '+get_cookie1+'
    $(".switcher > .switcher-content > .pattern-switch").find('a').bind('click', function(e) {
        $('#active-bg').remove();
        e.preventDefault();
        var bgName = $(this).text();
        $.cookie(cookie_name1, bgName, cookie_options1);
        $('head').append('<link rel="stylesheet" id="active-bg" href="catalog/view/theme/shopfine/css/backgrounds/flowers.css">');
    //        '+bgName+'
    });
}


// change layoutStyle
function changeLayoutStyle() {
    /* cookie vars */
    var cookie_name2 = "site_layout";
    var cookie_options2 = {
        path: '/',
        expires: 30
    };
    var get_cookie2 = $.cookie('site_layout');
    if (get_cookie2 == null) {
        get_cookie2 = 'Boxed'
    }
    //layout
    $('head')
    .append('<link rel="stylesheet" id="active-bg" href="catalog/view/theme/shopfine/css/layout/' + get_cookie2 + '.css">');
    $(".switcher > .switcher-content > .layout-switch").find('a').bind('click', function(e) {
        $('#active-layout').remove();
        e.preventDefault();
        var layoutName = $(this).text();
        $.cookie(cookie_name2, layoutName, cookie_options2);
        $('head')
        .append('<link rel="stylesheet" id="active-layout" href="catalog/view/theme/shopfine/css/layout/' + layoutName + '.css">');

    });
}


// change site color
function changeColorStyle() {
    /* cookie vars */
    var cookie_name3 = "site_color";
    var cookie_options3 = {
        path: '/',
        expires: 30
    };
    var get_cookie3 = $.cookie('site_color');
    if (get_cookie3 == null) {
        get_cookie3 = 'green'
    }
    get_cookie3 = 'green';
    //layout
    $('head').append('<link rel="stylesheet" id="active-bg" href="catalog/view/theme/shopfine/css/color/' + get_cookie3 + '.css">');
    $(".switcher > .switcher-content > .color-switch").find('a').bind('click', function(e) {
        $('#active-color').remove();
        e.preventDefault();
        var colorName = 'green';//$(this).text();
        $.cookie(cookie_name3, colorName, cookie_options3);
        $('head').append('<link rel="stylesheet" id="active-color" href="catalog/view/theme/shopfine/css/color/' + colorName + '.css">');

    });
}


// range price product
function rangePriceSlider() {
    
    var $slideRange = $("#slider-range"),
    amount = $("#min_price");
    $slideRange.slider({
        range: true,
        min: 0,
        max: 500,
        values: [75, 300],
        slide: function(event, ui) {
            console.log(ui);
            amount.val("$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ]);
        }
    });
    amount.val("$" + $slideRange.slider("values", 0) +
        " - $" + $slideRange.slider("values", 1));
}






$(document).ready(function() {
    topNavToSelect();
    NavToSelect();
    showtooltip();

    flexSlideShow();
    productSlider();
    productFancyBox();
    dropdownMainNav();
    latestTweets();
    openSidePanel();
    changeBackgroundPattern();
    changeLayoutStyle();
    changeColorStyle();
    //rangePriceSlider();
    showlist();
});