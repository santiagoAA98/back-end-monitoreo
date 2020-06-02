<?php 
    include 'usuario.php';
    include 'entrenamiento.php';

    class Entrenador extends Usuario {
        private $entrenamieto;

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
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
        }
        
        public function crearEntrenador($entrenador) {
            include self::rutaConfig();
            self::crearSesionEntrenador($entrenador->usuario, $entrenador->clave);
            
            $conexion->query(" INSERT INTO entrenador (cedula_atleta, nombre, apellidos, 
                                                   telefono, correo, estado, usuario) 
                                          VALUE ('$atleta->cedula_entrenador', '$atleta->nombre', '$atleta->apellidos', 
                                                '$atleta->telefono', '$atleta->correo', 'activo', '$atleta->usuario') ");

            self::crearEntrenamientoEntrenador($entrenador);
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
        
        public function getEntrenamiento() {
            return $this->entrenamieto;
        }

        public function setEntrenamiento($entrenamieto) {
            $this->entrenamieto = $entrenamieto;
        }
    }
?>  