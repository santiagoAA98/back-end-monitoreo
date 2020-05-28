<?php 
    class Entrenamiento {
        private $lugar;
        private $hora;
        private $dias;

        public function getLugar() {
            return $this->lugar;
        }

        public function setLugar($lugar) {
            $this->lugar = $lugar;
        }

        public function getHora() {
            return $this->hora;
        }

        public function setHora($hora) {
            $this->hora = $hora;
        }

        public function getDias() {
            return $this->dias;
        }

        public function setDias($dias) {
            $this->dias = $dias;
        }
    }
?>