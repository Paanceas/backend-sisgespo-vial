<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/VendorsHandler.php'; 
    $db = new VendorsHandler();

    include_once 'common/http.php';

    function post(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(true,array("id_tipo_identificacion", "id_ciudad", "nombre", "identificacion", "direccion", "celular", "telefono", "correo"), $res, true);
        $db = new VendorsHandler();
        $response = $db->setProveedor($res);
        $api->echoResponse($response->status, $response);
    }

    function put(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(true,array("id_proveedor", "direccion", "celular", "telefono", "correo"), $res, true);
        $db = new VendorsHandler();
        $response = $db->updProveedor($res);
        $api->echoResponse($response->status, $response);
    }


?>