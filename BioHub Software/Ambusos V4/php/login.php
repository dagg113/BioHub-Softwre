<?php
// Incluir la clase de conexión
include("Conexion.php");

// Instanciar la clase y obtener la conexión
$conexion = new Conexion();
$conn = $conexion->getConexion(); // Obtener el objeto de conexión

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $correo = $_POST['Correo'];
    $contraseña = $_POST['Contraseña'];

    if (!$conn) {
        die("<h2>No se encuentra el servidor</h2>");
    }

    // Clave secreta para desencriptar la contraseña
    $clave_secreta = 'mi_clave_segura'; // Debe ser la misma que usaste para cifrar

    // Verificar si el correo existe
    $query = $conn->prepare("SELECT * FROM usuarios WHERE correo_electronico = ?");
    $query->bind_param("s", $correo);
    $query->execute();
    $result = $query->get_result();

    if ($result->num_rows == 1) {
        $user = $result->fetch_assoc();

        // Desencriptar la contraseña almacenada
        $query_check_pass = $conn->prepare("SELECT AES_DECRYPT(contraseña, ?) AS decrypted_password FROM usuarios WHERE correo_electronico = ?");
        $query_check_pass->bind_param("ss", $clave_secreta, $correo);
        $query_check_pass->execute();
        $result_check_pass = $query_check_pass->get_result();
        $decrypted_password = $result_check_pass->fetch_assoc()['decrypted_password'];

        // Verificar si la contraseña es correcta
        if ($contraseña === $decrypted_password) {
            // Redireccionar a la página de inicio si las credenciales son correctas
            header("Location: ../index.html");
            exit;
        } else {
            echo '<script type="text/javascript"> alert("Contraseña incorrecta"); window.location.href="../inicio_sesion.html"; </script>';
        }
    } else {
        echo '<script type="text/javascript"> alert("Correo no registrado"); window.location.href="../inicio_sesion.html"; </script>';
    }
}

// Cerrar la conexión
$conexion->cerrarConexion();
?>
