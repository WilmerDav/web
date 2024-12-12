<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include('config.php'); // Asegúrate de que config.php esté correctamente ubicado

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión a la base de datos: " . $conn->connect_error);
} else {
    echo "Conexión exitosa a la base de datos.";
}
?>
