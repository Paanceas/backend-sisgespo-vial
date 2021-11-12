<?php 
    include_once 'common/imports.php';

    include_once PATH.'/src/Services/ProjectHandler.php'; 
    $db = new ProjectHandler();

    include_once 'common/http.php';

    function get(){
        $res = $_GET;
        $api = new SisgesproApi(true,array("id_proyecto"), $res, true);
        $db = new ProjectHandler();
        $response = $db->getProyectosHasEmpleados($res);
        $api->echoResponse($response->status, $response);
    }
    function post(){
        $json = file_get_contents("php://input",true);
        $res = json_decode($json, true); 
        $api = new SisgesproApi(true,array("id_cotizacion", "id_estado", "nombre_proyecto", "codigo_proyecto", "descripcion_proyecto", "fecha_inicio_proyecto", "valor_anticipado", "valor_total_proyecto", "geoposicion"), $res, true);
        foreach ($res['empleados_proyecto'] as &$valor) {
            $api = new SisgesproApi(true,array("id_empleado"), $valor, true);
        }
        $db = new ProjectHandler();
        $response = $db->setProyecto($res);
        $api->echoResponse($response->status, $response);
    }
?>