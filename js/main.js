// Función para alternar el menú desplegable
function toggleMenu() {
    const menu = document.getElementById('dropdown-menu');
    menu.classList.toggle('show');
}

// Función para actualizar las tablas de alertas o historial
function actualizarTabla(endpoint, tableBodyId) {
    fetch(endpoint)
        .then(response => response.json())  // Cambié text() por json() porque se espera una respuesta en JSON
        .then(data => {
            // Verificar si los datos tienen éxito antes de actualizar la tabla
            if (data.success) {
                const tableBody = document.getElementById(tableBodyId);
                tableBody.innerHTML = ''; // Limpiar tabla antes de agregar nuevos datos
                
                // Agregar filas a la tabla basándonos en los datos obtenidos
                data.items.forEach(item => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${item.id}</td>
                        <td>${item.fecha_hora}</td>
                        <td>${item.descripcion || item.evento_detectado}</td>
                    `;
                    tableBody.appendChild(row);
                });
            } else {
                console.error("Error al obtener los datos:", data.error);
            }
        })
        .catch(error => console.error("Error al actualizar la tabla:", error));
}

// Actualiza las tablas de alertas e historial cada 5 segundos
setInterval(() => {
    actualizarTabla("php/alertas.php", "alertas-body");
    actualizarTabla("php/historial.php", "historial-body");
}, 5000);
