<?php

require_once PATH.'/include/Config.php';

class CountriesHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getPaises($res)
    {
        $sql = "CALL sisgespro.getPaises();";
        return $this->global->callDB($sql,'Consulta de paises ',true);
    }
}

?>

