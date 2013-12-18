<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table id="module" class="list">
                    <thead>
                        <tr>
                            <td class="left"><?php echo $entry_banner; ?></td>
                            <td class="left"><span class="required">*</span> <?php echo $entry_dimension; ?></td>
                            <td class="left"><?php echo $entry_layout; ?></td>
                            <td class="left"><?php echo $entry_position; ?></td>
                            <td class="left"><?php echo $entry_store; ?></td>
                            <td class="left"><?php echo $entry_status; ?></td>
                            <td class="right"><?php echo $entry_sort_order; ?></td>
                            <td></td>
                        </tr>
                    </thead>
                    <?php $module_row = 0; ?>
                    <?php foreach ($modules as $module) { ?>
                    <?php if(isset($module['banner_store'])) { $banner_store=$module['banner_store']; } else { $banner_store=array(); } ?>
                    <tbody id="module-row<?php echo $module_row; ?>">
                        <tr>
                            <td class="left"><select name="banner_custom_module[<?php echo $module_row; ?>][banner_id]">
                                    <?php foreach ($banners as $banner) { ?>
                                    <?php if ($banner['banner_id'] == $module['banner_id']) { ?>
                                    <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select></td>
                            <td class="left"><input type="text" name="banner_custom_module[<?php echo $module_row; ?>][width]" value="<?php echo $module['width']; ?>" size="3" />
                                <input type="text" name="banner_custom_module[<?php echo $module_row; ?>][height]" value="<?php echo $module['height']; ?>" size="3" />
                                <?php if (isset($error_dimension[$module_row])) { ?>
                                <span class="error"><?php echo $error_dimension[$module_row]; ?></span>
                                <?php } ?></td>
                            <td class="left">
                                <select name="banner_custom_module[<?php echo $module_row; ?>][layout_id]">
                                    <?php foreach ($layouts as $layout) { ?>
                                    <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select>
                            </td>
                            <td class="left">
                                <select name="banner_custom_module[<?php echo $module_row; ?>][position]">
                                    <?php if ($module['position'] == 'content_top') { ?>
                                    <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                                    <?php } else { ?>
                                    <option value="content_top"><?php echo $text_content_top; ?></option>
                                    <?php } ?>
                                    <?php if ($module['position'] == 'content_bottom') { ?>
                                    <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                                    <?php } else { ?>
                                    <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                                    <?php } ?>
                                    <?php if ($module['position'] == 'column_left') { ?>
                                    <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                                    <?php } else { ?>
                                    <option value="column_left"><?php echo $text_column_left; ?></option>
                                    <?php } ?>
                                    <?php if ($module['position'] == 'column_right') { ?>
                                    <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                                    <?php } else { ?>
                                    <option value="column_right"><?php echo $text_column_right; ?></option>
                                    <?php } ?>
                                </select>
                            </td>

                            <td><div class="scrollbox">
                                    <?php $class = 'even'; ?>
                                    <div class="<?php echo $class; ?>">
                                        <?php if (in_array(0, $banner_store)) { ?>
                                        <input type="checkbox" name="banner_custom_module[<?php echo $module_row; ?>][banner_store][]" value="0" checked="checked" />
                                        <?php echo $text_default; ?>
                                        <?php } else { ?>
                                        <input type="checkbox" name="banner_custom_module[<?php echo $module_row; ?>][banner_store][]" value="0" />
                                        <?php echo $text_default; ?>
                                        <?php } ?>
                                    </div>
                                    <?php foreach ($stores as $store) { ?>
                                    <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                    <div class="<?php echo $class; ?>">
                                        <?php if (in_array($store['store_id'], $banner_store)) { ?>
                                        <input type="checkbox" name="banner_custom_module[<?php echo $module_row; ?>][banner_store][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                                        <?php echo $store['name']; ?>
                                        <?php } else { ?>
                                        <input type="checkbox" name="banner_custom_module[<?php echo $module_row; ?>][banner_store][]" value="<?php echo $store['store_id']; ?>" />
                                        <?php echo $store['name']; ?>
                                        <?php } ?>
                                    </div>
                                    <?php } ?>
                                </div>
                            </td>

                            <td class="left"><select name="banner_custom_module[<?php echo $module_row; ?>][status]">
                                    <?php if ($module['status']) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select></td>
                            <td class="right"><input type="text" name="banner_custom_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                        </tr>
                    </tbody>
                    <?php $module_row++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                            <td colspan="7"></td>
                            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    </div>
    <script type="text/javascript"><!--
    var module_row = '<?php echo $module_row; ?>';
        var banners = $.parseJSON('<?php echo json_encode($banners); ?>');
        var layouts = $.parseJSON('<?php echo json_encode($layouts); ?>');

        function addModule() {
            html = '<tbody id="module-row' + module_row + '">';
            html += '  <tr>';
            html += '    <td class="left"><select name="banner_custom_module[' + module_row + '][banner_id]">';

            banners.forEach(function(elem, index, array) {
                html += '      <option value="' + elem.banner_id + '">' + elem.name + '</option>';
            });

            html += '    </select></td>';
            html += '    <td class="left"><input type="text" name="banner_custom_module[' + module_row + '][width]" value="" size="3" /> <input type="text" name="banner_custom_module[' + module_row + '][height]" value="" size="3" /></td>';
            html += '    <td class="left"><select name="banner_custom_module[' + module_row + '][layout_id]">';

            layouts.forEach(function(elem, index, array) {
                html += '      <option value="' + elem.layout_id + '">' + elem.name + '</option>';
            });

            html += '    </select></td>';
            html += '    <td class="left"><select name="banner_custom_module[' + module_row + '][position]">';
            html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
            html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
            html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
            html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
            html += '    </select></td>';
            html += '<td><div class="scrollbox"><?php $class = "even"; ?><div class="<?php echo $class; ?>"><input type="checkbox" name="banner_custom_module[' + module_row + '][banner_store][]" value="0" /><?php echo $text_default; ?></div><?php foreach ($stores as $store) { ?><?php $class = ($class == "even" ? "odd" : "even"); ?><div class="<?php echo $class; ?>"><input type="checkbox" name="banner_module[' + module_row + '][banner_store][]" value="<?php echo $store["store_id"]; ?>" /><?php echo $store["name"]; ?></div><?php } ?></div></td>';
            html += '    <td class="left"><select name="banner_custom_module[' + module_row + '][status]">';
            html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
            html += '      <option value="0"><?php echo $text_disabled; ?></option>';
            html += '    </select></td>';
            html += '    <td class="right"><input type="text" name="banner_custom_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
            html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
            html += '  </tr>';
            html += '</tbody>';

            $('#module tfoot').before(html);

            module_row++;
        }
        //--></script>
    <?php echo $footer; ?>