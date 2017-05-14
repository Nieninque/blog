<?php 
if (!isset($_SESSION)){
  session_start();
}

require_once 'Controller/WelcomeController.php';
require_once 'Controller/ArticleController.php';
require_once 'Controller/UserController.php';
require_once 'View/View.php';
class Router {

    private $welcomeController;
    private $articleController;
    private $userController;

    public function __construct() {
        $this->welcomeController = new WelcomeController();
        $this->articleController = new ArticleController();
        $this->userController = new UserController();
    }

    // Route une requête entrante : exécution l'action associée
    public function routerRequete() {
        try {
            if (isset($_GET['action'])) {
                if ($_GET['action'] == 'article') {
                    $idArticle = intval($this->getParametre($_GET, 'id'));
                    if ($idArticle != 0) {
                        $this->articleController->article($idArticle);
                    }
                    else
                        throw new Exception("identifiant d'article non valide");
                }
                else if ($_GET['action'] == 'comment') {
                    $content = $this->getParametre($_POST, 'content');
                    $idArticle = $this->getParametre($_POST, 'id');
                    $this->articleController->addAComment($content, $idArticle);
                    $_POST=[];
                    $this->articleController->article($idArticle);
                }
                else if ($_GET['action'] == 'connect') {
                    $nickname = $this->getParametre($_POST, 'nickname');
                    $password = $this->getParametre($_POST, 'password');
                    if(isset($_POST['inConnect'])){
                        $this->userController->connect($nickname, $password);
                    }else if(isset($_POST['create'])){
                         $this->userController->createUser($nickname, $password);
                    }
                    $this->welcomeController->accueil();
                }
                else if ($_GET['action'] == 'disconnect'){
                    $this->userController->disconnect();
                    $this->welcomeController->accueil();
                }
                else if ($_GET['action'] == 'createArticle'){
                    $this->articleController->viewCreatePost();
                }
                else if ($_GET['action'] == 'create'){
                    $title = $this->getParametre($_POST, 'titleArticle');
                    $content = $this->getParametre($_POST, 'contentArticle');
                    $category = $this->getParametre($_POST, 'category'); 
                   $this->articleController->addAnArticle($title, $content, $category);
                   $this->welcomeController->accueil();
                }
                else if($_GET['action'] == 'fullDisplay'){
                    $this->welcomeController->accueilFull();
                }
                else if($_GET['action'] == 'displayByCategory'){
                    $category = $this->getParametre($_POST, 'category'); 
                    $this->welcomeController->acceuilByCategory($category);
                }
                else if($_GET['action'] == 'delete'){
                    $articleId = $this->getParametre($_POST, 'id');
                    $this->articleController->deleteAnArticle($articleId);
                    $this->welcomeController->accueil();
                }
                else
                    throw new Exception("Action non valide");
            }
           
            else {  // aucune action définie : affichage de l'accueil
                $this->welcomeController->accueil();
            }
        }
        catch (Exception $e) {
           $message = $e->getMessage();
           echo '<script type="text/javascript">window.alert("'.$message.'");</script>';
           $this->welcomeController->accueil();
        }
    }


    // Recherche un paramètre dans un tableau
    private function getParametre($tableau, $nom) {
        if (isset($tableau[$nom])) {
            return $tableau[$nom];
        }
        else
            throw new Exception("Paramètre '$nom' absent");
    }

}