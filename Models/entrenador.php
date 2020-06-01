<?php 
    include 'usuario.php';
    include 'entrenamiento.php';

    class Entrenador extends Usuario {
        private $entrenamieto;

        public function consultarEntrenador(){
           
        }

        public function actualizaAtleta() {
         
        }
        
        public function crearAtleta() {
           
        }  
  
        public function eliminarAtleta() {
           
        }
        
        public function getEntrenamiento() {
            return $this->entrenamieto;
        }

        public function setEntrenamiento($entrenamieto) {
            $this->entrenamieto = $entrenamieto;
        }
    }
?>