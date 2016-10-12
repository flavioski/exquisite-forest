<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if( ! empty( $breadcrumbs ) && is_array( $breadcrumbs ) ) { ?>
      <ul style="display:none;">
        <?php foreach( $breadcrumbs as $breadcrumb ) { ?>
        <?php if( NULL != ( $smk_title = strip_tags( $breadcrumb['text'] ) ) ) { ?>
        <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
          <a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo strip_tags( $breadcrumb['text'] ); ?></span></a>
        </li>
        <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
    <?php if($products) { ?>
      <div class="rc-headline-section category-sort-filters">
        <div class="left-section"><h2 class="rc-heading no-margin-top category-page"><?php echo $heading_title; ?></h2></div>
      	<div class="right-section">
          <div class="form-group input-group first-filter">
            <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="form-group input-group second-filter">
            <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>
      <?php } else { ?>
      	<h2 class="rc-heading no-margin-top"><?php echo $heading_title; ?></h2>
      <?php } ?>
      <?php if ($categories) { ?>
      <ul class="list-unstyled category-categories">
	  	<?php foreach ($categories as $category) { ?>
        	<li><a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
      </ul>
      <div class="clearfix"></div>
      <hr class="category-page">
      <?php } ?>
      <?php if ($products) { ?>
      <div class="row product-row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-xs-12 col-sm-6 col-md-3">
        <div class="product-thumb transition">
          <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo empty( $product['smp_alt_images'] ) ? $product['name'] : $product['smp_alt_images']; ?>" title="<?php echo empty( $product['smp_title_images'] ) ? $product['name'] : $product['smp_title_images']; ?>" class="img-responsive" /></a></div>
          <div class="caption">
            <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
            <?php if ($product['price']) { ?>
            <p class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>
            </p>
            <?php } ?>
            <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($product['rating'] < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php } ?>
          </div>
        </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php if( ! empty( $tags ) ) { ?>
      <?php foreach( $tags as $tagKey => $tag ) { ?><?php if( $tagKey ) { ?>, <?php } ?><a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a><?php } ?>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
