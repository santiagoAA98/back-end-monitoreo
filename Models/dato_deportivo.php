<?php 
    class DatoDeportivo {
        private $especialidades;
        private $anioActivo;
        private $prueba;

        public function getEspecialidades() {
            return $this->especialidades;
        }
   
        public function setEspecialidades($especialidades) {
            $this->especialidades = $especialidades;
        }
        
        public function getAnioactivo() {
            return $this->anioActivo;
        }
   
        public function setAnioActivo($anioActivo) {
            $this->anioActivo = $anioActivo;
        }
        
        public function getPrueba() {
            return $this->prueba;
        }
   
        public function setPrueba($prueba) {
            $this->prueba = $prueba;
        }
    }
?>
