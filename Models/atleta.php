<?php 
   include 'usuario.php';
   include 'dato_deportivo.php';
   include 'mejor_resultado.php';
  
   class Atleta extends Usuario {
      private $edad;
      private $sexo;
      private $peso;
      private $estatura;
      private $tallaCamisa;
      private $tipoSangre;
      private $alergias;
      private $operaciones;
      private $lesionesGraves;
      private $fracturas;
      private $datosDeportivos;
      private $mejorResultado = array();

      public function __construct(){
         // 
      }

      public function getEdad() {
         return $this->edad;
      }

      public function setEdad($edad) {
         $this->edad = $edad;
      }
      
      public function getSexo() {
         return $this->sexo;
      }

      public function setSexo($sexo) {
         $this->sexo = $sexo;
      }
      
      public function getPeso() {
         return $this->peso;
      }

      public function setPeso($peso) {
         $this->peso = $peso;
      }
      
      public function getEstatura() {
         return $this->estatura;
      }

      public function setEstatura($estatura) {
         $this->estatura = $estatura;
      }
      
      public function getTallaCamisa() {
         return $this->tallaCamisa;
      }

      public function setTallaCamisa($tallaCamisa) {
         $this->tallaCamisa = $tallaCamisa;
      }
      
      public function getTipoSangre() {
         return $this->tipoSangre;
      }

      public function setTipoSangre($tipoSangre) {
         $this->tipoSangre = $tipoSangre;
      }
      
      public function getAlergias() {
         return $this->alergias;
      }

      public function setAlergias($alergias) {
         $this->alergias = $alergias;
      }
      
      public function getOperaciones() {
         return $this->operaciones;
      }

      public function setOperaciones($operaciones) {
         $this->operaciones = $operaciones;
      }
      
      public function getLesionesGraves() {
         return $this->lesionesGraves;
      }

      public function setLesionesGraves($lesionesGraves) {
         $this->lesionesGraves = $lesionesGraves;
      }
      
      public function getFracturas() {
         return $this->fracturas;
      }

      public function setFracturas($fracturas) {
         $this->fracturas = $fracturas;
      }
      
      public function getDatosDeportivos() {
         return $this->datosDeportivos;
      }

      public function setDatosDeportivos($datosDeportivos) {
         $this->datosDeportivos = $datosDeportivos;
      }

      public function getMejorResultado() {
         return $this->mejorResultado;
      }

      public function setMejorResultado($mejorResultado) {
         $this->mejorResultado = $mejorResultado;
      }
   }
?>