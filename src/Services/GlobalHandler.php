<?php

require_once '../include/Config.php';
require_once '../src/Models/Response.php';

class GlobalHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getValid()
    {
        $sql = "CALL sisgespro.getBaseDatos();";
        return $this->global->callDB($sql,'Api funcionando correctamente',false);
    }

    public function getSummaryInfo()
    {
        $sql = "CALL sisgespro.getInformacionDasboard();";
        return $this->global->callDB($sql,'Consulta Exitosa',false);
    }

    public function getProjectStatus(){
        $sql = "CALL sisgespro.getEstadoProyectos()";
        return $this->global->callDB($sql,'Consulta Exitosa ',true);
    }

    public function getQuotationForYear(){
        $sql = "CALL sisgespro.getCotizacionPorAnio()";
        return $this->global->callDB($sql,'Consulta Exitosa ',true);
    }

    public function getInventory(){
        $sql = "CALL sisgespro.getInventory()";
        return $this->global->callDB($sql,'Consulta Exitosa ',true);
    }
}

?>

