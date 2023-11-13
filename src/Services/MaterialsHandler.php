<?php

require_once PATH.'/include/Config.php';

class MaterialsHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getMateriales($res)
    {
        $sql = "CALL sisgespro.getMateriales();";
        return $this->global->callDB($sql,'Consulta de materiales ',true);
    }
}

?>

