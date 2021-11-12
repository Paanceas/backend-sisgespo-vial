<?php

require_once PATH.'/include/Config.php';

class ClientsHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getClientes($res)
    {
        $sql = "CALL sisgespro.getClientes();";
        return $this->global->callDB($sql,'Consulta de clientes ',true);
    }
}

?>

