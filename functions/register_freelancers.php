<?php

include 'connection_db.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];
    $especialidad = $_POST['especialidad'];
    $tarifa = $_POST['tarifa'];
    $portafolio = $_POST['portafolio'];
    $foto = $_POST['foto'];


    function verificacionRegistro($correo)
    {
        $sql = 'SELECT correo_free FROM frerlancers WHERE correo_free = ?';
        $cursor = $conexion_db->prepare($sql);
        $cursor->bind_param('s', $correo);
        $cursor->execute();

        if ($cursor === false) {
            throw new Exception("Error al ejecutar la consulta");
        }
    }

    function validacionDatos($nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa, $portafolio, $foto)
    {
        return (!empty($nombre) || !empty($apellido) || !empty($correo) || !empty($contrasena) || !empty($especialidad) || !empty($tarifa) || !empty($portafolio) || !empty($foto)) && validacionDatos($nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa, $portafolio, $foto);
    }


    if (validacionDatos($nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa, $portafolio, $foto)) {

        if (!empty($foto) && !empty($portafolio)) {
            $sql = 'INSERT INTO freelancers (nombre_free, apellido_free, correo_free, contrasena_free, especialidad_free, tarifaHora_free, portafolio_free, fotoPerfil_free) VALUES (?,?,?,?,?,?,?,?)';
            $consulta = $conexion_db->prepare($sql);
            $consulta->bind_param('sssssiss', $nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa, $portafolio, $foto);
        } elseif (!empty($foto) && empty($portafolio)) {
            $sql = 'INSERT INTO freelancers (nombre_free, apellido_free, correo_free, contrasena_free, especialidad_free, tarifaHora_free, fotoPerfil_free) VALUES (?,?,?,?,?,?,?)';
            $consulta = $conexion_db->prepare($sql);
            $consulta->bind_param('sssssis', $nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa, $foto);
        } elseif (empty($foto) && !empty($portafolio)) {
            $sql = 'INSERT INTO freelancers (nombre_free, apellido_free, correo_free, contrasena_free, especialidad_free, portafolio_free, tarifaHora_free) VALUES (?,?,?,?,?,?,?)';
            $consulta = $conexion_db->prepare($sql);
            $consulta->bind_param('ssssssi', $nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa, $portafolio);
        } else {
            $sql = 'INSERT INTO freelancers (nombre_free, apellido_free, correo_free, contrasena_free, especialidad_free, tarifaHora_free) VALUES (?,?,?,?,?,?)';
            $consulta = $conexion_db->prepare($sql);
            $consulta->bind_param('sssssi', $nombre, $apellido, $correo, $contrasena, $especialidad, $tarifa);
        }

        if ($consulta->execute()) {
            header("Location: ../templates/login.html");
        } else {
            return 'Datos no insertados';
        }
    } else {
        header("Location: ../index.html");
    }
    exit;
}
