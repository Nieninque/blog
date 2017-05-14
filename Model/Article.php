<?php 
if (!isset($_SESSION)){
  session_start();
}

require_once 'Model/Model.php';


class Article extends Model {

   //va chercher tous les résumés d'articles par date
    public function getArticles() {
        $sql = 'SELECT posts.id, title, SUBSTRING(content, 1, 50) AS content,'
                . ' date, users.nickname, categories.name AS category FROM '
                . 'posts INNER JOIN users ON '
                . 'author_id = users.id INNER JOIN categories ON category_id'
                . '= categories.id  ORDER BY date DESC LIMIT 5';
        $articles = $this->executeSql($sql);
        return $articles;
    }
    public function getAllArticles() {
        $sql = 'SELECT posts.id, title, SUBSTRING(content, 1, 50) AS content, '
                . 'date, users.nickname, categories.name AS category FROM '
                . 'posts INNER JOIN users ON '
                . 'author_id = users.id INNER JOIN categories ON category_id'
                . ' = categories.id  ORDER BY date DESC';
        $articles = $this->executeSql($sql);
        return $articles;
    }

    //va chercher la totalité des infos d'un article 
    public function getArticle($idArticle) {
        $sql = 'SELECT posts.id, posts.title, users.nickname, posts.date, '
                . 'posts.content, categories.name AS category FROM posts INNER'
                . ' JOIN users ON '
                . 'author_id = users.id INNER JOIN categories ON category_id '
                . '= categories.id '
                . 'WHERE posts.id=?';
        $article = $this->executeSql($sql, array($idArticle));
        if ($article->rowCount() > 0){
            return $article->fetch();  // Accès à la première ligne de résultat
        }else{
            throw new Exception("Aucun article ne correspond à l'identifiant"
                    . " '$idArticle'");
        }}

    public function createArticle($authorId, $title, $content, $categoryId){
        $sql='INSERT INTO posts (author_id, title, content, category_id, date)'
                . ' VALUES (?,?,?,?,SYSDATE())';
        $this->executeSql($sql, array($authorId, $title, $content, $categoryId));
    }
    
    public function getArticlesByCategory($category){
        $sql = 'SELECT posts.id, title, SUBSTRING(content, 1, 50) AS content, '
                . 'date, users.nickname, categories.name AS category FROM posts '
                . 'INNER JOIN users ON '
                . 'author_id = users.id INNER JOIN categories ON category_id '
                . '= categories.id WHERE categories.id=? ORDER BY date DESC';
        $article = $this->executeSql($sql, array($category));
            return $article;  // Accès à la première ligne de résultat
    }
    
    public function deleteArticle($idArticle){
        $sql1 = 'DELETE FROM comments WHERE post_id=?';
        $sql2 = 'DELETE FROM posts WHERE id=?';
        $this->executeSql($sql1, array($idArticle));
        $this->executeSql($sql2, array($idArticle));
    }
}