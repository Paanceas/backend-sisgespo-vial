<?php

require_once PATH.'/include/Config.php';

class CitiesHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getCiudades($res)
    {
        $sql = "CALL sisgespro.getCiudades('".$res['ubicacion']."');";
        return $this->global->callDB($sql,'Consulta de ciudades ',true);
    }
}

?>

