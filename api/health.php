<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/HealthHandler.php'; 
    $db = new HealthHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new HealthHandler();
        $response = $db->getSalud($res);
        $api->echoResponse($response->status, $response);
    }
?>