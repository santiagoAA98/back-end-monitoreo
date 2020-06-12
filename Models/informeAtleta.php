<?php
    class InformeAtleta {

        private $cedulaAtleta;

        function __construct($cedulaAtleta){
            $this->cedulaAtleta =$cedulaAtleta;
        }

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }

        public function generarInformeEntrenador(){

            $informe = array(
                'totalEventos' => self::eventosTotalesProgramados(),
                'eventosRealizados' => self::eventosRealizados(),
                'eventosNoRealizados' => self::eventosNoRealizados(),
                'mejorMarca' => self::mejorMarca(),
                'pormedioMarcas' => round(self::promedioMarcas(), 2)
            );

            echo  json_encode($informe);
        }


        public function eventosTotalesProgramados(){
            include self::rutaConfig();

            $sql = "SELECT count(*) 
                    FROM mejor_resultado 
                    WHERE mejor_resultado.cedula_atleta = '$this->cedulaAtleta' ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function eventosRealizados(){
            include self::rutaConfig();

            $sql = "SELECT count(*) 
                    FROM mejor_resultado 
                    WHERE mejor_resultado.cedula_atleta = '$this->cedulaAtleta' AND mejor_resultado.marca IS NOT NULL ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function eventosNoRealizados(){
            include self::rutaConfig();

            $sql = "SELECT count(*) 
                    FROM mejor_resultado 
                    WHERE mejor_resultado.cedula_atleta = '$this->cedulaAtleta' AND mejor_resultado.marca IS NULL ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }


        public function mejorMarca(){
            include self::rutaConfig();

            $sql = "SELECT MIN(mejor_resultado.marca)
                    FROM mejor_resultado
                    WHERE mejor_resultado.marca IS NOT NULL AND mejor_resultado.cedula_atleta = '$this->cedulaAtleta' ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['MIN(mejor_resultado.marca)'];
        }

        public function promedioMarcas(){
            include self::rutaConfig();

            $sql = "SELECT avg(mejor_resultado.marca) 
                    FROM mejor_resultado 
                    WHERE mejor_resultado.cedula_atleta = '$this->cedulaAtleta' AND mejor_resultado.marca IS NOT NULL  ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['avg(mejor_resultado.marca)'];
        }

    }

?>