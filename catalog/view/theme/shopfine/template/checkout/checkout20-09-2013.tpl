<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <div class="row">
        <?php echo $content_top; ?>
        <?php echo $column_left; ?>
        <div class="span12">
            <?php if(isset($this->request->get['paymentResult'])){ ?>
            <div class="warning"><?php echo $this->request->get['paymentResult']; ?></div>
            <?php } ?>
            <div id="checkout" class="checkout-outer">
                <div class="checkout-header">					
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_option; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                    <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
            <?php if (!$logged) { ?>
            <div id="payment-address" class="checkout-outer">
                <div class="checkout-header">					
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_account; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                    <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
	 <?php } else { ?>				
            <div id="payment-address" class="checkout-outer">
                <div class="checkout-header">					
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_payment_address; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                        <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
					
        <?php } ?>
        <?php if ($shipping_required) { ?>
            <div id="shipping-address" class="checkout-outer">
                <div class="checkout-header">						
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_shipping_address; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                        <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
            <div id="shipping-method" class="checkout-outer" style="display:none;">
                <div class="checkout-header">							
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_shipping_method; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                    <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
        <?php } ?>
            <div id="payment-method" class="checkout-outer" style="display:none;">
                <div class="checkout-header">
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_payment_method; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                        <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
					
            <div id="confirm" class="checkout-outer">
                <div class="checkout-header">					
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_confirm; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                        <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
                                        
            <div id="do_payment" class="checkout-outer">
                <div class="checkout-header">					
                    <h4><i class="icon-caret-right"></i> <?php echo $text_checkout_do_payment; ?></h4>
                </div><!--end checkout-header-->
                <div class="checkout-content">
                    <!-- content here-->
                </div><!--end checkout-content-->
            </div><!--end checkout-outer-->
        </div><!--end span12-->
        <?php echo $column_right; ?> <?php echo $content_bottom; ?>
    </div><!--end row-->
</div>
<script type="text/javascript"><!--
$('#checkout .checkout-content input[name=\'account\']').live('change', function() {
	if ($(this).attr('value') == 'register') {
		$('#payment-address .checkout-header span').html('<?php echo $text_checkout_account; ?>');
	} else {
		$('#payment-address .checkout-header span').html('<?php echo $text_checkout_payment_address; ?>');
	}
});

