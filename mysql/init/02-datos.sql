USE monitoreo_hospitales;

-- EMPRESA

INSERT INTO empresas (id_empresa, nombre, cuit, email, telefono)
VALUES
(1, 'UNSAM', '30-12345678-9',
'unsam@unsam.edu.ar', '011-4567-8900');


-- HOSPITALES

INSERT INTO hospitales (id_hospital, id_empresa, nombre, direccion, localidad)
VALUES
(1, 1, 'Hospital Central', 'Av. San Martin 1500', 'Buenos Aires'),
(2, 1, 'Hospital Norte', 'Av. Maipu 2500', 'Vicente Lopez'),
(3, 1, 'Hospital San Martin', 'Av. Mitre 1500', 'Avellaneda');


-- SECTORES

INSERT INTO sectores (id_sector, id_hospital, nombre, descripcion)
VALUES
(1, 1, 'Farmacia', 'Almacenamiento de medicamentos'),
(2, 1, 'Laboratorio', 'Conservacion de muestras'),
(3, 2, 'Vacunatorio', 'Almacenamiento de vacunas'),
(4, 3, 'Farmacia', 'Conservacion de medicamentos');


-- SENSORES

INSERT INTO sensores
(id_sensor, id_sector, codigo_sensor, tipo_equipo, ubicacion, activo)
VALUES
(1, 1, 'TEMP-001', 'Heladera', 'Heladera de farmacia', TRUE),
(2, 1, 'TEMP-002', 'Freezer', 'Freezer de farmacia', TRUE),
(3, 2, 'TEMP-003', 'Ultrafreezer', 'Laboratorio', TRUE),
(4, 3, 'TEMP-004', 'Heladera', 'Heladera de vacunas', TRUE),
(5, 4, 'TEMP-005', 'Heladera', 'Heladera de medicamentos', TRUE);


-- REGISTROS DE TEMPERATURA

INSERT INTO registros_temperatura
(id_sensor, temperatura, fecha_hora)
VALUES
(1, 4, '2026-01-05 08:00:00'),
(1, 4, '2026-01-05 09:00:00'),
(1, 5, '2026-01-05 10:00:00'),

(2, -18, '2026-01-05 08:00:00'),
(2, -19, '2026-01-05 09:00:00'),

(3, -80, '2026-01-07 08:00:00'),
(3, -79, '2026-01-07 09:00:00'),

(4, 3, '2026-05-07 08:00:00'),
(4, 4, '2026-05-07 09:00:00'),

(5, 4, '2026-05-09 08:00:00'),
(5, 4, '2026-05-09 09:00:00');
