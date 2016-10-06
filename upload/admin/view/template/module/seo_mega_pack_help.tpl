<?php require DIR_TEMPLATE . 'module/seo_mega_pack-header.tpl'; ?>

<?php require DIR_TEMPLATE . 'module/seo_mega_pack-js.tpl'; ?>

<script type="text/javascript">
	var seoMegaPack_variableTags = {};
</script>

<?php if( $is_installed ) { ?>
	<div class="tab-content">
		<div class="tab-pane active">
			<br />

			<table class="table">
				<thead>
					<tr>
						<td style="padding:5px"><?php echo $column_parameter; ?></td>
						<td style="padding:5px"><?php echo $column_description; ?></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="250">{product_name}</td>
						<td>product's name</td>
					</tr>
					<tr>
						<td>{category}</td>
						<td>category's name</td>
					</tr>
					<tr>
						<td>{model}</td>
						<td>product's model</td>
					</tr>
					<tr>
						<td>{brand}</td>
						<td>brand's name</td>
					</tr>
					<tr>
						<td>{sku}</td>
						<td>product's sku</td>
					</tr>
					<tr>
						<td>{upc}</td>
						<td>product's upc</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<?php } else { ?>
	<br /><br /><center><?php echo $smk_error_warning; ?></center>
<?php } ?>
					
<?php require DIR_TEMPLATE . 'module/seo_mega_pack-footer.tpl'; ?>