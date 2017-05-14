<?php 
if (!isset($_SESSION)){
  session_start();
}

abstract class Model {

    private $db;
    
    //connexion à la BDD avec PHP Data Object
    private function getBdd() {
        if ($this->db == null) {
            $this->db = new PDO('mysql:host=localhost;dbname=blog;charset=utf8',
                    'formation', 'afpagen',
                    array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        }
        return $this->db;
    }
    
    //préparation de l'utilisation des requetes via l'objet PDO
    protected function executeSql($sql, $params = null) {
        if ($params == null) {
            $result = $this->getBdd()->query($sql); 
        }
        else {
            $result = $this->getBdd()->prepare($sql);  
            $result->execute($params);
        }
        return $result;
    }

   

}