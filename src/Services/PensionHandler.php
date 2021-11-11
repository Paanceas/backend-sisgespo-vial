<?php

require_once PATH.'/include/Config.php';

class PensionHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getPensiones($res)
    {
        $sql = "CALL sisgespro.getPensiones();";
        return $this->global->callDB($sql,'Consulta de pensiones ',true);
    }
}

?>

