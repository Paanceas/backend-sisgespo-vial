<?php

require_once PATH.'/include/Config.php';

class TypeUnitsHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getUMedida($res)
    {
        $sql = "CALL sisgespro.getUMedida();";
        return $this->global->callDB($sql,'Consulta tipos de identificación ',true);
    }
}

?>

