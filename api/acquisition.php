<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/AcquisitionHandler.php'; 
    $db = new AcquisitionHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,array("id_adquisicion"), $res, true);
        $db = new AcquisitionHandler();
        $response = $db->getAdquisicion($res);
        $api->echoResponse($response->status, $response);
    }

    function post(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(true,array("fecha_adquisicion", "valor_total_adquisicion", "materiales_adquisicion"), $res, true);
        foreach ($res['materiales_adquisicion'] as &$valor) {
            $api = new SisgesproApi(true,array("id_proveedor", "id_categoria", "id_tipo_uni_medida", "codigo_material","nombre_material", "precio_unitario", "cantidad_total","descripcion_material"), $valor, true);
        }
        $db = new AcquisitionHandler();
        $response = $db->setAdquisicion($res);
        $api->echoResponse($response->status, $response);
    }



?>