$('.checkout-header a').live('click', function() {
	$('.checkout-content').slideUp('slow');
	
	$(this).parent().parent().find('.checkout-content').slideDown('slow');
});
<?php if (!$logged) { ?> 

$(document).ready(function() {
	$.ajax({
		url: 'index.php?route=checkout/login',
		dataType: 'html',
		success: function(html) {
			$('#checkout .checkout-content').html(html);
				
			$('#checkout .checkout-content').slideDown('slow');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});		

<?php } else { ?>
$(document).ready(function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_address',
		dataType: 'html',
		success: function(html) {
			$('#payment-address .checkout-content').html(html);
				
			$('#payment-address .checkout-content').slideDown('slow');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
<?php } ?>

// Checkout
$('#button-account').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').attr('value'),
		dataType: 'html',
		beforeSend: function() {
			$('#button-account').attr('disabled', true);
			$('#button-account').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},		
		complete: function() {
			$('#button-account').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(html) {
			$('.warning, .error').remove();
			
			$('#payment-address .checkout-content').html(html);
				
			$('#checkout .checkout-content').slideUp('slow');
				
			$('#payment-address .checkout-content').slideDown('slow');
				
			$('.checkout-header a').remove();
				
			$('#checkout .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Login
$('#button-login').live('click', function() {

    $.ajax({
		url: 'index.php?route=checkout/login/validate',
		type: 'post',
		data: $('#checkout .login :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-login').attr('disabled', true);
			$('#button-login').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-login').attr('disabled', false);
			$('.wait').remove();
		},				
		success: function(json) {
        
              
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				$('#checkout .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
				
				$('.warning').fadeIn('slow');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
           
           
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Register
$('#button-register').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/register/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-register').attr('disabled', true);
			$('#button-register').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-register').attr('disabled', false); 
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
						
			if (json['redirect']) {
				location = json['redirect'];				
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}
				
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').after('<br/><span class="text-error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').after('<br/><span class="text-error">' + json['error']['lastname'] + '</span>');
				}	
				
				if (json['error']['email']) {
					$('#payment-address input[name=\'email\']').after('<br/><span class="text-error">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').after('<br/><span class="text-error">' + json['error']['telephone'] + '</span>');
				}	
					
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').after('<br/><span class="text-error">' + json['error']['company_id'] + '</span>');
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').after('<br/><span class="text-error">' + json['error']['tax_id'] + '</span>');
				}	
																		
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').after('<br/><span class="text-error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').after('<br/><span class="text-error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').after('<br/><span class="text-error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').after('<br/><span class="text-error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').after('<br/><span class="text-error">' + json['error']['zone'] + '</span>');
				}
				
				if (json['error']['password']) {
					$('#payment-address input[name=\'password\']').after('<br/><span class="text-error">' + json['error']['password'] + '</span>');
				}	
				
				if (json['error']['confirm']) {
					$('#payment-address input[name=\'confirm\']').after('<br/><span class="text-error">' + json['error']['confirm'] + '</span>');
				}																																	
			} else {
				<?php if ($shipping_required) { ?>				
				var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
				
				if (shipping_address) {
					$.ajax({
						url: 'index.php?route=checkout/shipping_method',
						dataType: 'html',
						success: function(html) {
							$('#shipping-method .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							
							$('#shipping-method .checkout-content').slideDown('slow');
							
							$('#checkout .checkout-header a').remove();
							$('#payment-address .checkout-header a').remove();
							$('#shipping-address .checkout-header a').remove();
							$('#shipping-method .checkout-header a').remove();
							$('#payment-method .checkout-header a').remove();											
							
							$('#shipping-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');									
							$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	

							$.ajax({
								url: 'index.php?route=checkout/shipping_address',
								dataType: 'html',
								success: function(html) {
									$('#shipping-address .checkout-content').html(html);
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});	
				} else {
					$.ajax({
						url: 'index.php?route=checkout/shipping_address',
						dataType: 'html',
						success: function(html) {
							$('#shipping-address .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							
							$('#shipping-address .checkout-content').slideDown('slow');
							
							$('#checkout .checkout-header a').remove();
							$('#payment-address .checkout-header a').remove();
							$('#shipping-address .checkout-header a').remove();
							$('#shipping-method .checkout-header a').remove();
							$('#payment-method .checkout-header a').remove();							

							$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});			
				}
				<?php } else { ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#payment-address .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');
						
						$('#checkout .checkout-header a').remove();
						$('#payment-address .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();								
						
						$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
				<?php } ?>

				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
							
						$('#payment-address .checkout-header span').html('<?php echo $text_checkout_payment_address; ?>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Payment Address	
$('#button-payment-address').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_address/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-address').attr('disabled', true);
			$('#button-payment-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-payment-address').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').after('<span class="text-error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').after('<span class="text-error">' + json['error']['lastname'] + '</span>');
				}	
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').after('<span class="text-error">' + json['error']['telephone'] + '</span>');
				}		
				
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').after('<span class="text-error">' + json['error']['company_id'] + '</span>');
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').after('<span class="text-error">' + json['error']['tax_id'] + '</span>');
				}	
														
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').after('<span class="text-error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').after('<span class="text-error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').after('<span class="text-error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').after('<span class="text-error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').after('<span class="text-error">' + json['error']['zone'] + '</span>');
				}
			} else {
				<?php if ($shipping_required) { ?>
				$.ajax({
					url: 'index.php?route=checkout/shipping_address',
					dataType: 'html',
					success: function(html) {
						$('#shipping-address .checkout-content').html(html);
					
						$('#payment-address .checkout-content').slideUp('slow');
						
						$('#shipping-address .checkout-content').slideDown('slow');
						
						$('#payment-address .checkout-header a').remove();
						$('#shipping-address .checkout-header a').remove();
						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
						
						$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				<?php } else { ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
					
						$('#payment-address .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');
						
						$('#payment-address .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
													
						$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				<?php } ?>
				
				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}	  
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Shipping Address			
$('#button-shipping-address').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping_address/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-address').attr('disabled', true);
			$('#button-shipping-address').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-shipping-address').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-address .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').after('<span class="text-error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').after('<span class="text-error">' + json['error']['lastname'] + '</span>');
				}	
				
				if (json['error']['email']) {
					$('#shipping-address input[name=\'email\']').after('<span class="text-error">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['telephone']) {
					$('#shipping-address input[name=\'telephone\']').after('<span class="text-error">' + json['error']['telephone'] + '</span>');
				}		
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').after('<span class="text-error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').after('<span class="text-error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').after('<span class="text-error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').after('<span class="text-error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').after('<span class="text-error">' + json['error']['zone'] + '</span>');
				}
			} else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						
						$('#shipping-address .checkout-content').slideUp('slow');
						
						$('#shipping-method .checkout-content').slideDown('slow');
						
						$('#shipping-address .checkout-header a').remove();
						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
						
						$('#shipping-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');							
						
						$.ajax({
							url: 'index.php?route=checkout/shipping_address',
							dataType: 'html',
							success: function(html) {
								$('#shipping-address .checkout-content').html(html);
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
                                                
                                                
                                                                        $.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
			$('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-shipping-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#shipping-method .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');

						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
						
						$('#shipping-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
                                                
                                                
                                                
                                                $.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method').attr('disabled', true);
			$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-payment-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {
						$('#confirm .checkout-content').html(html);
						
						$('#payment-method .checkout-content').slideUp('slow');
						
						$('#confirm .checkout-content').slideDown('slow');
						
						$('#payment-method .checkout-header a').remove();
						
						$('#payment-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
                                                
                                                
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});             
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
                                                
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				
                            $.ajax({
                                    url: 'index.php?route=checkout/payment_address',
                                    dataType: 'html',
                                    success: function(html) {
                                            $('#payment-address .checkout-content').html(html);
                                    },
                                    error: function(xhr, ajaxOptions, thrownError) {
                                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                            });					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest
$('#button-guest').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest').attr('disabled', true);
			$('#button-guest').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-guest').attr('disabled', false); 
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').after('<br/><span class="text-error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').after('<br/><span class="text-error">' + json['error']['lastname'] + '</span>');
				}	
				
				if (json['error']['email']) {
					$('#payment-address input[name=\'email\']').after('<br/><span class="text-error">' + json['error']['email'] + '</span>');
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').after('<br/><span class="text-error">' + json['error']['telephone'] + '</span>');
				}	
					
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').after('<br/><span class="text-error">' + json['error']['company_id'] + '</span>');
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').after('<br/><span class="text-error">' + json['error']['tax_id'] + '</span>');
				}	
																		
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').after('<br/><span class="text-error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').after('<br/><span class="text-error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').after('<br/><span class="text-error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').after('<br/><span class="text-error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').after('<br/><span class="text-error">' + json['error']['zone'] + '</span>');
				}
			} else {
				<?php if ($shipping_required) { ?>	
				var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
                     
				
				if (shipping_address) {
					$.ajax({
						url: 'index.php?route=checkout/shipping_method',
						dataType: 'html',
						success: function(html) {
                                        
                                                      //$('#shipping-method .checkout-content').hide();
							
    
                                                       $('#shipping-method .checkout-content').html(html);
                                                       
								
							$('#payment-address .checkout-header a').remove();
							$('#shipping-address .checkout-header a').remove();
							$('#shipping-method .checkout-header a').remove();
							$('#payment-method .checkout-header a').remove();		
															
							$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
							$('#shipping-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');									
							
							$.ajax({
								url: 'index.php?route=checkout/guest_shipping',
								dataType: 'html',
								success: function(html) {
                                                        
                                                               
									$('#shipping-address .checkout-content').html(html);
                                                                        $('#shipping-address .checkout-content').hide();
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});
                                                        
                                                        $.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
			$('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-shipping-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#shipping-method .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');

						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
						
						$('#shipping-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
                                                
                                                
                                                
                                                $.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method').attr('disabled', true);
			$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-payment-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {
                               
                                        
						$('#confirm .checkout-content').html(html);
                                                 $('#payment-address .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideUp('slow');
						
						$('#confirm .checkout-content').slideDown('slow');
						
						$('#payment-method .checkout-header a').remove();
						
						$('#payment-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
                                                
                                                
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
                                                        
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});					
				} else {
					$.ajax({
						url: 'index.php?route=checkout/guest_shipping',
						dataType: 'html',
						success: function(html) {
							$('#shipping-address .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							
							$('#shipping-address .checkout-content').slideDown('slow');
							
							$('#payment-address .checkout-header a').remove();
							$('#shipping-address .checkout-header a').remove();
							$('#shipping-method .checkout-header a').remove();
							$('#payment-method .checkout-header a').remove();
							
							$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
				<?php } else { ?>				
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#payment-address .checkout-content').slideUp('slow');
							
						$('#payment-method .checkout-content').slideDown('slow');
							
						$('#payment-address .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
														
						$('#payment-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
				<?php } ?>
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest Shipping
$('#button-guest-shipping').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest_shipping/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest-shipping').attr('disabled', true);
			$('#button-guest-shipping').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-guest-shipping').attr('disabled', false); 
			$('.wait').remove();
		},			
		success: function(json) {

                
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-address .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').after('<span class="text-error">' + json['error']['firstname'] + '</span>');
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').after('<span class="text-error">' + json['error']['lastname'] + '</span>');
				}	
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').after('<span class="text-error">' + json['error']['address_1'] + '</span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').after('<span class="text-error">' + json['error']['city'] + '</span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').after('<span class="text-error">' + json['error']['postcode'] + '</span>');
				}	
				
				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').after('<span class="text-error">' + json['error']['country'] + '</span>');
				}	
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').after('<span class="text-error">' + json['error']['zone'] + '</span>');
				}
			} else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						
						//$('#shipping-address .checkout-content').slideUp('slow');
						
						$('#shipping-method .checkout-content').slideDown('slow');
						
						$('#shipping-address .checkout-header a').remove();
						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
							
						$('#shipping-address .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');
					
                                      $.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
			$('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#shipping-method .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');

						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
						
						$('#shipping-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
                                                
                                                
                                                
                                                $.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method').attr('disabled', true);
			$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-payment-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
                                        complete: function() {
                                    $('#button-shipping-method').attr('disabled', false);
                                    $('.wait').remove();
		                          },
					success: function(html) {
						$('#confirm .checkout-content').html(html);
                                                  
						
						$('#payment-method .checkout-content').slideUp('slow');
                                                $('#shipping-address .checkout-content').slideUp('slow');
						
						$('#confirm .checkout-content').slideDown('slow');
						
						$('#payment-method .checkout-header a').remove();
						
						$('#payment-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
                                                
                                                
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});

},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$('#button-shipping-method').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
			$('#button-shipping-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-shipping-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#shipping-method .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');

						$('#shipping-method .checkout-header a').remove();
						$('#payment-method .checkout-header a').remove();
						
						$('#shipping-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$('#button-payment-method').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method').attr('disabled', true);
			$('#button-payment-method').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#button-payment-method').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
			$('.warning, .error').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {
						$('#confirm .checkout-content').html(html);
						
						$('#payment-method .checkout-content').slideUp('slow');
						
						$('#confirm .checkout-content').slideDown('slow');
						
						$('#payment-method .checkout-header a').remove();
						
						$('#payment-method .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$('#confirm_checkout').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_method/checkTerms', 
		type: 'post',
		data: $('#confirm input[type=\'checkbox\']:checked, #confirm textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#confirm_checkout').attr('disabled', true);
			$('#confirm_checkout').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},	
		complete: function() {
			$('#confirm_checkout').attr('disabled', false);
			$('.wait').remove();
		},			
		success: function(json) {
        		$('.warning, .error, .alert').remove();
			
			if (json['redirect']) {
                            location = json['redirect'];
			} else if (json['error']) {
                            if (json['error']['warning']) {
                                $('#confirm .checkout-content').prepend('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button>' + json['error']['warning'] + '</div>');
                                $('.warning').fadeIn('slow');
                            }			
			} else{
                            $.ajax({
                                    url: 'index.php?route=payment/adyen/getform',
                                    dataType: 'html',
                                    success: function(html) {
                                        $('#do_payment .checkout-content').html(html);
                                        $('#confirm .checkout-content').slideUp('slow');
                                        $('#do_payment .checkout-content').slideDown('slow');
                                        $('#confirm .checkout-header').append('<a  class="invarseColor pull-right" data-toggle="tooltip" data-placment="top" data-title="<?php echo $text_modify; ?>" style="margin-right:12px; margin-top:-20px; color:#333; font-size:13px;"><i class="icon-pencil"></i></a>');
                                    
                                          $.ajax({
                                    url: 'index.php?route=payment/pp_standard',
                                    dataType: 'html',
                                    success: function(html) {
                            
                                    
                                 $('#paypal_pro').html(html);
                                    
                                      
                                       
                                    },
                                    error: function(xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                            });
},
                                    error: function(xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                            });
                            
                            
                            
                        }
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});


//--></script>
<?php echo $footer; ?>