<?php

require_once PATH.'/include/Config.php';

class StatusHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getEstados($res)
    {
        $sql = "CALL sisgespro.getEstados();";
        return $this->global->callDB($sql,'Consulta de estados ',true);
    }
}

?>

