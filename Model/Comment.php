<?php 

if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Model.php';

class Comment extends Model {

    // récupérer les commentaires d'un article
    public function getComments($idArticle) {
        $sql = 'SELECT comments.id, comments.content, comments.post_id, '
                . 'comments.date, users.nickname AS author FROM comments '
                . 'INNER JOIN users ON author_id = users.id WHERE comments.post_id=?';
        $comments = $this->executeSql($sql, array($idArticle));
        return $comments;
    }

    // ajouter un commentaire en base
    public function addComment($content, $idAuthor, $idArticle) {
       
        $sql = 'INSERT INTO comments(content, author_id, post_id, date)'
            . ' values(?, ?, ?, SYSDATE())';  
        $test=$this->executeSql($sql, array($content, $idAuthor, $idArticle));
       if($test->rowCount() >0){   
           return;
        }else{
       throw new Exception("erreur lors de la création du commentaire");
       }
        
       }
}