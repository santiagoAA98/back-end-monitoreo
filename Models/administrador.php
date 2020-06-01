<?php
    include 'usuario.php';

    class Administrador extends Usuario {

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }
   
         public function consultarAdministrador($cedulaAdministrador){
            include self::rutaConfig();
   
            $sqlAdministrador = "SELECT * FROM administrador WHERE cedula = '$cedulaAdministrador' ";
            $resultadoAdministrador = $conexion->query($sqlAdministrador);
   
            if (($fila = $resultadoAdministrador->fetch_array())==true) { 
               $administrador = self::almacenarInfoAdministrador($fila);
               echo json_encode($administrador);
            }
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