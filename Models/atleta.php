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

      public function rutaConfig(){
         $path =  realpath(dirname(__FILE__) . '/..');
         return $path . "/Config/index.php";
     }

      public function consultarAtleta($usuario){
         include self::rutaConfig();

         $sqlAtleta = "SELECT * FROM atleta WHERE usuario = '$usuario' ";
         $resultadoAtleta = $conexion->query($sqlAtleta);

         if (($fila = $resultadoAtleta->fetch_array())==true) { 
            $atletas = self::almacenarInfoAtleta($fila);
            echo json_encode($atletas);
         }
      }

      public function consultarAtletasEntrenador($id_entrenador) {
         include self::rutaConfig();

         $atletasEntrenador = array();

         $sqlAtletas = "SELECT * FROM atleta WHERE cedula_entrenador = '$id_entrenador' ";
         $resultadoAtletas = $conexion->query($sqlAtletas);

         while(($fila = $resultadoAtletas->fetch_array())) {
            $atletas = self::almacenarInfoAtleta($fila);
            array_push($atletasEntrenador, $atletas);
         }

         echo json_encode($atletasEntrenador);
      }

      public function actualizaAtleta($atleta) {
         include self::rutaConfig();
         
         $conexion->query(" UPDATE atleta SET  `nombre` = '$atleta->nombre', `apellidos` = '$atleta->apellidos', 
                                                `edad` = '$atleta->edad', `telefono` = '$atleta->telefono', `correo` = '$atleta->correo', 
                                                `estatura` = '$atleta->estatura', `peso` = '$atleta->peso', `talla_camisa` = '$atleta->talla_camisa', 
                                                `tipo_sangre` = '$atleta->tipo_sangre', `alergias` = '$atleta->alergias', `operaciones` = '$atleta->operaciones', 
                                                `lesiones_graves` = '$atleta->lesiones_graves', `fracturas` = '$atleta->fracturas', `sexo` = '$atleta->sexo'
                                                WHERE cedula_atleta = '$atleta->cedula' ");

      }

      public function crearAtleta() {
         
      }  

      public function eliminarAtleta() {
         
      }

      public function actualizarMejorMarcaMes() {

      }

      public function almacenarInfoAtleta($info) {
         $data = array(
            'cedula' => $info['cedula_atleta'],
            'nombre' => $info['nombre'],
            'apellidos' => $info['apellidos'],
            'edad' => $info['edad'],
            'telefono' => $info['telefono'],
            'correo' => $info['correo'],
            'estatura' => $info['estatura'],
            'peso' => $info['peso'],
            'talla_camisa' => $info['talla_camisa'],
            'tipo_sangre' => $info['tipo_sangre'],
            'alergias' => $info['alergias'],
            'operaciones' => $info['operaciones'],
            'lesiones_graves' => $info['lesiones_graves'],
            'fracturas' => $info['fracturas'],
            'sexo' => $info['sexo']
         );

         return $data;
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