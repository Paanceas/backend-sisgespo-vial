<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/QuotationHandler.php'; 
    $db = new QuotationHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new QuotationHandler();
        $response = $db->getCotizaciones($res);
        $api->echoResponse($response->status, $response);
    }
?>