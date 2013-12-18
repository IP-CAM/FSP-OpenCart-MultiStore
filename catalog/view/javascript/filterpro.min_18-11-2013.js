var fIID = 0;
var interval = 1;
var ajexProcess = false;

$(".price_limit").live("change", (function () {
    var b = parseInt($("#min_price").val());
    var a = parseInt($("#max_price").val());
    $("#slider-range").slider("values", [b, a]);
    iF()
}));

$("#filterpro .filtered").live("change", (function () {
    $(".product-details").parent().attr("id","tab_grid");
    $(".product-details").parent().empty();
    
    iF();
}));

$("#filterpro input.cluster").live("change", (function () {
    var check = $(this).is(':checked');
    var ids = $(this).val();
    var idsArr = ids.split(',');
    idsArr.forEach( function(elem, index, array){
        if(check){
            $('#'+elem).attr('checked','true');
        }
        else{
            $('#'+elem).attr('checked',false);
        }
    });
    iF();
    if(check){
        $(this).closest(".option_box").find(".clear_filter").parent().css("visibility","visible");
    }else{
        var hide = true;
        $(this).closest(".option_box").find("input").each( function(){
            if($(this).attr('checked')){
                hide = false;
            }
        });        
        if(hide){
            $(this).closest(".option_box").find(".clear_filter").parent().css("visibility","hidden");
        }
    }
}));

function getHTTPvals(key, default_) {
    if (default_ == null) default_ = "";
    var keyInLower = key.toLowerCase();
    var url = window.location.href;
    var urlInLower = url.toLowerCase();
    key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + keyInLower + "=([^&#]*)");
    var qs = regex.exec(urlInLower);
    if (qs == null)
        return default_;
    else
        return qs[1];
}

$("#catSel").live("change", (function () {
    if(this.value.length){
        $( "#category_id" ).val(this.value);
        $( "#category_path" ).val(getHTTPvals('path')+'_'+this.value);
        iF();
    }
}));
$("#filterpro .filtered").live("click", (function () {
    $(".product-details").parent().attr("id","tab_grid");
    $(".product-details").parent().empty();
    
    // Remove active class
    $(this).parent().children().removeClass("active-option");
    $(this).parent().parent().children("div#clear_filter").css("visibility","visible");
    $(this).parent(".collapsible").addClass("active");
    
    //set all inputs disable
    $(this).parent().children("span").children("input").attr("disabled","true");
    
    //set current input enable
    $(this).children().removeAttr("disabled");
    
    //add active to current
    $(this).addClass("active-option");
    iF()
}));

$(function () {
    
    var curreny_price = 1 ; //$.cookie("curreny_price");
    
    $("#slider-range").slider({
        range:true, 
        step:0.02,
        min:0, 
        max:0, 
        values:[0, 0], 
        stop:function (a, b) {
            $("#min_price").val(b.values[0]);
            $("#min_price_label").html((b.values[0]*curreny_price).toFixed(2));
            $("#max_price").val(b.values[1]);
            $("#max_price_label").html((b.values[1]*curreny_price).toFixed(2));
            $("#clear_filter_price").css("visibility","visible");
          
            iF();
        }, 
        slide:function (a,b) {
            $("#min_price").val(b.values[0]);
            $("#min_price_label").html((b.values[0]*curreny_price).toFixed(2));
            $("#max_price").val(b.values[1]);
            $("#max_price_label").html((b.values[1]*curreny_price).toFixed(2));
        }
    });
    $("#min_price").val($("#slider-range").slider("values", 0));
    $("#min_price_label").html(($("#slider-range").slider("values", 0)*curreny_price).toFixed(2));
    $("#max_price").val($("#slider-range").slider("values", 1));
    $("#max_price_label").html(($("#slider-range").slider("values", 1)*curreny_price).toFixed(2));
});

///// quantity slider
$(function () {
    $("#quantity-range").slider({
        range:true, 
        min:0, 
        max:0, 
        values:[0, 0], 
        stop:function (a, b) {
            iF();
        }, 
        slide:function (a, b) {
            $("#min_quantity").val(b.values[0]);
            $("#max_quantity").val(b.values[1]);
            
        }
    });
    $("#min_quantity").val($("#quantity-range").slider("values", 0));
    $("#max_quantity").val($("#quantity-range").slider("values", 1));
    
});


