<?php

      $conexion = new mysqli("localhost","root", "", "monitoreo-atleta");

      if ($conexion->connect_errno) {
        echo "Fallo a la conexion" . $conexion->connect_errno;//mensaje adviritendo el fallo y el porque.
      }

      $conexion->set_charset("utf8");
?>