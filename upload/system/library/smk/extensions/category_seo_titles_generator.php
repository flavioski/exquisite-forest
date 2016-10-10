<?php

/**
 * SEO Mega Pack
 * 
 * @author marsilea15 <marsilea15@gmail.com>
 */

if( class_exists( 'VQMod' ) ) {
    require_once VQMod::modCheck(modification(realpath(DIR_SYSTEM . 'library/smk/extensions/abstract_category_generator.php')));
} else {
    require_once modification(realpath(DIR_SYSTEM . 'library/smk/extensions/abstract_category_generator.php'));
}

class SeoMegaPack_CategorySeoTitlesGenerator extends SeoMegaPack_AbstractCategoryGenerator {
	
	/**
	 * @var array 
	 */
	protected $_tags			= array(
		'{name}'			=> 'name',
		'{parent_name}'		=> 'parent_name',
		'{sample_products}'	=> 'sample_products',
		'{total_products}'	=> 'total_products',
		'{site_name}'		=> 'site_name',
		'{site_title}'		=> 'site_title'
	);
	
	/**
	 * @var string
	 */
	protected $_name		= 'category_seo_titles_generator';
	protected $_shortName	= 'cstg';
	
	/**
	 * @var string
	 */
	protected $_title		= 'SEO Titles Generator';
	
	/**
	 * @var string 
	 */
	protected $_icon		= 'tower';
	
	/**
	 * @var string 
	 */
	protected $_fieldName	= 'meta_title';
	
	/**
	 * @var string 
	 */
	protected $_version		= '2';
	
	/**
	 * @var int
	 */
	protected $_sort		= 1.1;
	
	/**
	 * @return void
	 */
	public function install() {
		$this->addColumn( 'meta_title_ag', "ENUM('0','1') NOT NULL DEFAULT '0'" );
		
		parent::install();
	}
	
	/**
	 * @return void 
	 */
	public function uninstall() {
		$this->removeColumn( 'meta_title_ag' );
		
		parent::uninstall();
	}
	
	/**
	 * @return string
	 */
	public function getParams() {
		$params = parent::getParams();
		
		if( $params === NULL ) {
			$params = '{name}';
		}
		
		return $params;
	}
}