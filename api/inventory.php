<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/GlobalHandler.php'; 
    $db = new GlobalHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new GlobalHandler();
        $response = $db->getInventory($res);
        $api->echoResponse($response->status, $response);
    }
?>