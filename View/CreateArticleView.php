<?php

if (!isset($_SESSION)){
  session_start();
}
$this->title = "Le blog de test - Création d'un article";
?>

<form action="index.php?action=create" method="post" class="formArticle">
    <label>Nouvel article</label><br/>
    <input type="text" name="titleArticle" />
    <select name="category">
        <?php
        foreach ($categories as $category) {
            ?>
            <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
        <?php
        }?>
    </select>
    <br/><br/>
    <textArea name="contentArticle" cols="100" rows="25"></textarea>
    <input type="submit" value="Valider"/>
</form>