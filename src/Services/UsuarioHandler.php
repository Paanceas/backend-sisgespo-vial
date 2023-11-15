<?php

require_once PATH.'/include/Config.php';

class UsuarioHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getLogin($res)
    {
        $sql = "CALL sisgespro.getLogin('".$res['user']."','".$res['password']."');";
        return $this->global->callDB($sql,'Consulta usuario',false);
    }

    public function getUsuarios($res)
    {
        $sql = "CALL sisgespro.getUsuarios();";
        return $this->global->callDB($sql,'Consulta de usuarios ',true);
    }

    public function updateStateUser($res)
    {
        $sql = "CALL sisgespro.updStateUser('".$res['id_user']."','".$res['state']."');";
        return $this->global->callDB($sql,'Actualización de estado de usuario',false);
    }

    public function setUsuario($res)
    {
        $sql = "CALL sisgespro.setUsuario('".$res['tipo_roll']."','".$res['nombre_usuario']."','".$res['clave']."');";
        return $this->global->callDB($sql,'Creación de usuario exitosa',false);
    }
}

?>

