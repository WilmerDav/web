<?php
session_start();
include('../db/config.php');

// Verificar que el usuario tiene acceso
if (!isset($_SESSION['username'])) {
    echo json_encode(['success' => false, 'error' => 'Acceso denegado. No está logueado.']);
    exit();
}

// Consulta para obtener las alertas activas
$sql = "SELECT id_alerta, id_dispositivo, fecha_alerta, evento_detectado FROM alertas ORDER BY fecha_alerta DESC";
$result = $conn->query($sql);

$alertas = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $alertas[] = [
            'id_alerta' => $row['id_alerta'],
            'id_dispositivo' => $row['id_dispositivo'],
            'fecha_alerta' => $row['fecha_alerta'],
            'evento_detectado' => $row['evento_detectado']
        ];
    }
    echo json_encode(['success' => true, 'alertas' => $alertas]);
} else {
    echo json_encode(['success' => false, 'error' => 'No hay alertas activas']);
}

$conn->close();
?>
