<?php
session_start();
include('../db/config.php');

// Verificar que el usuario tiene acceso
if (!isset($_SESSION['username'])) {
    echo json_encode(['success' => false, 'error' => 'Acceso denegado']);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $parameter = $_POST['parameter'] ?? '';

    $validParameters = ['movimiento', 'temperatura', 'pulso', 'alerta_violencia'];
    if (!in_array($parameter, $validParameters)) {
        echo json_encode(['success' => false, 'error' => 'Parámetro inválido']);
        exit();
    }

    $sql = "UPDATE parametros SET estado = NOT estado WHERE nombre = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $parameter);
    if ($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $stmt->error]);
    }
    $stmt->close();
    $conn->close();
} else {
    echo json_encode(['success' => false, 'error' => 'Método no permitido']);
}
?>
