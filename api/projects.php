<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/ProjectHandler.php'; 
    $db = new ProjectHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,null, $res, false);
        $db = new ProjectHandler();
        $response = $db->getProyectos($res);
        $api->echoResponse($response->status, $response);
    }
?>