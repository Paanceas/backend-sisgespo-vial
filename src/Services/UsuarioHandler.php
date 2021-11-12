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
}

?>

