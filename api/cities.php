<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/CitiesHandler.php'; 
    $db = new CitiesHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,array("ubicacion"), $res, true);
        $db = new CitiesHandler();
        $response = $db->getCiudades($res);
        $api->echoResponse($response->status, $response);
    }
?>