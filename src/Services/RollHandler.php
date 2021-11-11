<?php

require_once PATH.'/include/Config.php';

class RollHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getRolls($res)
    {
        $sql = "CALL sisgespro.getRolls();";
        return $this->global->callDB($sql,'Consulta de roles ',true);
    }
}

?>

