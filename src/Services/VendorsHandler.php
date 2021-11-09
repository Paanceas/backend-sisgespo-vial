<?php

require_once PATH.'/include/Config.php';

class VendorsHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getProveedores($res)
    {
        $sql = "CALL sisgespro.getProveedores();";
        return $this->global->callDB($sql,'Consulta proveedores ',true);
    }

    public function setProveedor($res)
    {
        $sql = "CALL sisgespro.setProveedor('".$res['id_tipo_identificacion']."','".$res['id_ciudad']."','".$res['nombre']."','".$res['identificacion']."','".$res['direccion']."','".$res['celular']."','".$res['telefono']."','".$res['correo']."');";
        return $this->global->callDB($sql,'Proveedor Creado',false);
    }

    public function updProveedor($res)
    {

        $sql = "CALL sisgespro.updProveedor('".$res['id_proveedor']."','".$res['direccion']."','".$res['celular']."','".$res['telefono']."','".$res['correo']."');";
        return $this->global->callDB($sql,'Proveedor actualizado',false);
    }
}

?>

