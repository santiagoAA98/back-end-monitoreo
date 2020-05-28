<?php 
    include 'evento.php';

    class MejorResultado {
        private $marca;
        private $evento;

        public function __construct(){
            // 
         }
   
        public function getMarca() {
            return $this->marca;
        }
   
        public function setMarca($marca) {
            $this->marca = $marca;
        }
        
        public function getEvento() {
            return $this->evento;
        }
   
        public function setEvento($evento) {
            $this->evento = $evento;
        }
    }
?>