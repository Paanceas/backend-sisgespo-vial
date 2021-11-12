<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/MaterialsHandler.php'; 
    $db = new MaterialsHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new MaterialsHandler();
        $response = $db->getMateriales($res);
        $api->echoResponse($response->status, $response);
    }
?>