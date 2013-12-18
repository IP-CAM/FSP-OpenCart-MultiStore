<style type="text/css">
    li,ul{
        list-style: none;
    }

    #filter-color{
        cursor: pointer;
        display: block;
        float: left;
        font: 0px/0 a;
        height: 22px;
        margin: 0 6px 6px 0;
        width: 22px;
    }
</style>
<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <ul class="box-filter">
            <?php foreach ($filter_groups as $filter_group) { ?>
            <li><span id="filter-group<?php echo $filter_group['filter_group_id']; ?>"><?php echo $filter_group['name']; ?></span>
                <ul>
                    <?php foreach ($filter_group['filter'] as $filter) { ?>
                    <?php $colorCode = substr($filter['name'], 0, strpos($filter['name'], '(')); ?>
                    <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                    <li>
                        <a id="filter-color" style="background-color: <?php echo strtolower($colorCode);  ?>;" class="button-filter color-switch-link" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>"  ><?php echo $filter['filter_id']; ?></a>
                        <!-- <label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label> -->
                    </li>
                    <?php } else { ?>
                    <li>
                        <a id="filter-color" style="background-color: <?php echo strtolower($colorCode);  ?>;" class="button-filter color-switch-link" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" /><?php echo $filter['filter_id']; ?></a>
                        <!-- <label for="filter<?php echo $filter['filter_id']; ?>"><?php echo $filter['name']; ?></label> -->
                    </li>
                    <?php } ?>
                    <?php } ?>
                    <div style="clear: both"></div>
                </ul>
            </li>
            <?php } ?>
        </ul>
        <!-- <a id="button-filter" class="button"><?php echo $button_filter; ?></a> -->
    </div>
</div>
<script type="text/javascript"><!--
    $('.button-filter').bind('click', function() {
    var filter = [];
	
    //$('.box-filter input[type=\'radio\']:checked').each(function(element) {
    filter.push(this.value);
    //});
	
    //location = '<?php echo $action; ?>&filter=' + filter.join(',');
    location = '<?php echo $action; ?>&filter=' + $(this).html();
});
//--></script> 
