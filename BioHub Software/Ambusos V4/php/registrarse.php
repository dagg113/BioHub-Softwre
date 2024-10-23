<?php
// Incluir la clase de conexión
include("conexion.php");

// Instanciar la clase y obtener la conexión
$conexion = new Conexion();
$conn = $conexion->getConexion(); // Obtener el objeto de conexión

// Verificar conexión
if (!$conn) {
    die("Conexión fallida: " . mysqli_connect_error());
}

// Procesar el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recoger los datos del formulario
    $nombre_usuario = $_POST["username"];
    $correo_electronico = $_POST["email"];
    $contraseña = $_POST["password"];

    // Clave secreta para cifrar la contraseña
    $clave_secreta = 'mi_clave_segura';

    // Preparar la consulta SQL con cifrado directo de MySQL
    $query = $conn->prepare("INSERT INTO usuarios (nombre_usuario, correo_electronico, contraseña, id_rol) 
                             VALUES (?, ?, AES_ENCRYPT(?, ?), ?)");
    $rol = 6; // Valor de rol predeterminado
    $query->bind_param("ssssi", $nombre_usuario, $correo_electronico, $contraseña, $clave_secreta, $rol);

    // Ejecutar la consulta
    if ($query->execute()) {
        echo "Registro exitoso";
        header("Location: ../inicio_sesion.html");
    } else {
        echo "Error al registrar el usuario: " . $query->error;
    }
}

// Cerrar la conexión
$conexion->cerrarConexion();
?>
