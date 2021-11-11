<?php

require_once PATH.'/include/Config.php';

class HealthHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getSalud($res)
    {
        $sql = "CALL sisgespro.getSalud();";
        return $this->global->callDB($sql,'Consulta de eps ',true);
    }
}

?>

