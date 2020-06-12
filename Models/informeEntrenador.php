<?php
    class InformeEntrenador {

        private $cedulaEntrenador;

        function __construct($cedulaEntrenador){
            $this->cedulaEntrenador =$cedulaEntrenador;
        }

        public function rutaConfig(){
            $path =  realpath(dirname(__FILE__) . '/..');
            return $path . "/Config/index.php";
        }

        public function generarInformeEntrenador(){

            $informe = array(
                'totalEventos' => self::eventosTotales(),
                'promedioMarcas' => round(self::promedioGeneral(), 2),
                'numeroEventosAnio' => self::numeroEventosAnioActual(),
                'numeroAtletas' => self::numeroAtletas(),
                'mejorMarca' => self::mejorMarca()
            );

            echo  json_encode($informe);
        }


        public function eventosTotales(){
            include self::rutaConfig();

            $sql = "SELECT count(*) 
                    FROM evento 
                    WHERE evento.cedula_entrenador = '$this->cedulaEntrenador' ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function promedioGeneral(){
            include self::rutaConfig();

            $sql = "SELECT avg(mejor_resultado.marca) 
                    FROM mejor_resultado 
                    INNER JOIN evento
                    WHERE evento.cedula_entrenador = '$this->cedulaEntrenador' ";

            $resultado = $conexion->query($sql);
            $fila = $resultado->fetch_array();
           
           return $fila['avg(mejor_resultado.marca)'];
        }

        public function numeroEventosAnioActual() {
            include self::rutaConfig(); 

            $anioActual = date("Y");

           $sql = "SELECT count(*) 
                   FROM evento 
                   WHERE evento.cedula_entrenador = '$this->cedulaEntrenador' AND  YEAR(evento.fecha) = '2020' ";

           $resultado = $conexion->query($sql);
           $fila = $resultado->fetch_array();
           
           return $fila['count(*)'];
        }

        public function numeroAtletas(){
           include self::rutaConfig(); 

           $sql = "SELECT count(*) 
                   FROM atleta 
                   WHERE atleta.cedula_entrenador = '$this->cedulaEntrenador' ";

           $resultado = $conexion->query($sql);
           $fila = $resultado->fetch_array();

           return $fila['count(*)'];
        }

        public function mejorMarca() {
            include self::rutaConfig();

            $sql = "SELECT MIN(mejor_resultado.marca), atleta.nombre 
                    FROM mejor_resultado
                    INNER JOIN atleta
                    ON mejor_resultado.cedula_atleta = atleta.cedula_atleta 
                    WHERE atleta.cedula_entrenador = '$this->cedulaEntrenador' ";

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