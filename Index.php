<?php 
if (!isset($_SESSION)){
  session_start();
}
        

require 'Controller/Router.php';

$router = new Router();
$router->routerRequete();