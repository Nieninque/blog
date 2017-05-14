<?php

if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Model.php';

class Category extends Model {
    
    /**
     * Permet de récupérer les différentes catégories
     * @return type : @Category
     */
    public function getCategories(){
        $sql = 'SELECT * FROM categories';
        $categories = $this->executeSql($sql);
        return $categories;
    }
}
