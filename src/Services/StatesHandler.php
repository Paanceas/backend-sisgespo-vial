<?php

require_once PATH.'/include/Config.php';

class StatesHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getDepartamentos($res)
    {
        $sql = "CALL sisgespro.getDepartamentos('".$res['pais']."');";
        return $this->global->callDB($sql,'Consulta de departamentos o estados ',true);
    }
}

?>

