<?php 

if (!isset($_SESSION)){
  session_start();
}
?>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8" />
        <link rel="stylesheet" href="View/style.css" type="text/css"/>
        <script type="text/javascript" src="View/main.js"></script>
        <title><?= $title ?></title>
    </head>
    <body>
        
        <script type="text/javascript" src="http://bpmaker.giffy.me/userdata/user/51/51131/21/parts.js"></script>
        <script type="text/javascript" src="http://bpmaker.giffy.me/userdata/user/56/56874/23/parts.js"></script>
        <div class="global">
            <header>
                <div class="banner">
                    <a href="index.php"><h1 id="titreBlog">Mon Blog</h1></a>
                    <p class="pres">Bienvenue sur ce blog de test !</p>
                    <?php if($_SESSION == null || $_SESSION['userId'] == null){ ?><form action="index.php?action=connect" method="post">
                        <input type="text" name="nickname" placeholder="pseudo"/>
                        <input type="password" name="password" placeholder="password"/>
                        <input type="submit" name="inConnect" value="Connexion"/>
                        <input type="submit" name="create" value="Nouveau compte" />
                    </form> 
                    <?php }else{ echo "<p>Bonjour ".$_SESSION['userNickname'];?>
                    <form action="index.php?action=disconnect" method="post">
                        <input type="submit" value="Disconnect" />
                    </form>
                    </p>
                        <?php } ?>
                </div>
            </header>
                <div class="content">
                    
            <section>
                  
                <div class="row">
                <?= $content ?>
                </div> <!-- #contenu -->
            </section>
                    
        </div>    
            <footer class="foter">
                <script src="http://bpmaker.giffy.me/userdata/user/25/25387/1182/parts.js" type="text/javascript"></script>
                Blog réalisé avec PHP5.6 et CSS3.
            </footer>
        </div> <!-- row -->
    </body>
</html>