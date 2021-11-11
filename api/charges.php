<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/ChargesHandler.php'; 
    $db = new ChargesHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new ChargesHandler();
        $response = $db->getCargos($res);
        $api->echoResponse($response->status, $response);
    }
?>