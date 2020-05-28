<?php 
   class Usuario {
      private $cedula;
      private $nombre;
      private $apellidos;
      private $telefono;
      private $correo;

      public function getCedula() {
         return $this->cedula;
     }

     public function setCedula($cedula) {
         $this->cedula = $cedula;
     }
     
     public function getNombre() {
         return $this->nombre;
     }

     public function setNombre($nombre) {
         $this->nombre = $nombre;
     }

     public function getApellidos() {
         return $this->apellidos;
     }

     public function setApellidos($apellidos) {
         $this->apellidos = $apellidos;
     }

     public function getTelefono() {
         return $this->telefono;
     }

     public function setTelefono($telefono) {
         $this->telefono = $telefono;
     }

     public function getCorreo() {
         return $this->correo;
     }

     public function setCorreo($correo) {
         $this->correo = $correo;
     }
   }
?>