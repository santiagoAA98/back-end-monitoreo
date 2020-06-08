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
                                                   '$evento->hora', '$evento->cedulaEntrenador') ");
            $idEvento = mysqli_insert_id($conexion);
            self::agregarAtletasEvento($evento->atletas, $idEvento);
            echo  json_encode(array('estado' => 'ok'));
        }

        public function agregarAtletasEvento($cedulaAtletas, $idEvento) {
            include self::rutaConfig();
            
            foreach($cedulaAtletas as $cedula) {
                $conexion->query(" INSERT INTO mejor_resultado (cedula_atleta, id_evento) 
                                                        VALUE ('$cedula', '$idEvento') ");
            }
        }
    }
?>
