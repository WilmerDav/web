<?php
include('../db/config.php');

// Obtener el sensor activado
$sensor = $_POST['sensor'] ?? '';

if ($sensor) {
    // Consultar si el sensor está en la base de datos
    $sql = "SELECT estado FROM parametros WHERE nombre = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $sensor);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();
    
    if ($row) {
        // Cambiar el estado del sensor (1 para activado, 0 para desactivado)
        $new_state = $row['estado'] == 1 ? 0 : 1; // Alternar el estado
        
        // Actualizar el estado en la base de datos
        $update_sql = "UPDATE parametros SET estado = ? WHERE nombre = ?";
        $update_stmt = $conn->prepare($update_sql);
        $update_stmt->bind_param("is", $new_state, $sensor);
        $update_stmt->execute();
        
        // Si el sensor está activado, insertamos un dato falso en la tabla alertas y en el historial
        if ($new_state == 1) {
            $event = '';
            switch ($sensor) {
                case 'movimiento':
                    $event = 'Movimiento Detectado';
                    break;
                case 'temperatura':
                    $event = 'Temperatura Alta Detectada';
                    break;
                case 'pulso_cardiaco':
                    $event = 'Pulso Elevado Detectado';
                    break;
                case 'alerta_violencia':
                    $event = 'Alerta de Violencia Detectada';
                    break;
            }

            // Insertar los datos falsos en la tabla de alertas
            $alert_sql = "INSERT INTO alertas (dispositivo_id, tipo_alerta, descripcion, estado) VALUES (?, ?, ?, ?)";
            $alert_stmt = $conn->prepare($alert_sql);
            $dispositivo_id = rand(1, 3); // ID de dispositivo aleatorio
            $estado_alerta = 'activa'; // Definir estado como activo
            $alert_stmt->bind_param("isss", $dispositivo_id, $sensor, $event, $estado_alerta);
            $alert_stmt->execute();

            // Insertar los mismos datos en la tabla de historial
            $historial_sql = "INSERT INTO historial (dispositivo_id, evento_detectado, fecha_hora) VALUES (?, ?, NOW())";
            $historial_stmt = $conn->prepare($historial_sql);
            $historial_stmt->bind_param("is", $dispositivo_id, $event);
            $historial_stmt->execute();
        }
    }
}

$conn->close();
?>
