<?php 
    include '../Config/autoload/autoload.php';

    $json = file_get_contents('php://input');
    $params = json_decode($json);

    $atleta = new Atleta();
    $atleta->eliminarAtleta($params->cedula_atleta);
?>