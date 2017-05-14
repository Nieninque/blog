<?php 

if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/User.php';

class UserController {
    
    private $user;
    
    public function __construct() {
        $this->user = new User();
    }
    
    public function createUser($nickname, $password){
        $userFound = $this->user->getUserByNickname($nickname);
        if($userFound == null){
            $this->user->createUser(ucfirst(strtolower($nickname)), $password);
            $this->connect($nickname,$password);
        }else{
            throw new Exception("Le nom d'utilisateur existe déjà.");   
        }
    }
    
    public function connect($nickname, $password){
        $userConnect = $this->user->connection($nickname, $password);
        $_SESSION['userId'] = $userConnect['id'];
        $_SESSION['userNickname'] = $userConnect['nickname'];
    }
    
    public function disconnect(){
        $_SESSION = array(); 
        session_destroy();
    }
}
