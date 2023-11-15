<?php

require_once PATH.'/include/Config.php';

class ProjectHandler {
    
    private $global;

    function __construct() {
        require_once 'CallBD.php';
        $this->global = new CallBD();
    }   

    public function getProyectos($res)
    {
        $sql = "CALL sisgespro.getProyectos();";
        return $this->global->callDB($sql,'Consulta de proyectos ',true);
    }
    public function getProyectosHasEmpleados($res)
    {
        $sql = "CALL sisgespro.getProyectosHasEmpleados('".$res['id_proyecto']."');";
        return $this->global->callDB($sql,'Consulta de empleados por proyecto ',true);
    }


    public function setProyecto($res)
    {
        try {
            $sql = "CALL sisgespro.setProyecto('".$res['id_cotizacion']."','".$res['id_estado']."','".$res['nombre_proyecto']."','".$res['codigo_proyecto']."','".$res['descripcion_proyecto']."','".$res['fecha_inicio_proyecto']."','".$res['valor_anticipado']."','".$res['valor_total_proyecto']."','".$res['geoposicion']."');";
            $id_proyecto = $this->global->callDBReturn($sql,'id_proyecto');
            foreach ($res['empleados_proyecto'] as &$valor) {
                $sqlEmpleado = "CALL sisgespro.setProyectosHasEmpleados('".$valor['id_empleado']."','".$id_proyecto."');";
                $return = $this->global->callDBReturn($sqlEmpleado,'id_proyecto');
            }
            return $this->global->resolveCallBD(true, "Proyecto creado exitosamente");
        } catch (Exception $e) {
            return $this->global->resolveCallBD(false, $e);
        }
    }

    public function updStateProject($res)
    {
        $sql = "CALL sisgespro.updStateProject('".$res['id_proyecto']."', '".$res['id_estado']."');";
        return $this->global->callDB($sql,'Estado de proyecto actualizado',true);
    }

    public function getInventoryProject($res)
    {
        $sql = "CALL sisgespro.getInventoryProject('".$res['id_proyecto']."');";
        return $this->global->callDB($sql,'Consulta exitosa',true);
    }

}

?>

