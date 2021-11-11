<?php 

    include_once 'common/imports.php';

    include_once PATH.'/src/Services/StatusHandler.php'; 
    $db = new StatusHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(false,null, $res, false);
        $db = new StatusHandler();
        $response = $db->getEstados($res);
        $api->echoResponse($response->status, $response);
    }

?>