<?php

require_once PATH.'/include/Config.php';

class WelfareFundHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getCajaDeCompensacion($res)
    {
        $sql = "CALL sisgespro.getCajaDeCompensacion();";
        return $this->global->callDB($sql,'Consulta Cajas de compensación familiar ',true);
    }
}

?>

