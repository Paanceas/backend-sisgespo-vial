<?php

require_once PATH.'/include/Config.php';

class AcquisitionsHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getAdquisiciones($res)
    {
        $sql = "CALL sisgespro.getAdquisiciones();";
        return $this->global->callDB($sql,'Consulta de adquisiciones ',true);
    }
}

?>

