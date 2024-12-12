<?php
include('../db/config.php');

$sql = "SELECT dispositivo_id, fecha_hora, evento_detectado FROM historial ORDER BY fecha_hora DESC";
$result = $conn->query($sql);

$historial = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $historial[] = [
            'id_dispositivo' => $row['dispositivo_id'],
            'fecha_hora' => $row['fecha_hora'],
            'evento_detectado' => $row['evento_detectado']
        ];
    }
    echo json_encode(['success' => true, 'historial' => $historial]);
} else {
    echo json_encode(['success' => false, 'historial' => []]);
}

$conn->close();

?>
