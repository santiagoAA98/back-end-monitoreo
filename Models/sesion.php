<?php 

    class Sesion {
        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }
         
        public function iniciarSesion($usuario, $clave) {
            include self::rutaConfig();
            
            $sqlSesion = "SELECT sesion.usuario, sesion.rol 
                          FROM sesion
                          WHERE sesion.usuario = '$usuario' AND sesion.clave='$clave'";

            $resultadoSesion = $conexion->query($sqlSesion);

            if (($fila = $resultadoSesion->fetch_array())==true) {

                $verificarEstado = false;

                if($fila['rol'] === 'administrador') {
                    $verificarEstado = true;
                } else if ($fila['rol'] === 'entrenador') {
                    $sqlPerfil = " SELECT *
                                   FROM entrenador
                                   WHERE entrenador.usuario = '$usuario' AND entrenador.estado = 'activo' ";

                    $resultadoPerfil = $conexion->query($sqlPerfil);

                    if (($perfil = $resultadoPerfil->fetch_array())==true) {
                        $verificarEstado = true;
                    }
                } else if ($fila['rol'] === 'atleta') {
                    $sqlPerfil = " SELECT *
                                   FROM atleta
                                   WHERE atleta.usuario = '$usuario' AND atleta.estado = 'activo' ";

                    $resultadoPerfil = $conexion->query($sqlPerfil);

                    if (($perfil = $resultadoPerfil->fetch_array())==true) {
                        $verificarEstado = true;
                    }
                }

                if($verificarEstado) {
                    $data = array(
                        'usuario' => $fila['usuario'],
                        'rol' => $fila['rol'],
                        'estado' => 'ok',
                    );
    
                    echo json_encode($data);
                } else {
                    echo  json_encode(array('estado' => 'error'));
                }
            } else {
                echo  json_encode(array('estado' => 'error'));
            }
        }
    }
?>