-- Active: 1718007754811@@127.0.0.1@3306@marketplace_freelancers
CREATE DATABASE Marketplace_Freelancers;

CREATE TABLE freelancers (
    id_freelancer INT PRIMARY KEY AUTO_INCREMENT,
    nombre_free VARCHAR(50) NOT NULL,
    apellido_free VARCHAR(50) NOT NULL,
    correo_free VARCHAR(100) NOT NULL UNIQUE,
    contrasena_free VARCHAR(30) NOT NULL,
    especialidad_free VARCHAR(50) NOT NULL,
    tarifaHora_free FLOAT NOT NULL,
    portafolio_free VARCHAR(50) NULL,
    fotoPerfil_free BLOB NULL,
    registro_free DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE freelancers CHANGE COLUMN pNombre_free nombre_free VARCHAR(50) NOT NULL;
ALTER TABLE freelancers CHANGE COLUMN pApellido_free apellido_free VARCHAR(50) NOT NULL;

CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    fk_freelancer INT NOT NULL,
    nombre_servicio VARCHAR(50) NOT NULL,
    descripcion_servicio VARCHAR(200) NOT NULL,
    fk_categoria INT NOT NULL,
    tarifa_servicio FLOAT NOT NULL,
    tiempoDisponible_servicio INT NOT NULL,
    FOREIGN KEY (fk_categoria) REFERENCES categorias (id_categoria),
    Foreign Key (fk_freelancer) REFERENCES freelancers(id_freelancer)
)

CREATE TABLE solicitudes (
    id_solicitud INT PRIMARY KEY AUTO_INCREMENT,
    fk_freelancer INT NOT NULL,
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_cliente VARCHAR(50) NOT NULL,
    correo_cliente VARCHAR(100) NOT NULL,
    descripcionRequerimiento_cliente VARCHAR(200) NOT NULL,
    fecha_solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    estado_solicitud ENUM('Pendiente','Revisado','Contactado'),
    FOREIGN KEY (fk_freelancer) REFERENCES freelancers(id_freelancer)
)

INSERT INTO
    categorias (nombre_categoria)
VALUES ('Diseño Web'),
    ('Marketing Digital'),
    ('Desarrollo de Software'),
    ('Traducción'),
    ('Diseño Gráfico'),
    ('Redacción de Contenidos'),
    ('Fotografía'),
    ('Animación'),
    ('Ilustración'),
    ('Edición de Video');

INSERT INTO freelancers (
    nombre_free, 
    apellido_free, 
    correo_free, 
    especialidad_free, 
    tarifaHora_free, 
    portafolio_free,
    contrasena_free
) VALUES 
('Carlos', 'Martínez', 'carlos.martinez@email.com', 'Desarrollo Web', 35.50, 'www.carlosweb.com', 101),
('María', 'González', 'maria.gonzalez@email.com', 'Diseño UX/UI', 40.75, 'www.mariagdesign.com', 102),
('Juan', 'López', 'juan.lopez@email.com', 'Marketing Digital', 28.90, 'www.juanmarketing.com', 103),
('Ana', 'Sánchez', 'ana.sanchez@email.com', 'Traducción', 22.60, 'www.anatranslate.com', 104),
('Pedro', 'Fernández', 'pedro.fernandez@email.com', 'Fotografía', 45.20, 'www.pedrofoto.com', 105),
('Laura', 'Morales', 'laura.morales@email.com', 'Redacción', 25.30, 'www.lauraescribe.com', 106),
('Diego', 'Ramírez', 'diego.ramirez@email.com', 'Desarrollo de Software', 50.80, 'www.diegocoder.com', 107),
('Sofía', 'Herrera', 'sofia.herrera@email.com', 'Diseño Gráfico', 33.70, 'www.sofiadesign.com', 108),
('Javier', 'Núñez', 'javier.nunez@email.com', 'Animación', 38.60, 'www.javieranimation.com', 109),
('Elena', 'Jiménez', 'elena.jimenez@email.com', 'Edición de Video', 42.40, 'www.elenaedits.com', 110);


INSERT INTO servicios (
    fk_freelancer, 
    nombre_servicio, 
    descripcion_servicio, 
    fk_categoria, 
    tarifa_servicio, 
    tiempoDisponible_servicio
) VALUES 
(1, 'Landing Page Profesional', 'Desarrollo de landing page responsive y optimizada', 3, 250.00, 5),
(2, 'Diseño de Interfaz de Aplicación', 'Diseño UX/UI completo para aplicación móvil', 1, 450.00, 10),
(3, 'Campaña de Google Ads', 'Gestión de campaña publicitaria completa', 2, 600.00, 15),
(4, 'Traducción Técnica Inglés-Español', 'Traducción especializada de documentos técnicos', 4, 180.00, 3),
(5, 'Sesión Fotográfica Profesional', 'Producción fotográfica con edición incluida', 7, 350.00, 6),
(6, 'Redacción de Blog Corporativo', 'Contenidos SEO para blog empresarial', 6, 200.00, 4),
(7, 'Desarrollo de Aplicación Web', 'Aplicación web a medida con backend completo', 3, 800.00, 20),
(8, 'Branding Corporativo', 'Diseño de identidad visual completa', 5, 500.00, 12),
(9, 'Animación 2D Explicativa', 'Video animado para explicación de producto', 8, 400.00, 7),
(10, 'Edición de Video Promocional', 'Edición profesional de video para redes sociales', 10, 280.00, 5);

INSERT INTO solicitudes (
    fk_freelancer, 
    nombre_cliente, 
    apellido_cliente, 
    correo_cliente, 
    descripcionRequerimiento_cliente, 
    estado_solicitud
) VALUES 
(1, 'Roberto', 'Mendoza', 'roberto.mendoza@empresa.com', 'Necesito una landing page para mi negocio de consultoría', 'Pendiente'),
(2, 'Camila', 'Rivas', 'camila.rivas@startup.com', 'Requiero diseño de interfaz para aplicación de gestión', 'Revisado'),
(3, 'Eduardo', 'Castillo', 'eduardo.castillo@marketing.com', 'Busco optimización de campaña publicitaria', 'Contactado'),
(4, 'Valentina', 'Ortega', 'valentina.ortega@tecnologia.com', 'Necesito traducción de manual técnico', 'Pendiente'),
(5, 'Andrés', 'Moreno', 'andres.moreno@eventos.com', 'Requiero sesión fotográfica para catálogo', 'Revisado'),
(6, 'Lucía', 'Serrano', 'lucia.serrano@blog.com', 'Busco contenidos para blog de tecnología', 'Contactado'),
(7, 'Gabriel', 'Navarro', 'gabriel.navarro@ecommerce.com', 'Desarrollo de plataforma web completa', 'Pendiente'),
(8, 'Carolina', 'Reyes', 'carolina.reyes@branding.com', 'Rediseño de identidad corporativa', 'Revisado'),
(9, 'Miguel', 'Fuentes', 'miguel.fuentes@educacion.com', 'Animación explicativa para curso online', 'Contactado'),
(10, 'Daniela', 'Vega', 'daniela.vega@comunicaciones.com', 'Edición de video promocional', 'Pendiente');