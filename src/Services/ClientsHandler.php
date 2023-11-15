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

    public function getClientesAll($res)
    {
        $sql = "CALL sisgespro.getClientesYCotizaciones();";
        return $this->global->callDB($sql,'Consulta de clientes ',true);
    }

    public function setCliente($res)
    {
        $sql = "CALL sisgespro.setCliente('".$res['id_cliente']."','".$res['id_tipo_identificacion']."','".$res['identificacion']."','".$res['nombre']."','".$res['telefono']."','".$res['celular']."','".$res['direccion']."','".$res['correo']."');";
        return $this->global->callDB($sql, 'Creación de cliente exitosa', false);
    }
}

?>

