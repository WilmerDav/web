<?php
// Incluir la conexión a la base de datos
include('../db/config.php');

// Consulta para obtener los registros del historial
$sql = "SELECT dispositivo_id, fecha_hora, evento_detectado FROM historial ORDER BY fecha_hora DESC";
$result = $conn->query($sql);

// Inicializar un array para los registros del historial
$historial = [];

if ($result->num_rows > 0) {
    // Si hay resultados, agregar cada uno al array $historial
    while ($row = $result->fetch_assoc()) {
        $historial[] = [
            'id_dispositivo' => $row['dispositivo_id'],
            'fecha_hora' => $row['fecha_hora'],
            'evento_detectado' => $row['evento_detectado']
        ];
    }
    // Devolver los resultados como JSON
    echo json_encode(['success' => true, 'historial' => $historial]);
} else {
    // Si no hay registros, devolver un mensaje indicando esto
    echo json_encode(['success' => false, 'message' => 'No hay registros en el historial']);
}

// Cerrar la conexión a la base de datos
$conn->close();
?>
