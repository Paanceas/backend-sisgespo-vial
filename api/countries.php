<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/CountriesHandler.php'; 
    $db = new CountriesHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new CountriesHandler();
        $response = $db->getPaises($res);
        $api->echoResponse($response->status, $response);
    }
?>