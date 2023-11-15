<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/UsuarioHandler.php'; 
    $db = new UsuarioHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(false,array("user","password"), $res, true);
        $db = new UsuarioHandler();
        $response = $db->getLogin($res);
        $api->echoResponse($response->status, $response);
    }

    function put(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(false,array("id_user","state"), $res, true);
        $db = new UsuarioHandler();
        $response = $db->updateStateUser($res);
        $api->echoResponse($response->status, $response);
    }

    function post(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(false,array("tipo_roll","nombre_usuario","clave"), $res, true);
        $db = new UsuarioHandler();
        $response = $db->setUsuario($res);
        $api->echoResponse($response->status, $response);
    }
?>