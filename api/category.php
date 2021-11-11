<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/CategoryHandler.php'; 
    $db = new CategoryHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new CategoryHandler();
        $response = $db->getCategorias($res);
        $api->echoResponse($response->status, $response);
    }
?>