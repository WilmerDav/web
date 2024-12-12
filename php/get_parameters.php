<?php
include('../db/config.php');

$sql = "SELECT nombre, estado FROM parametros";
$result = $conn->query($sql);

if ($result) {
    $parameters = [];
    while ($row = $result->fetch_assoc()) {
        $parameters[$row['nombre']] = (int)$row['estado'];  // Convertir a tipo entero
    }
    echo json_encode(['success' => true, 'parameters' => $parameters]);
} else {
    echo json_encode(['success' => false, 'error' => $conn->error]);
}

$conn->close();
?>
