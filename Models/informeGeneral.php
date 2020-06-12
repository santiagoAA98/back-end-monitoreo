<?php 
    class InformeGeneral {
        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }

        public function generarInformeGeneral(){

            $informe = array(
                'totalEventos' => self::eventosTotales(),
                'promedioMarcas' => round(self::promedioGeneral(), 2),
                'numeroEventosAnio' => self::numeroEventosAnioActual(),
                'numeroAtletas' => self::numeroAtletas(),
                'numeroEntrenadores' => self::numeroEntrenadores(),
                'mejorMarca' => self::mejorMarca()
            );

            echo  json_encode($informe);
        }

        public function eventosTotales(){
            include self::rutaConfig();

            $sql = "SELECT count(*) FROM evento";
            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function promedioGeneral(){
            include self::rutaConfig();

            $sql = "SELECT avg(mejor_resultado.marca) FROM mejor_resultado ";
            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['avg(mejor_resultado.marca)'];
        }

        public function numeroEventosAnioActual() {
            include self::rutaConfig(); 

            $anioActual = date("Y");

           $sql = "SELECT count(*) FROM evento WHERE  YEAR(evento.fecha) = '$anioActual' ";
           $resultado = $conexion->query($sql);
           $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function numeroAtletas(){
           include self::rutaConfig(); 

           $sql = "SELECT count(*) FROM atleta ";
           $resultado = $conexion->query($sql);
           $fila = $resultado->fetch_array();

           return $fila['count(*)'];
        }

        public function numeroEntrenadores(){
            include self::rutaConfig();

            $sql = "SELECT count(*) FROM entrenador ";
            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function mejorMarca() {
            include self::rutaConfig();

            $sql = "SELECT MIN(mejor_resultado.marca) ,atleta.nombre 
                    FROM mejor_resultado
                    INNER JOIN atleta
                    ON mejor_resultado.cedula_atleta = atleta.cedula_atleta
                    WHERE mejor_resultado.marca IS NOT NULL
                    GROUP BY mejor_resultado.marca  
                    ORDER BY mejor_resultado.marca  ASC ";

            $resultado = $conexion->query($sql);

            if (($fila = $resultado->fetch_array())==true) { 
                $data = array(
                    'nombreAtleta' => $fila['nombre'],
                    'marca' => $fila['MIN(mejor_resultado.marca)']
                );
             }
           
           return $data;
        }
    }
?>