function iF() {
    clearTimeout(fIID);
    $("#filterpro_page").val(0);
    fIID = setTimeout("doFilter(false)", interval)
}
function doFilter(b) {
   
    
    var a = $("#filterpro").serialize().replace(/[^&]+=\.?(?:&|$)/g, "").replace(/&+$/, "");
   
    if (!b) {
       
        window.location.hash = a
    }
    if(!ajexProcess){
        $.ajax({
            url:"index.php?route=module/filterpro/getproducts", 
            type:"POST", 
            data:a + (b ? "&getPriceLimits=true&getQuantityLimits=true" : ""), 
            dataType:"json",
            beforeSend: function(){
                if(location.hash){
                    $('#overlay').show();                
                }
                ajexProcess = true;
            },
            complete:function(){
                $('#overlay').hide();
                ajexProcess = false;
            },
            success:function (g) {
                var view = "grid"; //$.cookie("display");
                if (!view) {
                    view = "grid"
                }
                var filteredhtml= '';
                if (g.result) {
                    filteredhtml += '<ul id="filteredProds" class="hProductItems clearfix">';
                    filteredhtml += '</ul>';
                    $("#tab_" + view).html(filteredhtml);
                    $("#productTemplate").tmpl(g.result).appendTo("#filteredProds");
                }
            
                if(g.empty_products){
                    $("#tab_" + view).html(g.empty_products);
                    $(".pagination").empty();
                }else{
                    $(".totalProducts").html(g.totaProducts);
                    $(".pagination").html(g.pagination);    
                }
            
                $(".currency-symbol").html(g.currencySymbol);
            
                $.cookie("curreny_price", null);
                $.cookie("curreny_price", g.currencyValue);            
            
                var d = Math.floor(parseFloat(g.min_price));
                var c = Math.ceil(parseFloat(g.max_price));

                if (typeof(display) != "undefined") {
                    view ? display(view) : display("list");
                }
            
                if (b) {
                    $("#slider-range").slider("option", {
                        min:d, 
                        max:c
                    });
                    if ($("#max_price").val() >= 1) {
                        d = parseInt($("#min_price").val());
                        c = parseInt($("#max_price").val());
                    }
                    $("#slider-range").slider("option", {
                        values:[d, c]
                    });
                    $("#min_price").val(d);
                    $("#min_price_label").html(d);
                    //$("#min_price_label").html((d*g.currencyValue).toFixed(2));
                    $("#max_price").val(c);
                    $("#max_price_label").html(c);
                //$("#max_price_label").html((c*g.currencyValue).toFixed(2));
                }
        
                //// for quantity filter
        
                var e = parseInt(g.min_quantity);
                var f = Math.ceil(parseFloat(g.max_quantity));

                if (typeof(display) != "undefined") {
                    view ? display(view) : display("list");
                }
                if (b) {
                    $("#quantity-range").slider("option", {
                        min:e, 
                        max:f
                    });
                    if ($("#max_quantity").val() >= 1) {
                        e = parseInt($("#min_quantity").val());
                        f = parseInt($("#max_quantity").val())
                    }
                    $("#quantity-range").slider("option", {
                        values:[e, f]
                    });
                    $("#min_quantity").val(e);
                    $("#max_quantity").val(f)
                }
        
        
                if (g.totals_data) {
			
                    var atts = {};
                    $.each(g.totals_data.attributes, function(k, v) {
                        atts[v.id + "_" + v.text] = v.t;
                    });
            
                    $('.a_name').each(function (k, v) {
										
                        var at_v_i = $(v).attr('at_v_i');
			
                        if (atts[at_v_i]) {
                            $('[at_v_t="'+at_v_i+'"]').text($('[at_v_t="'+at_v_i+'"]').attr('data-value')+"("+atts[at_v_i]+")");
                            $(v).removeAttr("disabled");
                        } else {
                            $('[at_v_t="' + at_v_i + '"]').text($('[at_v_t="' + at_v_i + '"]').attr('data-value'));
                        //$(v).attr("disabled", "disabled");
                        // $(v).removeAttr('checked');
                        // $(v).removeAttr(':selected');
                        }
                    });

                    var h = [];
                    $.each(g.totals_data.manufacturers, function (f, k) {
                        if (k.id) {
                            h[h.length] = k.id;
                            var j = $("#manufacturer_" + k.id);
                            if(j.length){
                                j.removeAttr("disabled");
                                if (j.get(0).tagName == "OPTION") {
                                    j.text($("#m_" + k.id).val() + " (" + k.t + ")")
                                } else {
                                    $('label[for="manufacturer_' + k.id + '"]').text($("#m_" + k.id).val() + " (" + k.t + ")")
                                }
                            }
                        }
                    });
                    $(".manufacturer_value").each(function (f, k) {
                        var j = $(this);
                        var l = j.attr("id").match(/manufacturer_(\d+)/);
                        if ($.inArray(l[1], h) < 0) {
                            j.attr("disabled", "disabled");
                            if (this.tagName == "OPTION") {
                                j.text($("#m_" + l[1]).val());
                                j.attr("selected", false)
                            } else {
                                $('label[for="manufacturer_' + l[1] + '"]').text($("#m_" + l[1]).val());
                                j.attr("checked", false)
                            }
                        }
                    });
                    var e = [];
                //                $.each(g.totals_data.options, function (j, k) {
                //                    if (k.id) {
                //                        e[e.length] = k.id;
                //                        var f = $("#option_value_" + k.id);
                //                        if (f.length) {
                //                            f.removeAttr("disabled");
                //                            if (f.get(0).tagName == "OPTION") {
                //                                f.text($("#o_" + k.id).val() + " (" + k.t + ")")
                //                            } else {
                //                            //$('label[for="option_value_' + k.id + '"]').text($("#o_" + k.id).val() + " (" + k.t + ")")
                //                            }
                //                        }
                //                    }
                //                });
                //                $(".option_value").each(function (j, k) {
                //                    var f = $(this);
                //                    var l = f.attr("id").match(/option_value_(\d+)/);
                //                    if ($.inArray(l[1], e) < 0) {
                //                        f.attr("disabled", "disabled");
                //                        if (this.tagName == "OPTION") {
                //                            f.text($("#o_" + l[1]).val());
                //                            f.attr("selected", false)
                //                        } else {
                //                            $('label[for="option_value_' + l[1] + '"]').text($("#o_" + l[1]).val());
                //                            f.attr("checked", false)
                //                        }
                //                    }
                //                });
                }
                if (!b) {
                 $("#tab_grid").css("display","block");
        $("#pagination").css("display","block");
        $("#sort").css("display","block");
        $("#cat_list").css("display","none");
                }
            }
        })
    }
}
$(document).ready(function () {
    //    $(".option_box .option_name").click(function () {
    //        $(this).siblings(".collapsible").toggle();
    //        $(this).toggleClass("hided")
    //    });
    //    $(".option_box .attribute_group_name").click(function () {
    //        $(this).siblings(".attribute_box").toggle();
    //        $(this).toggleClass("hided")
    //    });
    
    
    $(".clear_filter").click(function () {
        $(this).parent().parent().children("div.collapsible.active").removeClass("active");
        $(this).parent().parent().children("div.collapsible").children("span").children("input").attr("disabled","true");        
        $(".product-details").parent().attr("id","tab_grid");
        $(".product-details").parent().empty();
        $(this).parent().parent().children("div.collapsible").children("span").removeClass("active-option");
        $(this).parent().css("visibility","hidden");
        $("#filterpro select").val("");
        $("#filterpro :input").each(function () {
            if ($(this).is(":checked")) {
                $(this).attr("checked", false)
            }
        });
        var b = $("#slider-range").slider("option", "min");
        var a = $("#slider-range").slider("option", "max");
        $("#slider-range").slider("option", {
            values:[b, a]
        });
        $("#min_price").val(b);
        $("#min_price_label").html(b);
        $("#max_price").val(a);
        $("#max_price_label").html(a);
        $("div[id^=slider-range-]").each(function(index, element) {
            var id = this.id.replace(/[^\d]/g, '');

            var b = $(element).slider("option", "min");
            var a = $(element).slider("option", "max");
	    
            hs = $(element).slider();
            hs.slider("option", {
                values:[b, a]
            });
            hs.slider("option","slide").call(hs, null, {
                handle: $(".ui-slider-handle", hs), 
                values:[b, a]
            });

            $("#attribute_value_"+id+"_min").val('');
            $("#attribute_value_"+id+"_max").val('');

        });
        iF()
    });
    
    
    $(".pagination li a").live("click", (function () {
        var a = $(this).attr("href");
        var b = a.match(/page=(\d+)/);
        $("#filterpro_page").val(b[1]);
        doFilter(false);
        return false
    }));
    
   

    if($(".sort select").length){
        $(".sort select").get(0).onchange = null;
        $(".sort select").change(function () {
            console.log($(this).val());
            vars = $(this).val().split("&");
            $("#filterpro_sort").val(vars[0]);
            $("#filterpro_order").val(vars[1]);
            iF()
        });
    //        $(".sort select option").each(function () {
    //            var d = $(this).val();
    //            var a = gUV(d, "sort");
    //            if (a == "rating") {
    //                $(this).remove()
    //            } else {
    //                $(this).val(a + "&" + gUV(d, "order"))
    //            }
    //        });
    }






    if ($(".limit select").length) {
        $(".limit select").get(0).onchange = null;
        $(".limit select").change(function () {
       
            $("#filterpro_limit").val($(this).val());
            iF()
        });
        $(".limit select option").each(function () {
            $(this).val(gUV($(this).val(), "limit"))
        });
    }

    // deserialize
    $("#filterpro").deserialize(window.location.hash.substr(1));
    
    $("div[id^=slider-range-]").each(function(index, element) {
        var id = this.id.replace(/[^\d]/g, '');
        var arr = window['attr_arr_'+id];

        var b = parseInt($("#attribute_value_"+id+"_min").val());
        var a = parseInt($("#attribute_value_"+id+"_max").val());
        b = arr.indexOf(b);
        a = arr.indexOf(a);
        if (a >= 0 && b >= 0){
            hs = $(element).slider();
            hs.slider("option", {
                values:[b, a]
            });
            hs.slider("option","slide").call(hs, null, {
                handle: $(".ui-slider-handle", hs), 
                values:[b, a]
            });
        }
    });

    if ($(".sort select").length) {
        if ($("#filterpro_sort").val()) {
            $(".sort select").val($("#filterpro_sort").val() + "&" + $("#filterpro_order").val())
        } else {
            vars = $(".sort select").val().split("&");
            $("#filterpro_sort").val(vars[0]);
            $("#filterpro_order").val(vars[1])
        }
    }
    if ($("#filterpro_limit").length) {
        if ($("#filterpro_limit").val()) {
            $(".limit select").val($("#filterpro_limit").val())
        } else {
            $("#filterpro_limit").val($(".limit select").val())
        }
    }
    doFilter(true)
});
function gUV(e, f) {
    var c = String(e).split("?");
    var a = "";
    if (c[1]) {
        var b = c[1].split("&");
        for (var g = 0; g <= (b.length); g++) {
            if (b[g]) {
                var d = b[g].split("=");
                if (d[0] && d[0] == f) {
                    a = d[1]
                }
            }
        }
    }
    return a
}

function change_total(val){
    $("#filterpro_limit").val(val);
    iF();
    return false
}
function show_reset(option_id,att_id)
{
    
    var  cond = false; 
    
    $(att_id).parent().parent().parent().children().each( function(){
    
        if($(this).children().children('input').is(":checked"))
        {
            cond= true; 
        }
           
         
        if(cond){
            
            $('#clear_filter_'+option_id).css('visibility','visible');
        }else{
           
            $("#clear_filter_"+option_id).css("visibility","hidden");
        }
    });
        
        
        
  
}