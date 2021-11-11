<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/AcquisitionsHandler.php'; 
    $db = new AcquisitionsHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new AcquisitionsHandler();
        $response = $db->getAdquisiciones($res);
        $api->echoResponse($response->status, $response);
    }
?>