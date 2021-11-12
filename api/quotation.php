<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/QuotationHandler.php'; 
    $db = new QuotationHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,array("cotizacion"), $res, true);
        $db = new QuotationHandler();
        $response = $db->getCotizacion($res);
        $api->echoResponse($response->status, $response);
    }
    function post(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(true,array("id_cliente", "fecha_cotizacion", "nota_inicio", "iva", "nota_final", "materiales_cotizacion"), $res, true);
        foreach ($res['materiales_cotizacion'] as &$valor) {
            $api = new SisgesproApi(true,array("id_material", "id_tipo_uni_medida", "precio", "cantidad","descripcion"), $valor, true);
        }
        $db = new QuotationHandler();
        $response = $db->setCotizacion($res);
        $api->echoResponse($response->status, $response);
    }
?>