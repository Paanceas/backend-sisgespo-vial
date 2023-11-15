<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/ClientsHandler.php';
    $db = new ClientsHandler();

    include_once 'common/http.php';

    function post(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true);
        $api = new SisgesproApi(false,array("id_cliente","id_tipo_identificacion","identificacion", "nombre", "telefono", "celular", "direccion", "correo"), $res, true);
        $db = new ClientsHandler();
        $response = $db->setCliente($res);
        $api->echoResponse($response->status, $response);
    }
?>