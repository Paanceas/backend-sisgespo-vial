<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/WelfareFundHandler.php'; 
    $db = new WelfareFundHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new WelfareFundHandler();
        $response = $db->getCajaDeCompensacion($res);
        $api->echoResponse($response->status, $response);
    }
?>