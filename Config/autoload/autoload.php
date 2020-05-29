<?php 
    function  autoload($clase){
        include "../Models/" . $clase . ".php";
    }
    
    spl_autoload_register('autoload');
?>