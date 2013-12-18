<?php if($options || $manufacturers || $attributes || $price_slider) { ?>
<div class="box">
    <!-- <div class="box-heading"><?php echo $heading_title; ?></div>  -->
    <div class="box-content">

        <form id="filterpro">
            <?php if($manufacturers) { ?>
            <?php foreach($manufacturers as $manufacturer) { ?>
            <input type="hidden" class="m_name" id="m_<?php echo $manufacturer['manufacturer_id']?>" value="<?php echo $manufacturer['name']?>">
            <?php } ?>
            <?php } ?>

            <?php if($options) { ?>
            <?php foreach($options as $option) { ?>
            <?php foreach($option['option_values'] as $option_value) { ?>
            <input type="hidden" class="o_name" id="o_<?php echo $option_value['option_value_id']?>" value="<?php echo $option_value['name']?>">
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <input type="hidden" name="category_id" id="category_id" value="<?php echo $category_id ?>">
            <input type="hidden" name="page" id="filterpro_page" value="0">
            <input type="hidden" name="path" id="category_path" value="<?php echo $path ?>">
            <input type="hidden" name="sort" id="filterpro_sort" value="">
            <input type="hidden" name="order" id="filterpro_order" value="">
            <input type="hidden" name="limit" id="filterpro_limit" value="">


            <?php if($manufacturers) { ?>
            <div class="option_box">
                <div class="option_name"><?php echo $text_manufacturers; ?></div>
                <?php if($display_manufacturer == 'select') { ?>
                <div class="collapsible">
                    <select name="manufacturer[]" class="filtered">
                        <option value=""><?php echo $text_all?></option>
                        <?php foreach($manufacturers as $manufacturer) { ?>
                        <option id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value" value="<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></option>
                        <?php } ?>
                    </select>
                </div>
                <?php } elseif($display_manufacturer == 'checkbox') { ?>
                <table class="collapsible">
                    <?php foreach($manufacturers as $manufacturer) { ?>
                    <tr>
                        <td>
                            <input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
                                   type="checkbox" name="manufacturer[]"
                                   value="<?php echo $manufacturer['manufacturer_id']?>">
                        </td>
                        <td>
                            <label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                <?php } elseif($display_manufacturer == 'radio') { ?>
                <table class="collapsible">
                    <?php foreach($manufacturers as $manufacturer) { ?>
                    <tr>
                        <td>

                            <input id="manufacturer_<?php echo $manufacturer['manufacturer_id']?>" class="manufacturer_value filtered"
                                   type="radio" name="manufacturer[]"
                                   value="<?php echo $manufacturer['manufacturer_id']?>">
                        </td>
                        <td>
                            <label for="manufacturer_<?php echo $manufacturer['manufacturer_id']?>"><?php echo $manufacturer['name']?></label>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                <?php }?>
            </div>
            <?php } ?>

            <?php if($attributes) { ?>
            <?php foreach($attributes as $attribute_group_id => $attribute) { 
            if($attribute['name'] == 'color'){
            ?>
            <div class="option_box" style="border: 0">
                <?php foreach($attribute['attribute_values'] as $attribute_value_id => $attribute_value) { ?>
                <div class="attribute_box">
                    <?php if($attribute_value['display'] == 'select') { ?>
                    <div class="collapsible">
                        <select class="filtered" name="attribute_value[<?php echo $attribute_value_id?>][]">
                            <option value=""><?php echo $text_all?></option>
                            <?php foreach($attribute_value['values'] as $i => $value) { ?>
                            <option class="a_name"
                                    at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                    at_v_t="<?php echo $attribute_value_id . '_' . $value ?>"
                                    data-value = "<?php echo $value ?>"
                                    value="<?php echo $value ?>"><?php echo $value ?></option>
                            <?php }?>
                        </select>
                    </div>
                    <?php } elseif($attribute_value['display'] == 'checkbox') { ?>
                    <table class="collapsible">
                        <?php foreach($attribute_value['values'] as $i => $value) { ?>
                        <tr>
                            <td>
                                <input class="filtered a_name"
                                       id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       type="checkbox" name="attribute_value[<?php echo $attribute_value_id?>][]"
                                       at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                       value="<?php echo $value ?>">
                            </td>
                            <td>
                                <label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       at_v_t="<?php echo $attribute_value_id . '_' . $value ?>"
                                       data-value = "<?php echo $value ?>"
                                       value="<?php echo $value ?>"><?php echo $value?></label>
                            </td>
                        </tr>
                        <?php } ?>
                    </table>
                    <?php } elseif($attribute_value['display'] == 'radio') { ?>
                    <table class="collapsible">
                        <?php foreach($attribute_value['values'] as $i => $value) { ?>
                        <tr>
                            <td style="position: relative">

                                <input style="width: 30px;min-height: 30px;position: relative; background-color: <?php echo $value ?>;"  class="filtered a_name"
                                       id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       type="radio" name="attribute_value[<?php echo $attribute_value_id?>][]"
                                       at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                       value="<?php echo $value ?>"  >
                            </td>
                            <!--  <td >
                                  <label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                          at_v_t="<?php echo $attribute_value_id . '_' . $value ?>"
                                          data-value = "<?php echo $value ?>"
                                          value="<?php echo $value ?>"><?php echo $value?></label>  
                             </td>-->
                        </tr>
                        <?php } ?>
                    </table>
                    <?php } elseif($attribute_value['display'] == 'slider') { ?>					
                    <table class="collapsible" style="width:100%">
                        <tr>
                            <td><span id="attribute_label_<?php echo $attribute_value_id; ?>_min"><?php echo min($attribute_value['values']) . $attribute_value['suffix']; ?></span>
                                <input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_min" name="attr_slider[<?php echo $attribute_value_id?>][min]" value="">
                            </td>
                            <td><span id="attribute_label_<?php echo $attribute_value_id; ?>_max"><?php echo max($attribute_value['values']) . $attribute_value['suffix']; ?></span>
                                <input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_max" name="attr_slider[<?php echo $attribute_value_id?>][max]" value="">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><div id="slider-range-<?php echo $attribute_value_id; ?>"></div></td>
                        </tr>
                    </table>						
                    <script type="text/javascript">
                        var attr_arr_<?php echo $attribute_value_id; ?> = [<?php echo implode(',', $attribute_value['values']); ?>];
                        
                        $('#slider-range-<?php echo $attribute_value_id; ?>').slider({
                        range:true, 
                        min:0, 
                        max:<?php echo count($attribute_value['values'])-1; ?>, 
                        values:[0, <?php echo count($attribute_value['values'])-1; ?>], 
                        slide:function (a, b) {
                        var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
                        var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
                        $("#attribute_label_<?php echo $attribute_value_id; ?>_min").html(min + '<?php echo $attribute_value['suffix']; ?>');
                        $("#attribute_label_<?php echo $attribute_value_id; ?>_max").html(max + '<?php echo $attribute_value['suffix']; ?>');
                    }, 
                    stop:function (a, b) {
                    var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
                    var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
                    $("#attribute_value_<?php echo $attribute_value_id; ?>_min").val(min);
                    $("#attribute_value_<?php echo $attribute_value_id; ?>_max").val(max);
                    iF()
                }
            });
                    </script>						
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
            <?php 
            }
            else{
            ?>
            <div class="option_box">
                <div class="attribute_group_name"><?php echo $attribute['name']; ?></div>
                <?php foreach($attribute['attribute_values'] as $attribute_value_id => $attribute_value) { ?>
                <div class="attribute_box">
                    <div class="option_name"><?php echo $attribute_value['name']; ?></div>
                    <?php if($attribute_value['display'] == 'select') { ?>
                    <div class="collapsible">
                        <select class="filtered" name="attribute_value[<?php echo $attribute_value_id?>][]">
                            <option value=""><?php echo $text_all?></option>
                            <?php foreach($attribute_value['values'] as $i => $value) { ?>
                            <option class="a_name"
                                    at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                    at_v_t="<?php echo $attribute_value_id . '_' . $value ?>"
                                    data-value = "<?php echo $value ?>"
                                    value="<?php echo $value ?>"><?php echo $value ?></option>
                            <?php }?>
                        </select>
                    </div>
                    <?php } elseif($attribute_value['display'] == 'checkbox') { ?>
                    <table class="collapsible">
                        <?php foreach($attribute_value['values'] as $i => $value) { ?>
                        <tr>
                            <td>
                                <input class="filtered a_name"
                                       id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       type="checkbox" name="attribute_value[<?php echo $attribute_value_id?>][]"
                                       at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                       value="<?php echo $value ?>">
                            </td>
                            <td>
                                <label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       at_v_t="<?php echo $attribute_value_id . '_' . $value ?>"
                                       data-value = "<?php echo $value ?>"
                                       value="<?php echo $value ?>"><?php echo $value?></label>
                            </td>
                        </tr>
                        <?php } ?>
                    </table>
                    <?php } elseif($attribute_value['display'] == 'radio') { ?>
                    <table class="collapsible">
                        <?php foreach($attribute_value['values'] as $i => $value) { ?>
                        <tr>
                            <td>
                                <input class="filtered a_name"
                                       id="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       type="radio" name="attribute_value[<?php echo $attribute_value_id?>][]"
                                       at_v_i="<?php echo $attribute_value_id . '_' . $value ?>"
                                       value="<?php echo $value ?>">
                            </td>
                            <td>
                                <label for="attribute_value_<?php echo $attribute_value_id . $i; ?>"
                                       at_v_t="<?php echo $attribute_value_id . '_' . $value ?>"
                                       data-value = "<?php echo $value ?>"
                                       value="<?php echo $value ?>"><?php echo $value?></label>
                            </td>
                        </tr>
                        <?php } ?>
                    </table>
                    <?php } elseif($attribute_value['display'] == 'slider') { ?>					
                    <table class="collapsible" style="width:100%">
                        <tr>
                            <td><span id="attribute_label_<?php echo $attribute_value_id; ?>_min"><?php echo min($attribute_value['values']) . $attribute_value['suffix']; ?></span>
                                <input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_min" name="attr_slider[<?php echo $attribute_value_id?>][min]" value="">
                            </td>
                            <td><span id="attribute_label_<?php echo $attribute_value_id; ?>_max"><?php echo max($attribute_value['values']) . $attribute_value['suffix']; ?></span>
                                <input type="hidden" id="attribute_value_<?php echo $attribute_value_id; ?>_max" name="attr_slider[<?php echo $attribute_value_id?>][max]" value="">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><div id="slider-range-<?php echo $attribute_value_id; ?>"></div></td>
                        </tr>
                    </table>						
                    <script>
            var attr_arr_<?php echo $attribute_value_id; ?> = [<?php echo implode(',', $attribute_value['values']); ?>];
                        
            $('#slider-range-<?php echo $attribute_value_id; ?>').slider({
            range:true, 
            min:0, 
            max:<?php echo count($attribute_value['values'])-1; ?>, 
            values:[0, <?php echo count($attribute_value['values'])-1; ?>], 
            slide:function (a, b) {
            var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
            var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
            $("#attribute_label_<?php echo $attribute_value_id; ?>_min").html(min + '<?php echo $attribute_value['suffix']; ?>');
            $("#attribute_label_<?php echo $attribute_value_id; ?>_max").html(max + '<?php echo $attribute_value['suffix']; ?>');
        }, 
        stop:function (a, b) {
        var min = attr_arr_<?php echo $attribute_value_id; ?>[b.values[0]];
        var max = attr_arr_<?php echo $attribute_value_id; ?>[b.values[1]];
        $("#attribute_value_<?php echo $attribute_value_id; ?>_min").val(min);
        $("#attribute_value_<?php echo $attribute_value_id; ?>_max").val(max);
        iF()
    }
});
                    </script>						
                    </table>
                    <?php } ?>
                </div>
                <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>

            <?php if($options) {  ?>
            <?php foreach($options as $option) { ?>
            <div class="option_box">
                <div style="visibility: hidden;"  <?php if($option['display'] == 'checkbox') { ?> id="clear_filter_<?php echo $option['option_id']?>"<?php }else{ ?> id="clear_filter"<?php }?>> <a class="clear_filter"><?php echo $clear_filter?></a></div> 
                <div class="option_name"><?php echo $option['name']; ?></div>
                <?php if($option['display'] == 'select') { ?>
                <div class="collapsible">
                    <select class="filtered" name="option_value[<?php echo $option['option_id']?>][]">
                        <option value=""><?php echo $text_all?></option>
                        <?php foreach($option['option_values'] as $option_value) { ?>
                        <option class="option_value" id="option_value_<?php echo $option_value['option_value_id']?>" value="<?php echo $option_value['option_value_id'] ?>"><?php echo $option_value['name']?></option>
                        <?php }?>
                    </select>
                </div>
                <?php } elseif($option['display'] == 'checkbox') { ?>
                <table class="collapsible clustered" cellpadding="0" cellspacing="0" border="0">
                    <?php foreach($option['option_values'] as $option_value) { ?>
                    <tr>
                        <td>
                            <input onclick = "show_reset(<?php echo $option['option_id']?>,this) "class="clustered filtered option_value" id="option_value_<?php echo $option_value['option_value_id'] ?>"
                                   type="checkbox" name="option_value[<?php echo $option['option_id']?>][]"
                                   value="<?php echo $option_value['option_value_id']?>">
                        </td>
                        <td>
                            <label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                <?php } elseif($option['display'] == 'image') { ?>
                <div class="collapsible">
                    <?php foreach($option['option_values'] as $option_value) { ?>
                    <span class="filtered option_value image-option" id="option_value_<?php echo $option_value['option_value_id']?>" >
                        <img src="http://<?php echo $_SERVER['HTTP_HOST'] ?>/image/<?php echo $option_value['image'] ?>" title="<?php echo $option_value['name']; ?>" height="23"width="40" />
                        <input type="hidden" disabled="true"  name="option_value[<?php echo $option['option_id']?>][]"  value="<?php echo $option_value['option_value_id']?>" />
                    </span>
                    <?php } ?>
                </div>
                <?php } elseif($option['display'] == 'color') { ?>
                <div class="collapsible">
                    <?php foreach($option['option_values'] as $option_value) { ?>
                    <span class="filtered option_value color-option selected" title="<?php echo $option_value['image']; ?>" id="option_value_<?php echo $option_value['option_value_id']?>">
                        <img src="http://<?php echo $_SERVER['HTTP_HOST'] ?>/image/<?php echo $option_value['image']; ?>" title="<?php echo $option_value['name']; ?>"  />
                        <input type="hidden" disabled="true" name="option_value[<?php echo $option['option_id']?>][]"  value="<?php echo $option_value['option_value_id']?>" />
                    </span>
                    <?php } ?>
                </div>
                <?php } elseif($option['display'] == 'months') { ?>
                <div class="collapsible months-option-table clearfix" cellpadding="0" cellspacing="0" border="0">
                    <?php foreach($fullOptions['months'] as $key => $months){  ?>
                    <?php $found = 'false';  ?>
                    <?php foreach($option['option_values'] as $option_value) { ?>
                    <?php if($option_value['name'] == $months){ ?>
                    <?php $found = 'true'; ?>
                    <span class="filtered option_value months-option selected" title="<?php echo $option_value['name'];?>" id="option_value_<?php echo $option_value['option_value_id']?>">
                        <label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name'][0]?></label>
                        <input type="hidden" disabled="true" name="option_value[<?php echo $option['option_id']?>][]"  value="<?php echo $option_value['option_value_id']?>" />
                    </span>
                    <?php } ?>
                    <?php } ?>
                    <?php if($found == 'false'){ ?>
                    <span class="option_value months-option" title="<?php echo $months;?>" id="option_value_<?php echo $option_value['option_value_id']?>">
                        <label><?php echo $months[0]; ?></label>
                    </span>

                    <?php } ?>
                    <?php } ?>
                </div>
                <?php } elseif($option['display'] == 'radio') { ?>
                <table class="collapsible" cellpadding="0" cellspacing="0" border="0">
                    <?php foreach($option['option_values'] as $option_value) { ?>
                    <tr>
                        <td>
                            <input class="filtered option_value" id="option_value_<?php echo $option_value['option_value_id']?>"
                                   type="radio" name="option_value[<?php echo $option['option_id']?>][]"
                                   value="<?php echo $option_value['option_value_id']?>">
                        </td>
                        <td>
                            <label for="option_value_<?php echo $option_value['option_value_id']?>"><?php echo $option_value['name']?></label>
                        </td>
                    </tr>
                    <?php } ?>
                </table>
                <?php }?>
            </div>
            <?php } ?>
            <?php } ?>
            <div class="price_slider" <?php if(!$price_slider) { echo 'style="display:none"'; }?> >
                 <div id="clear_filter_price"><a class="clear_filter"><?php echo $clear_filter?></a></div> 
                <div class="price_slider_label">
                    <label for="min_price"><?php echo $text_price_range?></label>
                    <label class="currency-symbol"></label><label id="min_price_label" ></label>
                    <label class="saparator">-</label>
                    <label class="currency-symbol"></label><label id="max_price_label" ></label>
                    <input class="price_limit" type="hidden" name="min_price" value="-1" id="min_price"/>
                    <input class="price_limit" type="hidden" name="max_price" value="-1" id="max_price"/>
                </div>
                <!-- <br/>
                <table>
                    <tr>
                        <td><input class="price_limit" type="text" name="min_price" value="-1" id="min_price"/></td>
                        <td><input class="price_limit" type="text" name="max_price" value="-1" id="max_price"/></td>
                    </tr>
                </table> -->

                <div id="slider-range"></div>

            </div>
        </form>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){        
            $('table.clustered').each(function(){
                var clusterVals = new Array();
                var HTML = '';
                var i = 0;
                $(this).children().children("tr").each(function(){
                    var HTMLtmp = $(this).find('label').html();
                    HTML = HTMLtmp.replace( /[^\d.]/g, '' );
                    
                    if(!isNaN(parseInt(HTML))){
                        var child_id = $(this).find('input.clustered').attr("id");
                        var child_name = $(this).find('input.clustered').attr("name");
                        var clusterValsChild = new Array();
                        clusterValsChild['value'] = HTML;
                        clusterValsChild['name'] = child_name;
                        clusterValsChild['id'] = child_id;
                        clusterVals[i] =  clusterValsChild;
                        i++;
                    }
                });
               
                if(!$.isEmptyObject(clusterVals)){
                    var tmpArray = new Array();
                    var i = 0;
                    clusterVals.forEach( function(elem, index, array){
                        tmpArray[i] = parseInt(elem['value']);
                        i++;
                    });
                    tmpArray = tmpArray.sort(function(a,b){
                        return a-b;
                    });
                    var minArray = tmpArray[0];
                    var maxArray = tmpArray[tmpArray.length-1];
                    var rangeArray = new Array();
                    var lastRange = '';
                    var j= 0;
                    for(j=0;j<=2;j++){
                        if(rangeArray.length < j){
                            var tmpRangeArray = new Array();
                            rangeArray[j] = tmpRangeArray;
                        }
                        var tmp = '';
                        lastRange = ''
                        
                        clusterVals.forEach(function(elem, index, array){
                            if(elem['value'] >= (parseInt(minArray)+(j*10)) && elem['value'] < (parseInt(minArray)+((j+1)*10))){
                                if(tmp.length){
                                    tmp += ','+elem['id'];
                                }else{
                                    tmp = elem['id'];
                                }
                                lastRange = parseInt(minArray)+((j)*10);
                                clusterVals[index] = '';
                            }
                        });
                        if(lastRange){
                            var tmpRangeArray = new Array();
                            tmpRangeArray['id'] = tmp;
                            tmpRangeArray['value'] = lastRange+'-'+(lastRange+10)+' cm';
                            rangeArray[j] = tmpRangeArray;
                        }
                        if(!clusterVals.length){ return false; }
                    }
                    if(clusterVals.length){
                        rangeArray.forEach(function(elem, index, array){
                            if(elem['value']){
                                var lastRangeTmp = elem['value'].split('-');
                                lastRange = lastRangeTmp[1].replace( /[^\d.]/g, '' );
                            }
                        });
                        var tmp = new Array();
                        var tmpRangeArray = new Array();
                        clusterVals.forEach(function(elem, index, array){ 
                            tmp.push(elem['id']);
                        });
                        tmpRangeArray['id'] = tmp.join(',');
                        var lastVal = rangeArray[rangeArray.length-1]['value'];
                        tmpRangeArray['value'] = (parseInt(lastRange))+'+';
                        rangeArray.push(tmpRangeArray);
                    }
                    
                    HTML = '<table class="cluster collapsible" ><tbody>';
                    rangeArray.forEach( function(elem, index, array){
                        if(elem['id']){
                            var tmp = '<tr><td>';
                            tmp += '<input id="" type="checkbox" name="" class="cluster option_value" value="'+elem['id']+'" />';
                            tmp += '</td><td><label>'+elem["value"]+'</label></td></tr>';
                            HTML += tmp;
                        }
                    });
                    HTML += '</tbody></table>';
                    if(HTML){
                        var parent = $(this).parent();
                        $(this).hide();
                        parent.append(HTML);
                    }
                }
            });
        });
    </script>


    <script id="productTemplate" type="text/x-jquery-tmpl">

        <li class="span3 clearfix">
            {{if thumb}}
            <div class="thumbnail"><a href="${href}"><img src="${thumb}" title="${name}" alt="${name}"/></a></div>
                    {{/if}}
            <div class="thumbSetting">
                <div class="thumbTitle">
                    <a href="${href}">${name}</a>
                    
                    <!-- <div class="extra" style="color: #444;">
                    {{if sku}}
                    <span style="color:#38b0e3"><?php echo $pds_sku; ?></span> ${sku} <br/>
                    {{/if}}
                    {{if model}}
                    <span style="color:#38b0e3"><?php echo $pds_model; ?></span> ${model} <br/>
                    {{/if}}
                         
                    {{if brand}}
                    <span style="color:#38b0e3"><?php echo $pds_brand; ?></span> ${brand} <br/>
                    {{/if}}
                    {{if location}}
                    <span style="color:#38b0e3"><?php echo $pds_location; ?></span> ${location} <br/>
                    {{/if}}
                    {{if upc}}
                    <span style="color:#38b0e3"><?php echo $pds_upc; ?></span> ${upc} <br/>
                    {{/if}}
                    {{if stock}}
                    <span style="color:#38b0e3"><?php echo $pds_stock; ?></span> ${stock} <br/>
                    {{/if}}
                </div> -->
                </div>
        <div class="thumbTitle">
       
            </div>
               <!-- <div class="description">${description}</div>  -->
                {{if price}}
                <div class="thumbPrice">
                    {{if special}}
                    <span><span class="strike-through">${price}</span> ${special}</span>
                    {{else}}
                    <span>${price}</span>
                    {{/if}}
                    {{if tax}}
                    <!--<br/>
                    <span class="price-tax"><?php echo $text_tax; ?> ${tax}</span> -->
                    {{/if}}
                    {{if options_cus}}
                       <span class="custom_options">${options_cus}</span>
                    {{/if}}

                </div>
                {{/if}}
                <!-- {{*if rating}}
                <div class="rating"><img src="catalog/view/theme/default/image/stars-${rating}.png" alt="${reviews}" /></div> 
                {{/if*}} -->
                <div class="thumbButtons">
                    <button data-toggle="tooltip" data-placement="top" data-title="+Add to Cart" class="btn btn-primary btn-small" onclick="addToCart('${product_id}');" data-original-title="" title="">
                        <i class="icon-shopping-cart"></i>
                    </button>
                    <button data-toggle="tooltip" data-placement="top" data-title="+Add to Wish List" class="btn btn-small" onclick="addToWishList('${product_id}');" data-original-title="" title="">
                        <i class="icon-heart"></i>
                    </button>
                    <!-- <div class="cart"><a onclick="addToCart('${product_id}');" class="button"><span><?php echo $button_cart; ?></span></a></div>
                    <div class="wishlist"><a onclick="addToWishList('${product_id}');"><?php echo $button_wishlist; ?></a></div>
                    <div class="compare"><a onclick="addToCompare('${product_id}');"><?php echo $button_compare; ?></a></div> -->
                </div>
            </div>
        </li>

    </script>
</div>

<?php } ?>