<?php

require_once PATH.'/include/Config.php';

class ChargesHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getCargos($res)
    {
        $sql = "CALL sisgespro.getCargos();";
        return $this->global->callDB($sql,'Consulta de cargos ',true);
    }
}

?>

