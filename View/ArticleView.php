<?php 

if (!isset($_SESSION)){
  session_start();
}

$this->title = "Le blog de test - " . $article['title']; ?>

<article>
    <?php if($_SESSION['userNickname'] == $article['nickname']){ ?>
    <form action="index.php?action=delete" method="post">
        <input type="submit" value="supprimer l'article"/>
    <input type="hidden" name="id" value="<?= $article['id'] ?>" />
    </form>
    <?php } ?>
    <header>
        <h1 class="articleTitle"><?= $article['title'] ?></h1>
        <p><?= $article['category'] ?></p>
        <p>Posté par <?= $article['nickname'] ?> le <time><?= $article['date'] ?></time></p>
    </header>
    <p><?= $article['content'] ?></p>
</article>
<hr />
<header>
    <h1 id="commentTitle">Commentaires de <?= $article['title'] ?></h1>
</header>
<?php foreach ($comments as $comment): ?>
    <p><?= $comment['author'] ?> a dit le :</p>
    <p><?= $comment['date']?> :</p>
    <p><?= $comment['content'] ?></p>
<?php endforeach; ?>
<hr />
<?php if($_SESSION != null && $_SESSION['userId'] != null){ ?>
<form method="post" action="index.php?action=comment" >
    <textarea id="textComment" name="content" rows="8" 
              placeholder="Votre commentaire" required></textarea><br />
    <input type="hidden" name="id" value="<?= $article['id'] ?>" />
    <input type="submit" value="comment" />
</form>
<?php }else{ ?>
<p> Vous devez être connecté pour poster un commentaire</p><?php } ?>

