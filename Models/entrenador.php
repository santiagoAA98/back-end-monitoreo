<?php 
    include 'usuario.php';
    include 'entrenamiento.php';

    class Entrenador extends Usuario {
        private $entrenamieto;

        public function __construct(){
           // $this->entrenamieto = new Entrenamiento('hola');
        }
        
        public function getEntrenamiento() {
            return $this->entrenamieto;
        }

        public function setEntrenamiento($entrenamieto) {
            $this->entrenamieto = $entrenamieto;
        }
    }
?>