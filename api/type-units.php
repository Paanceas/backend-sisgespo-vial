<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/TypeUnitsHandler.php'; 
    $db = new TypeUnitsHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new TypeUnitsHandler();
        $response = $db->getUMedida($res);
        $api->echoResponse($response->status, $response);
    }
?>