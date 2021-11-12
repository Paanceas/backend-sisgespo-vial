<?php

require_once PATH.'/include/Config.php';

class QuotationHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getCotizaciones($res)
    {
        $sql = "CALL sisgespro.getCotizaciones();";
        return $this->global->callDB($sql,'Consulta de cotizacion ',true);
    }

    public function getCotizacion($res)
    {
        $sql = "CALL sisgespro.getCotizacion('".$res['cotizacion']."');";
        return $this->global->callDB($sql,'Consulta de cotizacion ',true);
    }

    public function setCotizacion($res)
    {
        try {
            $sql = "CALL sisgespro.setCotizacion('".$res['id_cliente']."','".$res['fecha_cotizacion']."','".$res['nota_inicio']."','".$res['iva']."','".$res['nota_final']."');";
            $id_cotizacion = $this->global->callDBReturn($sql,'id_cotizacion');
            foreach ($res['materiales_cotizacion'] as &$valor) {
                $sqlMateria = "CALL sisgespro.setCotizacionHasMaterial('".$id_cotizacion."','".$valor['id_tipo_uni_medida']."','".$valor['id_material']."','".$valor['precio']."','".$valor['cantidad']."','".$valor['descripcion']."');";
                $return = $this->global->callDBReturn($sqlMateria,'id_cotizacion');
            }
            return $this->global->resolveCallBD(true, "Cotización creada exitosamente");
        } catch (Exception $e) {
            return $this->global->resolveCallBD(false, $e);
        }
    }

}

?>

