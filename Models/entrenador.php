<?php 
    class Entrenador {
        private $entrenamieto;

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }

        public function getCedulasEntrenadores() {
            include self::rutaConfig();
   
            $sqlEntrenador = "SELECT cedula_entrenador FROM entrenador ";
            $resultadoEntrenadores = $conexion->query($sqlEntrenador);
   
            $cedulasEntrenadores = array();
   
            while(($fila = $resultadoEntrenadores->fetch_array())) {
               array_push($cedulasEntrenadores, $fila['cedula_entrenador']);
            }
   
            echo json_encode($cedulasEntrenadores);
        }

        public function consultarEntrenador($usuario){
            include self::rutaConfig();

            $sqlEntrenador = "SELECT * FROM entrenador WHERE usuario = '$usuario' ";
            $resultadoEntrenador = $conexion->query($sqlEntrenador);
   
            if (($fila = $resultadoEntrenador->fetch_array())==true) { 
               $entrenador = self::almacenarInfoEntrenador($fila);
               echo json_encode($entrenador);
            }
        }

        public function actualizaEntrenador($entrenador) {
            include self::rutaConfig();

            $conexion->query(" UPDATE entrenador SET  `nombre` = '$entrenador->nombre', `apellidos` = '$entrenador->apellidos', 
                                                      `telefono` = '$entrenador->telefono', `correo` = '$entrenador->correo' 
                                                 WHERE cedula_entrenador = '$entrenador->cedula' ");    
                                                 
            echo  json_encode(array('estado' => 'ok'));
        }
        
        public function crearEntrenador($entrenador) {
            include self::rutaConfig();
            self::crearSesionEntrenador($entrenador->usuario, $entrenador->clave);
            
            $conexion->query(" INSERT INTO entrenador (cedula_entrenador, nombre, apellidos, 
                                                   telefono, correo, estado, usuario) 
                                          VALUE ('$entrenador->cedula_entrenador', '$entrenador->nombre', '$entrenador->apellidos', 
                                                '$entrenador->telefono', '$entrenador->correo', 'activo', '$entrenador->usuario') ");
            self::crearEntrenamientoEntrenador($entrenador);
            echo  json_encode(array('estado' => 'ok'));
        }  

        public function crearSesionEntrenador($usuarioSesion, $claveSesion) {
            include self::rutaConfig();

            $conexion->query(" INSERT INTO sesion (usuario, clave, rol) 
                                         VALUE ('$usuarioSesion', '$claveSesion', 'entrenador' ) ");
        }

        public function crearEntrenamientoEntrenador($entrenamiento) {
            include self::rutaConfig();

            $conexion->query(" INSERT INTO entrenamiento (lugar, hora, dias, 
                                                    cedula_entrenador) 
                                         VALUE ('$entrenamiento->lugar', '$entrenamiento->hora', '$entrenamiento->dias', 
                                                    '$entrenamiento->cedula_entrenador') ");
        }
  
        public function eliminarEntrenador($cedula_entrenador) {
            include self::rutaConfig();

            $conexion->query(" UPDATE entrenador SET `estado` = 'eliminado' WHERE cedula_entrenador = '$cedula_entrenador' ");
            echo  json_encode(array('estado' => 'ok'));
        }

        public function almacenarInfoEntrenador($info) {
            $data = array(
               'cedula' => $info['cedula_entrenador'],
               'nombre' => $info['nombre'],
               'apellidos' => $info['apellidos'],
               'telefono' => $info['telefono'],
               'correo' => $info['correo'],
            );
   
            return $data;
         }
        
    }
?>  