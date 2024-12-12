<?php
session_start();
include('../db/config.php'); // Asegúrate de que la ruta es correcta

// Activar la visualización de errores
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verificar si la conexión a la base de datos está funcionando
    if (!$conn) {
        die("Error en la conexión a la base de datos: " . mysqli_connect_error());
    }

    // Escapar las entradas de los formularios
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    // Consulta para verificar si el usuario existe
    $sql = "SELECT * FROM usuarios WHERE username = '$username'";
    $result = $conn->query($sql);

    // Verificar si la consulta se ejecuta correctamente
    if (!$result) {
        die("Error en la consulta SQL: " . $conn->error);
    }

    // Verificar si se encontró el usuario
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Verificar la contraseña ingresada con la de la base de datos (sin cifrado)
        if ($password == $row['password']) {
            // Iniciar la sesión
            $_SESSION['username'] = $username;

            // Redirigir al index.html
            header("Location: ../index.html");
            exit();
        } else {
            echo "Contraseña incorrecta.<br>";
        }
    } else {
        echo "Usuario no encontrado.<br>";
    }
}
?>
