<?php
// Incluir el archivo del modelo de ambulancia
require_once '../modelo/ambulancia_modelo.php';
// Incluir el archivo de conexión a la base de datos
require_once '../conexion.php';

// Crear una nueva instancia de la clase Conexion
$conexion = new Conexion();
// Obtener la conexión activa a la base de datos
$conn = $conexion->getConexion();
// Crear una nueva instancia del modelo AmbulanciaModelo, pasando la conexión como parámetro
$modelo = new AmbulanciaModelo($conn);

// Verificar si existe una acción definida en el formulario (enviado mediante POST)
if (isset($_POST['accion'])) {
    // Almacenar la acción en una variable
    $accion = $_POST['accion'];
    
    // Utilizar una estructura switch para manejar diferentes acciones según el valor de $accion
    switch ($accion) {
        case 'agregar':
            // Obtener los datos del formulario para agregar una ambulancia
            $placa = $_POST['placa'];
            $disponibilidad = $_POST['disponibilidad'];
            // Verificar si se ha proporcionado el ID del conductor, si no, asignar null
            $conductor_id = isset($_POST['conductor_id']) ? $_POST['conductor_id'] : null;
            // Verificar si se ha proporcionado el equipo de trabajo, si no, asignar null
            $equipo_trabajo = isset($_POST['equipo_trabajo']) ? $_POST['equipo_trabajo'] : null;
            // Verificar si se ha proporcionado el plan, si no, asignar null
            $plan = isset($_POST['plan']) ? $_POST['plan'] : null;
            // Obtener la categoría de la ambulancia
            $categoria_ambu = $_POST['categoria_ambu'];
            
            // Llamar al método agregarAmbulancia del modelo para agregar una nueva ambulancia
            $modelo->agregarAmbulancia($placa, $disponibilidad, $conductor_id, $equipo_trabajo, $plan, $categoria_ambu);
            break;

        case 'editar':
            // Obtener los datos del formulario para editar una ambulancia
            $id = $_POST['id']; // ID de la ambulancia a editar
            $placa = $_POST['placa'];
            $disponibilidad = $_POST['disponibilidad'];
            // Verificar si se ha proporcionado el ID del conductor, si no, asignar null
            $conductor_id = isset($_POST['conductor_id']) ? $_POST['conductor_id'] : null;
            // Verificar si se ha proporcionado el equipo de trabajo, si no, asignar null
            $equipo_trabajo = isset($_POST['equipo_trabajo']) ? $_POST['equipo_trabajo'] : null;
            // Verificar si se ha proporcionado el plan, si no, asignar null
            $plan = isset($_POST['plan']) ? $_POST['plan'] : null;
            // Obtener la categoría de la ambulancia
            $categoria_ambu = $_POST['categoria_ambu'];
            
            // Llamar al método editarAmbulancia del modelo para actualizar la ambulancia existente
            $modelo->editarAmbulancia($id, $placa, $disponibilidad, $conductor_id, $equipo_trabajo, $plan, $categoria_ambu);
            break;

        case 'cambiarDisponibilidad':
            // Obtener el ID de la ambulancia y la nueva disponibilidad desde el formulario
            $id = $_POST['id'];
            $disponibilidad = $_POST['disponibilidad'];
            // Si la disponibilidad es 'En mantenimiento', indicar que se debe quitar el conductor
            $quitar_conductor = ($disponibilidad == 'En mantenimiento');
            // Llamar al método cambiarEstadoAmbulancia para actualizar el estado y remover el conductor si es necesario
            $modelo->cambiarEstadoAmbulancia($id, $disponibilidad, $quitar_conductor);
            break;

        default:
            // Si la acción no coincide con ningún caso, redirigir a la vista de ambulancias
            header('Location: ../vista/ambulancia_vista.php');
            exit; // Asegurarse de que el script se detenga después de la redirección
    }

    // Redirigir a la vista de ambulancias después de realizar cualquier acción
    header('Location: ../vista/ambulancia_vista.php');
    exit; // Detener el script
} else {
    // Si no hay acción definida, redirigir a la vista de ambulancias
    header('Location: ../vista/ambulancia_vista.php');
    exit; // Detener el script
}
?>
