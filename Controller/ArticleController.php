<?php 
if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Article.php';
require_once 'Model/Comment.php';
require_once 'Model/Category.php';
require_once 'View/View.php';

class ArticleController {

    private $article;
    private $comment;
    private $category;

    public function __construct() {
        $this->article = new Article();
        $this->comment = new Comment();
        $this->category = new Category();
    }

    // Affiche la vue d'un article particulier
    public function article($idArticle) {
        $article = $this->article->getArticle($idArticle);
        $comments = $this->comment->getComments($idArticle);
        $vue = new View("ArticleView");
        $vue->generate(array('article' => $article, 'comments' => $comments));
    }

    // Ajoute un commentaire
    public function addAComment($content, $idArticle) {
        $author = $_SESSION['userId'];
        $this->comment->addComment($content, $author, $idArticle);
        $this->article($idArticle);
    }
    
    public function viewCreatePost(){
        $view = new View("CreateArticleView");
        $view->generate(array('categories' => $this->category->getCategories()));
    }

     public function addAnArticle($title, $content, $category) {
        $author = $_SESSION['userId'];
        $this->article->createArticle($author, $title, $content, $category);
    }
    
    public function deleteAnArticle($idArticle){
        $this->article->deleteArticle($idArticle);
    }
}