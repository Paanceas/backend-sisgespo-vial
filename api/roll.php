<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/RollHandler.php'; 
    $db = new RollHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new RollHandler();
        $response = $db->getRolls($res);
        $api->echoResponse($response->status, $response);
    }
?>