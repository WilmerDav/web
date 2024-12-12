<?php
include('../db/config.php');

// Configura el tiempo de espera para generar datos en segundos (usado por cron o llamado repetido)
$interval = 5;

// Verificar si hay sensores activados
$sensors = $conn->query("SELECT nombre, estado FROM parametros WHERE estado = 1");

if ($sensors->num_rows > 0) {
    while ($sensor = $sensors->fetch_assoc()) {
        $nombre = $sensor['nombre'];
        $evento = '';
        $valor = '';

        switch ($nombre) {
            case 'movimiento':
                $evento = 'Movimiento';
                $tipos_movimiento = ['Leve', 'Moderado', 'Brusco'];
                $valor = $tipos_movimiento[array_rand($tipos_movimiento)];
                break;

            case 'temperatura':
                $evento = 'Temperatura y Humedad';
                $temperatura = rand(15, 25); // Rango típico para La Paz
                $humedad = rand(30, 60); // Humedad promedio
                $valor = "Temp: $temperatura°C, Hum: $humedad%";
                break;

            case 'pulso_cardiaco':
                $evento = 'Ritmo Cardíaco';
                $valor = rand(60, 100) . " bpm"; // Rango normal de pulso
                break;

            case 'alerta_violencia':
                $evento = 'Alerta de violencia';
                $valor = '¡Situación de violencia detectada!';
                break;
        }

        // Insertar datos en la tabla de alertas si aplica
        if ($nombre === 'alerta_violencia') {
            $stmt = $conn->prepare("INSERT INTO alertas (id_dispositivo, fecha_hora, evento_detectado) VALUES (?, NOW(), ?)");
            $id_dispositivo = rand(1, 10); // ID ficticio del dispositivo
            $stmt->bind_param("is", $id_dispositivo, $valor);
            $stmt->execute();
        }

        // Insertar datos en la tabla de historial
        $stmt = $conn->prepare("INSERT INTO historial (id_dispositivo, fecha_hora, evento_detectado) VALUES (?, NOW(), ?)");
        $id_dispositivo = rand(1, 10); // ID ficticio del dispositivo
        $stmt->bind_param("is", $id_dispositivo, "$evento: $valor");
        $stmt->execute();
    }
    echo "Datos generados.";
} else {
    echo "No hay sensores activados.";
}

$conn->close();
?>
