<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/radiance/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" onload="if(media!='all')media='all'" />
<script src="catalog/view/theme/radiance/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript" async></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="none" onload="if(media!='all')media='all'" />
<link href="catalog/view/theme/radiance/stylesheet/stylesheet.css" rel="stylesheet" media="none" onload="if(media!='all')media='all'">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" onload="if(media!='all')media='all'" />
<?php } ?>
<script src="catalog/view/theme/radiance/javascript/common.js" type="text/javascript" async></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript" async></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<?php if( ! empty( $smp_canonical_url ) ) { ?>
<link href="<?php echo $smp_canonical_url; ?>" rel="canonical" />
<?php } ?>
<?php foreach( $documentGetMeta as $val ) { ?>
<meta<?php foreach( $val as $k => $v ) { ?> <?php echo $k; ?>="<?php echo $v; ?>"<?php } ?> />
<?php } ?>
<script type="text/javascript">
    function getURLVar(key) {
    <?php if( ! empty( $smk_current_route ) ) { ?>
            if( key == 'route' ) {
                return '<?php echo addslashes( $smk_current_route ); ?>';
            }
        <?php } ?>

        var value 	= [],
                url		= String(document.location),
                query;

        if( url.indexOf( '?' ) > -1 ) {
            query = url.split('?');
        } else {
            query = url.split('/');
            query.shift();
            query.shift();
            query.shift();
            query = query.join('/');

            query = query.indexOf( '&' ) > -1 ? [ query.substring( 0, query.indexOf('&') ), query.substring( query.indexOf('&')+1 ) ] : [ query, '' ];

            value['route'] = query[0];
        }

        if (typeof query[1] != 'undefined') {
            var part = query[1].split('&');

            for (i = 0; i < part.length; i++) {
                var data = part[i].split('=');

                if (data[0] && data[1]) {
                    value[data[0]] = data[1];
                }
            }

            if (value[key]) {
                return value[key];
            } else {
                return '';
            }
        }
    }
