<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];
    $especialidad = $_POST['especialidad'];
    $tarifa = $_POST['tarifa'];
    $portafolio = $_POST['portafolio'];
    $foto = $_POST['foto'];
}

global $conexion_db;

function conexion_db()
{
    global $conexion_db;
    $conexion_db = new mysqli('127.0.0.1', 'root', 'marketplace_freelancers');
    if ($conexion_db->connect_error) {
        die('Error de conexion: ' . $conexion_db->connect_error);
    }
}
