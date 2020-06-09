<?php
    class Administrador {

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }
   
         public function consultarAdministrador(){
            include self::rutaConfig();
   
            $sqlAdministrador = "SELECT * FROM administrador ";
            $resultadoAdministrador = $conexion->query($sqlAdministrador);
   
            if (($fila = $resultadoAdministrador->fetch_array())==true) { 
               $administrador = self::almacenarInfoAdministrador($fila);
               echo json_encode($administrador);
            }
         }

         public function actualizarAdministrador($administrador) {
            include self::rutaConfig();

            $conexion->query(" UPDATE administrador SET  `nombre` = '$administrador->nombre', `apellidos` = '$administrador->apellidos', 
                                                         `telefono` = '$administrador->telefono', `correo` = '$administrador->correo' 
                                                          WHERE cedula = '$administrador->cedula' ");
         }
   
         public function almacenarInfoAdministrador($info) {
            $data = array(
               'cedula' => $info['cedula'],
               'nombre' => $info['nombre'],
               'apellidos' => $info['apellidos'],
               'telefono' => $info['telefono'],
               'correo' => $info['correo'],
            );
   
            return $data;
         }
   
    }
?>