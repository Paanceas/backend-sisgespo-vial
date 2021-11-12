<?php

require_once PATH.'/include/Config.php';

class EmployeesHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getEmpleados($res)
    {
        $sql = "CALL sisgespro.getEmpleados();";
        return $this->global->callDB($sql,'Consulta de empelados ',true);
    }
}

?>

