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
        <table id="field" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_name; ?></td>
              <td class="left"><?php echo $entry_type; ?></td>
			  <td class="left"><?php echo $entry_unique_id; ?></td>
              <td class="left"><?php echo $entry_required; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $field_row = 0; ?>
          <?php foreach ($fields as $field) { ?>
          <tbody id="field-row<?php echo $field_row; ?>">
            <tr>
              <td class="left"><input type="text" name="cpf_fields[<?php echo $field_row; ?>][name]" value="<?php echo $field['name']; ?>" size="15" /><input type="hidden" name="cpf_fields[<?php echo $field_row; ?>][option_id]" value="<?php echo $field['option_id']; ?>" /></td>
              <td class="left"><div id="cpf_fields_type_<?php echo $field_row; ?>"><?php echo $field['type']; ?></div></td>
			  <td class="left"><div id="cpf_fields_value_<?php echo $field_row; ?>">
				<?php if (!empty($field['values'])) { ?>
				  <?php foreach ($field['values'] as $value) { ?>
					<?php echo $value['name']; ?><br />
				  <?php } ?>
				<?php } else { ?>
				  <?php echo $text_types; ?>
				<?php } ?>
			  </div></td>
			  <td class="left"><select name="cpf_fields[<?php echo $field_row; ?>][required]">
				  <?php if ($field['required'] == 1) { ?>
				  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
				  <option value="0"><?php echo $text_no; ?></option>
				  <?php } else { ?>
				  <option value="1"><?php echo $text_yes; ?></option>
				  <option value="0" selected="selected"><?php echo $text_no; ?></option>
				  <?php } ?>
				</select></td>
              <td class="left"><select name="cpf_fields[<?php echo $field_row; ?>][status]">
                  <?php if ($field['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="right"><input type="text" name="cpf_fields[<?php echo $field_row; ?>][sort_order]" value="<?php echo $field['sort_order']; ?>" size="3" /></td>
              <td class="left"><a onclick="$('#field-row<?php echo $field_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $field_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="left"><a onclick="addField();" class="button"><?php echo $button_add_field; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
  <div style="text-align:center; color:#222222;">Custom Product Fields v1.2 by <a target="_blank" href="http://www.marketinsg.com/">MarketInSG</a>.</div>
</div>
<script type="text/javascript"><!--
var field_row = <?php echo $field_row; ?>;

function addField() {	
	html  = '<tbody id="field-row' + field_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><input type="text" name="cpf_fields[' + field_row + '][name]" value="" size="15" /><input type="hidden" name="cpf_fields[' + field_row + '][option_id]" value="" /></td>';
	html += '    <td class="left"><div id="cpf_fields_type_' + field_row + '"></div></td>';
	html += '	 <td class="left"><div id="cpf_fields_value_' + field_row + '"><?php echo $text_types; ?></div></td>';
	html += '    <td class="left"><select name="cpf_fields[' + field_row + '][required]">';
    html += '      <option value="1" selected="selected"><?php echo $text_yes; ?></option>';
    html += '      <option value="0"><?php echo $text_no; ?></option>';
    html += '    </select></td>';
	html += '    <td class="left"><select name="cpf_fields[' + field_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="cpf_fields[' + field_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#field-row' + field_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#field tfoot').before(html);
	
	optionautocomplete(field_row);
	
	field_row++;
}

function optionautocomplete(field_row) {
	$('input[name=\'cpf_fields[' + field_row + '][name]\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item.category,
							label: item.name,
							value: item.option_id,
							type: item.type,
							option_value: item.option_value
						}
					}));
				}
			});
		}, 
		select: function(event, ui) {
			if (ui.item.type != 'image') {
				$('input[name=\'cpf_fields[' + field_row + '][name]\']').attr('value', ui.item.label);
				$('input[name=\'cpf_fields[' + field_row + '][option_id]\']').attr('value', ui.item.value);
				
				if (ui.item.type == 'checkbox') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_checkbox; ?>');
				} else if (ui.item.type == 'select') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_select; ?>');
				} else if (ui.item.type == 'radio') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_radio; ?>');
				} else if (ui.item.type == 'file') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_file; ?>');
				} else if (ui.item.type == 'text') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_text; ?>');
				} else if (ui.item.type == 'textarea') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_textarea; ?>');
				} else if (ui.item.type == 'date') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_date; ?>');
				} else if (ui.item.type == 'datetime') {
					$('#cpf_fields_type_' + field_row).html('<?php echo $text_datetime; ?>');
				}
				
				if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox') {
					$('#cpf_fields_value_' + field_row).html('');
					
					for (i = 0; i < ui.item.option_value.length; i++) {
						$('#cpf_fields_value_' + field_row).prepend(ui.item.option_value[i]['name'] + '<br />');
					}
				}
			} else {
				alert('<?php echo $error_type; ?>');
			}
			
			return false;
		},
		focus: function(event, ui) {
      		return false;
   		}
	});
}
//--></script> 
<?php echo $footer; ?>