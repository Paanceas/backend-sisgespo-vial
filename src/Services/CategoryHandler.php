<?php

require_once PATH.'/include/Config.php';

class CategoryHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getCategorias($res)
    {
        $sql = "CALL sisgespro.getCategorias();";
        return $this->global->callDB($sql,'Consulta de categorias ',true);
    }
}

?>

