<?php 
    include '../Config/autoload/autoload.php';

    $json = file_get_contents('php://input');
    $params = json_decode($json);

    $evento = new Evento();
    $evento->crearEvento($params);

?>