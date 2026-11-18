USE monitoreo_hospitales;

-- TABLA 1: EMPRESAS

CREATE TABLE empresas (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    cuit VARCHAR(13),
    email VARCHAR(100),
    telefono VARCHAR(20)
);

-- TABLA 2: HOSPITALES

CREATE TABLE hospitales (
    id_hospital INT AUTO_INCREMENT PRIMARY KEY,
    id_empresa INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    localidad VARCHAR(100),

    FOREIGN KEY (id_empresa)
        REFERENCES empresas(id_empresa)
);

-- TABLA 3: SECTORES

CREATE TABLE sectores (
    id_sector INT AUTO_INCREMENT PRIMARY KEY,
    id_hospital INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),

    FOREIGN KEY (id_hospital)
        REFERENCES hospitales(id_hospital)
);

-- TABLA 4: SENSORES

CREATE TABLE sensores (
    id_sensor INT AUTO_INCREMENT PRIMARY KEY,
    id_sector INT NOT NULL,
    codigo_sensor VARCHAR(50) NOT NULL UNIQUE,
    tipo_equipo ENUM('Heladera', 'Freezer', 'Ultrafreezer') NOT NULL,
    ubicacion VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (id_sector)
        REFERENCES sectores(id_sector)
);

-- TABLA 5: REGISTROS DE TEMPERATURA

CREATE TABLE registros_temperatura (
    id_registro BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_sensor INT NOT NULL,
    temperatura DECIMAL(6,2) NOT NULL,
    fecha_hora DATETIME NOT NULL,

    FOREIGN KEY (id_sensor)
        REFERENCES sensores(id_sensor),

    INDEX idx_sensor_fecha (id_sensor, fecha_hora)
);
