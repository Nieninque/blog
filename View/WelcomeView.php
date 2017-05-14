<?php 
if (!isset($_SESSION)){
  session_start();
}

$this->titre = "Mon Blog"; 
if($_SESSION != null && $_SESSION['userId'] != null){?>
<form action="index.php?action=createArticle" method="post">
    <input type="submit" value="Create Your Post" />
</form>
    <?php } ?><br/>
<form action="index.php?action=displayByCategory" method="post" id="formCategory">
            <label>Afficher par catégorie : </label>
        <select name="category" id="byCategory">
        <?php
        foreach ($categories as $category) {
            ?>
            <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
        <?php
        }?>
        </select>
                  </form><br/>
<?php
foreach ($articles as $article):
    ?>
    <article>
        <header>
            <a href="<?= "index.php?action=article&id=" . $article['id'] ?>">
                <h1 class="titreBillet"><?= $article['title'] ?></h1>
            </a>
            <p><?= $article['category'] ?></p>
            <p>Posté par <?= $article['nickname'] ?> le <time><?= $article['date'] ?></time></p>
        </header>
      
        <p><?= $article['content'] ?></p>
    </article>
<?php endforeach; ?>
<form method="post" action="index.php?action=fullDisplay">
    <input type="submit" value="afficher tous les articles"/>
</form>
