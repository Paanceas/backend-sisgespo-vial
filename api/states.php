<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/StatesHandler.php'; 
    $db = new StatesHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,array("pais"), $res, true);
        $db = new StatesHandler();
        $response = $db->getDepartamentos($res);
        $api->echoResponse($response->status, $response);
    }
?>