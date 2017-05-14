<?php 

if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Model.php';


class User extends Model {

    //va chercher la totalité des infos d'un utilisateur
    public function getUser($idUser) {
        $sql = 'SELECT * FROM users WHERE id=?';
        $user = $this->executeSql($sql, array($idUser));
        if ($user->rowCount() > 0)
            return $user->fetch();  // Accès à la première ligne de résultat
        else
            throw new Exception("Aucun utilisateur ne correspond à l'identifiant '$idArticle'");
    }
    
    public function getUserByNickname($nickname) {
        $sql = 'SELECT * FROM users WHERE LOWER(nickname)=LOWER(?)';
        $user = $this->executeSql($sql, array($nickname));
        if ($user->rowCount() > 0)
            return $user->fetch();  // Accès à la première ligne de résultat
        else
            return null;
    }
    
    public function createUser($nickname, $password){
        $sql = 'INSERT INTO users (nickname, password) VALUES (?,MD5(?))';
        $this->executeSql($sql, array($nickname, $password));
    }
    
    public function connection($nickname, $password){
        $sql = 'SELECT id, nickname FROM users WHERE LOWER(nickname)=LOWER(?) AND password=MD5(?)';
        $con = $this->executeSql($sql, array($nickname, $password));
        if($con->rowCount()>0){
            return $con->fetch();
        }else{
            throw new Exception("identifiant et/ou mot de passe incorrect(s)");
        }
    }
}