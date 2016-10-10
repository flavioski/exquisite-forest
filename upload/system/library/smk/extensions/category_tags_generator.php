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

class SeoMegaPack_CategoryTagsGenerator extends SeoMegaPack_AbstractCategoryGenerator {
	
	/**
	 * @var string
	 */
	protected $_name		= 'category_tags_generator';
	protected $_shortName	= 'ctg';
	
	/**
	 * @var string
	 */
	protected $_title		= 'Tags Generator';
	
	/**
	 * @var int
	 */
	protected $_sort		= 1.5;
	
	/**
	 * @var string 
	 */
	protected $_icon		= 'tags';
	
	/**
	 * @var string 
	 */
	protected $_fieldName	= 'tag';
	
	/**
	 * @var string 
	 */
	protected $_version		= '2';
	
	protected function parseGenerated( $generate ) {
		return $this->parseTagGenerated( $generate );
	}
	
	/**
	 * @return void
	 */
	public function install() {
		parent::install();
		
		$this->addColumn( 'tag', 'TEXT NOT NULL' );
		$this->addColumn( 'tag_ag', "ENUM('0','1') NOT NULL DEFAULT '0'" );
	}
	
	/**
	 * @return void 
	 */
	public function uninstall() {
		$this->removeColumn( 'tag_ag' );
		
		parent::uninstall();
	}
	
	/**
	 * @return string
	 */
	public function getParams() {
		$params = parent::getParams();
		
		if( $params === NULL )
			$params = '{name}, {parent_name}';
		
		return $params;
	}
}