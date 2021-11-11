<?php

require_once PATH.'/include/Config.php';

class AcquisitionHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getAdquisicion($res)
    {
        $sql = "CALL sisgespro.getAdquisicion('".$res['id_adquisicion']."');";
        return $this->global->callDB($sql,'Consulta de adquisicion ',true);
    }

    public function setAdquisicion($res)
    {
        try {
            $sql = "CALL sisgespro.setAdquisicion('".$res['fecha_adquisicion']."','".$res['valor_total_adquisicion']."');";
            $id_adquisicion = $this->global->callDBReturn($sql,'id_adquisicion');
            foreach ($res['materiales_adquisicion'] as &$valor) {
                $sqlMaterial = "CALL sisgespro.setMaterial('".$valor['id_categoria']."','".$valor['id_tipo_uni_medida']."','".$valor['codigo_material']."','".$valor['nombre_material']."','".$valor['precio_unitario']."','".$valor['cantidad_total']."','".$valor['descripcion_material']."');";
                $id_material = $this->global->callDBReturn($sqlMaterial,'id_material');

                $sqlAdquisicion = "CALL sisgespro.setAdquisicionHasMaterial('".$id_material."','".$id_adquisicion."','".$valor['cantidad_total']."','".$valor['precio_unitario']."');";
                $return = $this->global->callDBReturn($sqlAdquisicion,'id_adquisicion');

                $sqlProveedor = "CALL sisgespro.setProveedorHasMaterial('".$id_material."','".$valor['id_proveedor']."');";
                $return = $this->global->callDBReturn($sqlProveedor,'id_proveedor_has_material');
            }
            return $this->global->resolveCallBD(true, "Aquisicion creada exitosamente");
        } catch (Exception $e) {
            return $this->global->resolveCallBD(false, $e);
        }
    }

}

?>

