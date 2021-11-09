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
?>