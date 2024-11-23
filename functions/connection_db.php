<?php

    global $conexion_db;
    $conexion_db = new mysqli('127.0.0.1', 'root', 'marketplace_freelancers');
    if ($conexion_db->connect_error) {
        die('Error de conexion: ' . $conexion_db->connect_error);
    }

?>