<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/PensionHandler.php'; 
    $db = new PensionHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new PensionHandler();
        $response = $db->getPensiones($res);
        $api->echoResponse($response->status, $response);
    }
?>