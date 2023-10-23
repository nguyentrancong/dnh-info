@options =  [data-v-component-product-options]
@option  = [data-v-component-product-options] [data-v-option]

@option|deleteAllButFirstChild

@options|prepend = <?php
if (isset($_options_idx)) $_options_idx++; else $_options_idx = 0;
$previous_component = isset($current_component)?$current_component:null;
$options = $current_component = $this->_component['product_options'][$_options_idx] ?? [];

$_pagination_count = $options['count'] ?? 0;
$_pagination_limit = isset($options['limit']) ? $options['limit'] : 5;	
?>


@option|before = <?php
if($options && is_array($options['option'])) {
	foreach ($options['option'] as $index => $option) {?>
		
		@option|data-option_id = $option['option_id']
		
		@option|id = <?php echo 'option-' . $option['option_id'];?>
		
		@option [data-v-option-content] = <?php echo $option['content'];?>
		
		@option img[data-v-option-*]|src = $option['@@__data-v-option-(*)__@@']
		
		@option [data-v-option-*]|innerText = $option['@@__data-v-option-(*)__@@']
		
		@option a[data-v-option-*]|href = $option['@@__data-v-option-(*)__@@']
	
	@option|after = <?php 
	} 
}
?>
