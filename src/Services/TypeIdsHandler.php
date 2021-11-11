<?php

require_once PATH.'/include/Config.php';

class TypeIdsHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getIdentificacion($res)
    {
        $sql = "CALL sisgespro.getIdentificacion();";
        return $this->global->callDB($sql,'Consulta tipos de identificación ',true);
    }
}

?>

