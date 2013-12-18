<?php if ($reviews) { ?>

<?php foreach ($reviews as $review) { ?>
<div class="single-review clearfix">
									<div class="review-header">
										  <ul class="rating">
										<li>  <img src="catalog/view/theme/shopfine/image/stars-<?php echo $review['rating'] . '.png'; ?>" alt="<?php echo $review['reviews']; ?>" />
										</li> 	
										  </ul>
										<h4><?php echo $review['author']; ?></h4>
										<small><?php echo $review['date_added']; ?></small>
									</div><!--end review-header-->

									<div class="review-body">
										<p>
										<?php echo $review['text']; ?>
										</p>
									</div><!--end review-body-->
								</div><!--end single-review-->
								
<?php } ?>

<div class="pagination pagination-right"><?php echo $pagination; ?></div>


<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>
