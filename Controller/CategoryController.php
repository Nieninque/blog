<?php

if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Category.php';

/**
 * Description of CategoryController
 *
 * @author Murlockus
 */
class CategoryController {
    
    private $category;
    
    public function __construct() {
        $this->category = new Category();
    }
    
    public function getCategories(){
        return $this->category->getCategories();
    }
}
