<?php

/**
 * SEO Mega Pack
 * 
 * @author marsilea15 <marsilea15@gmail.com>
 */

if( class_exists( 'VQMod' ) ) {
    require_once VQMod::modCheck(modification(realpath(DIR_SYSTEM . 'library/smk/extensions/abstract_product_generator.php')));
} else {
    require_once modification(realpath(DIR_SYSTEM . 'library/smk/extensions/abstract_product_generator.php'));
}

class SeoMegaPack_SeoTitleImagesGenerator extends SeoMegaPack_AbstractProductGenerator {
	
	/**
	 * @var array 
	 */
	protected $_tags			= array(
		'{product_name}'	=> 'product_name',
		'{category}'		=> 'category_name',
		'{model}'			=> 'model',
		'{brand}'			=> 'brand_name',
		'{sku}'				=> 'sku',
		'{upc}'				=> 'upc',
		'{site_name}'		=> 'site_name',
		'{site_title}'		=> 'site_title'
	);
	
	/**
	 * @var string
	 */
	protected $_name		= 'seo_title_images_generator';
	protected $_shortName	= 'stig';
	
	/**
	 * @var string
	 */
	protected $_title		= 'SEO Title Images Generator';
	
	/**
	 * @var int
	 */
	protected $_sort		= 0.61;
	
	/**
	 * @var string 
	 */
	protected $_icon		= 'picture';
	
	protected $_fieldName	= 'smp_title_images';
	
	/**
	 * @var string 
	 */
	protected $_version		= '2';
	
	/**
	 * @return int
	 */
	public function getParams() {
		$params = parent::getParams();
		
		if( $params === NULL )
			$params = '{product_name} {category}';
		
		return $params;
	}
	
	/**
	 * @return void
	 */
	public function install() {
		$this->addColumn( 'smp_title_images', 'VARCHAR(255) NULL DEFAULT NULL' );
		$this->addColumn( 'smp_title_images_ag', "ENUM('0','1') NOT NULL DEFAULT '0'" );
		
		parent::install();
	}
	
	/**
	 * @return void 
	 */
	public function uninstall() {
		$this->removeColumn( 'smp_title_images' );
		$this->removeColumn( 'smp_title_images_ag' );
		
		parent::uninstall();
	}
}