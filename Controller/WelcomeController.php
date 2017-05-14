<?php 
if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Article.php';
require_once 'View/View.php';
require_once 'Model/Category.php';

class WelcomeController {

    private $article;
    private $category;

    public function __construct() {
        $this->article = new Article();
        $this->category = new Category();
    }

// Affiche la liste de tous les billets du blog
    public function accueil() {
        $cateries = $this->category->getCategories();
        $articles = $this->article->getArticles();
        $view = new View("WelcomeView");
        $view->generate(array('articles' => $articles, 'categories' => $cateries));
    }
    public function accueilFull() {
        $cateries = $this->category->getCategories();
          $articles = $this->article->getAllArticles();
        $view = new View("WelcomeView");
        $view->generate(array('articles' => $articles, 'categories' => $cateries));
    
    }
    public function acceuilByCategory($categoryId){
        $cateries = $this->category->getCategories();
        $articles = $this->article->getArticlesByCategory($categoryId);
        $view = new View("WelcomeView");
        $view->generate(array('articles'=> $articles, 'categories' => $cateries));
    }

}
