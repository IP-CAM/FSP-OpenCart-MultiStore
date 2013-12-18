$(document).ready(function() {
    /* Ajax Cart */
    $('#cart > .heading a').live('click', function() {
        if (!$('#cart > .heading').hasClass('open')) {
            $('#cart > .heading').removeClass('open');
        } else {
            $('#cart').load('index.php?route=module/cart&show=true #cart > *');
            //$('#cart > .heading').addClass('open');
            //            $('#cart > .heading').live('mouseleave', function() {
            //                $(this).removeClass('open');
            //            });
        }
    });



    /* Search */
    $('.btn-warning').bind('click', function() {
        url = $('base').attr('href') + 'index.php?route=product/search';

        var search = $('input[name=\'search\']').attr('value');

        if (search) {
            url += '&search=' + encodeURIComponent(search);
        }

        location = url;
    });

    $('#header input[name=\'search\']').bind('keydown', function(e) {
        if (e.keyCode == 13) {
            url = $('base').attr('href') + 'index.php?route=product/search';

            var search = $('input[name=\'search\']').attr('value');

            if (search) {
                url += '&search=' + encodeURIComponent(search);
            }

            location = url;
        }
    });

});

function getURLVar(key) {
    var value = [];

    var query = String(document.location).split('?');

    if (query[1]) {
        var part = query[1].split('&');

        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');

            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }

        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

function addToCart(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {

                $('#notification').html('<div class="warning alert-success"><button type="button" class="close" data-dismiss="alert">×</button>' + json['success'] + '</div>');

                $('.success').fadeIn('slow');

                $('#cart-total').html(json['total']);

                $('#cart').load('index.php?route=module/cart&show=true #cart > *');

                $('html, body').animate({
                    scrollTop: 0
                }, 'slow');

                setTimeout(function() {
                     $('#cart > .heading').removeClass('open');
                }, 2000);
            }
        }
    });
}
function addToWishList(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#notification').html('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>' + json['success'] + '</div>');

                $('.success').fadeIn('slow');

                $('#wishlist-total').html(json['total']);

                $('html, body').animate({
                    scrollTop: 0
                }, 'slow');
            }
        }
    });
}

function addToCompare(product_id) {
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();

            if (json['success']) {
                $('#notification').html('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button>' + json['success'] + '</div>');

                $('.success').fadeIn('slow');

                $('#compare-total').html(json['total']);

                $('html, body').animate({
                    scrollTop: 0
                }, 'slow');
            }
        }
    });
}