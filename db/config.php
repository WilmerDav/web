<?php
$servername = "localhost"; // Corregido
$username = "root"; // Usuario predeterminado de MAMP
$password = "root"; // Contraseña predeterminada de MAMP en MacOS (vacío en Windows)
$dbname = "iot_system_new"; // Nombre de la base de datos

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
} else {
    echo "Conexión exitosa a la base de datos $dbname.";
}
?>
