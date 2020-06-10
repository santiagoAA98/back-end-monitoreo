<?php 

    class Sesion {
        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }
         
        public function iniciarSesion($usuario, $clave) {
            include self::rutaConfig();
            
            $sqlSesion = "SELECT usuario, rol FROM sesion WHERE usuario = '$usuario' AND clave='$clave' ";
            $resultadoSesion = $conexion->query($sqlSesion);

            if (($fila = $resultadoSesion->fetch_array())==true) {
                $data = array(
                    'usuario' => $fila['usuario'],
                    'rol' => $fila['rol'],
                    'estado' => 'ok',
                );

                echo json_encode($data);
            } else {
                echo  json_encode(array('estado' => 'error'));
            }
        }
    }
?>