<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/VendorsHandler.php'; 
    $db = new VendorsHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new VendorsHandler();
        $response = $db->getProveedores($res);
        $api->echoResponse($response->status, $response);
    }
?>