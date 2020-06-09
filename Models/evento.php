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

        public function consultarEventosDisponibles($cedulaAtleta) {
            include self::rutaConfig();

            $sqlEvento = "SELECT atleta.cedula_atleta, atleta.nombre, evento.id_evento, evento.lugar, evento.requisitos, evento.fecha, evento.hora 
                          FROM atleta
                          INNER JOIN mejor_resultado
                          ON mejor_resultado.cedula_atleta = atleta.cedula_atleta
                          INNER JOIN evento
                          ON evento.id_evento = mejor_resultado.id_evento
                          WHERE atleta.cedula_atleta = '$cedulaAtleta' AND mejor_resultado.marca IS NULL ";

            $resultadoEventos = $conexion->query($sqlEvento);

            $eventos = array();

            while(($fila = $resultadoEventos->fetch_array())) {
                $evento = self::almacenarEventos($fila);
                array_push($eventos, $evento);
            }

            echo json_encode($eventos);
        }

        public function agregarResultado($evento) {
            include self::rutaConfig();
            
            $conexion->query(" UPDATE mejor_resultado SET
                               `marca` = '$evento->marca' 
                               WHERE id_evento = '$evento->idEvento' AND cedula_atleta = '$evento->cedulaAtleta' ");

            echo  json_encode(array('estado' => mysqli_error($conexion)));
        }

        public function almacenarEventos($info) {
            $data = array(
               'idEvento' => $info['id_evento'],
               'cedulaAtleta' => $info['cedula_atleta'],
               'nombreAtleta' => $info['nombre'],
               'lugar' => $info['lugar'],
               'requisitos' => $info['requisitos'],
               'fecha' => $info['fecha'],
               'hora' => $info['hora'],
            );
   
            return $data;
         }
    }
?>
