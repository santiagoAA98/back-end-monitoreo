<?php 
    include '../Config/autoload/autoload.php';

    $json = file_get_contents('php://input');
    $params = json_decode($json);
    	
    $administrador = new Administrador();
    $administrador->consultarAdministrador($params);
?>