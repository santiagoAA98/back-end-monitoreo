<?php 
    class Evento {

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }


        public function crearEvento($evento) {
            include self::rutaConfig();

            $conexion->query(" INSERT INTO evento (lugar, requisitos, fecha, 
                                                   hora, cedula_entrenador) 
                                            VALUE ('$evento->lugar', '$evento->requisitos', '$evento->fecha', 
                                                   '$evento->hora', '$evemto->cedula_entrenador') ");
        }
    }
?>