</script>
<?php if( ! empty( $smp_meta ) ) { ?>
<?php foreach( $smp_meta as $k => $v ) { ?>
<?php if( ! empty( $v ) ) { ?>
<meta name="<?php echo $k; ?>" content="<?php echo $v; ?>" />
<?php } ?>
<?php } ?>
<?php } ?>
<?php if( ! empty( $smp_extras['facebook_widget']['enabled'] ) ) { ?>
<script type="text/javascript">
    $().ready(function(){
        $('body').prepend('<div id="fb-root"></div>');

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/<?php echo $smp_config_language . '_' . strtoupper( $smp_config_language ); ?>/sdk.js#xfbml=1&version=v2.4";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    });
</script>
<script type="text/javascript">
    $().ready(function(){
        var html =
                '<div ' +
                'id="smp-fb-widget" ' +
                'style="border: 1px solid #<?php echo $smp_extras['facebook_widget']['colorscheme'] == 'dark' ? '000' : 'ccc'; ?>; background: #<?php echo $smp_extras['facebook_widget']['colorscheme'] == 'dark' ? '000' : 'fff'; ?>; z-index: 999; position: fixed; display: block; top:<?php echo $smp_extras['facebook_widget']['margin_top']; ?>px; <?php echo $smp_extras['facebook_widget']['position'] == 'left' ? 'left' : 'right'; ?>:-<?php echo $smp_extras['facebook_widget']['width']+2; ?>px;"' +
        '>' +
        '<img ' +
        'style="position: absolute; cursor: pointer;" ' +
        'src="<?php echo ! empty( $smp_extras['facebook_widget']['image'] ) ? 'image/' . $smp_extras['facebook_widget']['image'] : ( 'catalog/view/theme/default/smp/img/fb-' . $smp_extras['facebook_widget']['position'] . '.png' ); ?>" ' +
        '/>' +
        '<div ' +
        'class="fb-page" ' +
        'data-href="<?php echo $smp_extras['facebook_widget']['url']; ?>" ' +
        'data-small-header="<?php echo ! empty( $smp_extras['facebook_widget']['small_header'] ) ? 'true' : 'false'; ?>" ' +
        'data-adapt-container-width="false" ' +
        'data-hide-cover="false" ' +
        'data-show-facepile="<?php echo empty( $smp_extras['facebook_widget']['show_faces'] ) ? 'false' : 'true'; ?>" ' +
        'data-width="<?php echo $smp_extras['facebook_widget']['width']; ?>" ' +
        'data-height="<?php echo $smp_extras['facebook_widget']['height']; ?>" ' +
        'data-show-posts="<?php echo empty( $smp_extras['facebook_widget']['show_posts'] ) ? 'false' : 'true'; ?>">' +
        '<div class="fb-xfbml-parse-ignore">' +
        '<blockquote cite="<?php echo $smp_extras['facebook_widget']['url']; ?>">' +
        '<a href="<?php echo $smp_extras['facebook_widget']['url']; ?>">Facebook</a>' +
        '</blockquote>' +
        '</div>' +
        '</div>';

        $('body').prepend( html );
    });
</script>
<script type="text/javascript">
    $().ready(function(){
        $('#smp-fb-widget').each(function(){
            var self	= $(this),
                    img		= self.find('> img:first'),
                    box		= self.find('.fb-like-box:first'),
                    pos		= '<?php echo $smp_extras['facebook_widget']['position']; ?>',
                    width	= <?php echo (int) $smp_extras['facebook_widget']['width']+2; ?>,
            loader	= setInterval(function(){
                if( ! img.width() || ! img.height() )
                    return;

                clearInterval( loader );

                img.css('margin-left', pos == 'left' ? width-1 : - img.width());
                img.click(function(){
                    var opt = {};
                    opt[pos] = 0;

                    self.animate(opt, 500).unbind('mouseleave').bind('mouseleave', function(){
                        var opt = {};
                        opt[pos] = - width;
                        self.animate(opt,500);
                    });
                });
            },100);
        });
    });
</script>
<?php } ?>
<?php if( ! empty( $smp_extras ) && ! empty( $smp_extras['g_plus_widget']['enabled'] ) ) { ?>
<script type="text/javascript">
    $().ready(function(){
        window.___gcfg = {lang: '<?php echo $smp_config_language; ?>'};

        (function() {
            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
            po.src = 'https://apis.google.com/js/platform.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();
    });
</script>
<script type="text/javascript">
    $().ready(function(){
        var html =
                '<div ' +
                'id="smp-gplus-widget" ' +
                'style="background: #<?php echo $smp_extras['g_plus_widget']['colorscheme'] == 'dark' ? '000' : 'fff'; ?>; z-index: 999; position: fixed; display: block; top:<?php echo $smp_extras['g_plus_widget']['margin_top']; ?>px; <?php echo $smp_extras['g_plus_widget']['position'] == 'left' ? 'left' : 'right'; ?>:<?php echo - $smp_extras['g_plus_widget']['width']; ?>px;"' +
        '>' +
        '<img ' +
        'style="position: absolute; cursor: pointer;" ' +
        'src="<?php echo ! empty( $smp_extras['g_plus_widget']['image'] ) ? 'image/' . $smp_extras['g_plus_widget']['image'] : ( 'catalog/view/theme/default/smp/img/g_plus-' . $smp_extras['g_plus_widget']['position'] . '.png' ); ?>" ' +
        '/>' +
        '<div ' +
        'class="g-<?php echo empty( $smp_extras['g_plus_widget']['type_account'] ) ? 'person' : $smp_extras['g_plus_widget']['type_account']; ?>" ' +
        'data-width="<?php echo $smp_extras['g_plus_widget']['width']; ?>" ' +
        'data-height="<?php echo $smp_extras['g_plus_widget']['height']; ?>" ' +
        'data-href="<?php echo $smp_extras['g_plus_widget']['url']; ?>" ' +
        'data-theme="<?php echo $smp_extras['g_plus_widget']['colorscheme']; ?>" ' +
        ( '<?php echo $smp_extras['g_plus_widget']['layout']; ?>' == 'portrait' ? '' : 'data-layout="<?php echo $smp_extras['g_plus_widget']['layout']; ?>" ' ) +
                'data-rel="author">' +
        '</div>' +
        '</div>';

        $('body').prepend( html );
    });
</script>
<script type="text/javascript">
    $().ready(function(){
        $('#smp-gplus-widget').each(function(){
            var self	= $(this),
                    img		= self.find('> img:first'),
                    box		= self.find('.g-<?php echo empty( $smp_extras['g_plus_widget']['type_account'] ) ? 'person' : $smp_extras['g_plus_widget']['type_account']; ?>:first'),
            pos		= '<?php echo $smp_extras['g_plus_widget']['position']; ?>',
                    width	= <?php echo (int) $smp_extras['g_plus_widget']['width']; ?>,
            loader	= setInterval(function(){
                if( ! img.width() || ! img.height() )
                    return;

                clearInterval( loader );

                img.css('margin-left', pos == 'left' ? width : - img.width());
                img.click(function(){
                    var opt = {};
                    opt[pos] = 0;

                    self.animate(opt, 500).unbind('mouseleave').bind('mouseleave', function(){
                        var opt = {};
                        opt[pos] = - width;
                        self.animate(opt,500);
                    });
                });
            },100);
        });
    });
</script>
<?php } ?>
<?php echo (string) $__SMP_HREFLANG; ?>
</head>
<body class="<?php echo $class; ?>">
<div id="cartBox">
<div class="container">
	<div class="row">
		<div class="col-sm-12">
        <div class="closeCartBox">
        	<a href="javascript:void(0)"><img src="catalog/view/theme/radiance/image/radiance/close-button.png" alt="Close Cart Box"></a>
        </div>
        <?php echo $cart; ?>
        </div>
	</div>
</div>
</div>
<div id="searchBox">
<div class="container">
	<div class="row">
		<div class="col-sm-12"><?php echo $search; ?></div>
	</div>
</div>
</div>
<header>
<nav id="top">
  <div class="container">
  	<div class="row">
    	<div class="hidden-xs col-sm-5 col-md-4 col-lg-4 login-register-links">
        	<?php if($logged) { ?>
            <ul class="list-unstyled">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            </ul>
        	<?php } else { ?>
            <?php echo $text_login_register; ?>
            <?php } ?>
        </div>
        <div class="col-xs-5 col-sm-4 col-md-5 col-lg-6">
        	<ul class="list-unstyled currency-language">
        	<li style="float: left;"><?php echo $currency; ?></li>
            <li style="float: left;"><?php echo $language; ?></li>
            </ul>
        </div>
        <div class="col-xs-7 col-sm-3 col-md-3 col-lg-2">
        	<div class="search-cart">
        		<div class="search">
                	<a href="javascript:void(0)" class="toggleSearch"><i class="fa fa-search"></i></a>
                </div>
        		<div class="cart">
                	<a href="javascript:void(0)" class="toggleCart"><?php echo $cart_text; ?><span><?php echo $text_quantity_items; ?></span></a>
                </div>
        	</div>
        </div>
    </div>
  </div>
</nav>
<nav id="top-mobile">
	<?php if (count($languages) > 1) { ?>
   	<div class="language">
    	<a href="javascript:void(0)" class="visible-xs toggleLanguageSwitch">
        <?php foreach ($languages as $language) { ?>
        <?php if ($language['code'] == $code_lang) { ?>
        <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
        <?php } ?>
        <?php } ?>
        </a>
        <select id="languageSwitch" class="visible-xs">
        <?php foreach ($languages as $language) { ?>
        <?php if($language['code'] == $code_lang) { ?>
        <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
        <?php } ?>
        <?php } ?>
        </select>
    </div>
    <?php } ?>
    <?php if (count($currencies) > 1) { ?>
	<div class="currency">
    	<a href="javascript:void(0)" class="visible-xs toggleCurrencySwitch">
        	<?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
            <?php echo $currency['symbol_left']; ?>
            <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
            <?php echo $currency['symbol_right']; ?>
            <?php } ?>
            <?php } ?>
        </a>
        <select id="currencySwitch" class="visible-xs">
        <?php foreach ($currencies as $currency) { ?>
        <?php if($currency['code'] == $code) { ?>
        <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
        <?php } ?>
        <?php } ?>
        </select>
    </div>
    <?php } ?>
	<div class="search">
        <a href="javascript:void(0)" class="toggleSearch"><i class="fa fa-search"></i></a>
    </div>
	 <div class="cart">
        <a href="javascript:void(0)" class="toggleCart"><i class="fa fa-shopping-cart"></i></a>
    </div>
</nav>
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="hidden-sm hidden-xs col-md-9 col-lg-9">
      <?php if($categories) { ?>
      	  <nav id="menu" class="navbar">
            <div class="navbar-header"><span id="category" class="visible-xs visible-sm"><?php echo $text_category; ?></span>
              <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav">
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['children']) { ?>
                <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                  <div class="dropdown-menu">
                    <div class="dropdown-inner">
                      
                      <ul class="list-unstyled">
                      <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                        <?php foreach ($children as $child) { ?>
                        <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>
                      <?php } ?>
                      </ul>
                      
                    </div>
                    <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
                </li>
                <?php } else { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
                <?php } ?>
              </ul>
            </div>
          </nav>
      <?php } ?>
      </div>
    </div>
  </div>
  <nav id="menu-mobile">
	<div class="container">
    	<div class="navbar-header"><span id="category"><?php echo $text_category_mobile; ?></span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
        </div>
     </div>
     <div class="collapse navbar-collapse navbar-ex1-collapse">
     	<div class="container">
          <ul class="nav navbar-nav main-menu">
            <?php foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
            <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  
                  <ul class="list-unstyled">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <?php foreach ($children as $child) { ?>
                    <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                    <?php } ?>
                  <?php } ?>
                  </ul>
                  
                </div>
                <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
            </li>
            <?php } else { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
        </div>
          <ul class="nav navbar-nav account-menu">
              <li><a href="index.php?route=account/login"><?php echo $text_account_radiance; ?></a></li>
          </ul>
	</div>
  </nav>
</header>