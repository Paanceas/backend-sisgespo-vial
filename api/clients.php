<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/ClientsHandler.php'; 
    $db = new ClientsHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new ClientsHandler();
        $response = $db->getClientes($res);
        $api->echoResponse($response->status, $response);
    }
?>