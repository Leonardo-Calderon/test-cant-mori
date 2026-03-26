-- 1. Insertar Dueños
INSERT INTO Duenos (id_dueno, nombre, telefono) VALUES
(1, 'Carlos Slim', 492637881),
(2, 'Ana Gabriel', 492714537),
(3, 'Luis Miguel', 492876749);

-- 2. Insertar Mascotas (Carlos tiene 2 mascotas, Ana 1 y Luis 1)
INSERT INTO Mascotas (id_mascota, nombre, id_dueno) VALUES
(1, 'Firulais', 1),
(2, 'Garfield', 1),
(3, 'Milaneso', 2),
(4, 'Sol', 3);

-- 3. Insertar Médicos Veterinarios
INSERT INTO Medicos (id_medico, nombre, especialidad) VALUES
(1, 'Dr. Dolittle', 'Medicina General'),
(2, 'Dra. Polo', 'Cirugía y Ortopedia');

-- 4. Insertar Catálogo de Tratamientos
INSERT INTO Tratamientos (id_tratamiento, nombre_descripcion) VALUES
(1, 'Consulta General'),
(2, 'Vacuna Antirrábica'),
(3, 'Desparasitación Interna'),
(4, 'Radiografía'),
(5, 'Aplicación de Yeso');

-- 5. Insertar Citas (Observa las fechas para probar la "última cita")
INSERT INTO Citas (id_cita, fecha_hora, motivo, id_mascota, id_medico) VALUES
-- Citas antiguas
(1, '2023-01-15 10:00:00', 'Revisión anual', 1, 1),
(2, '2023-02-20 11:30:00', 'Vacunación', 2, 1),
-- Citas recientes (Estas deberían salir en la consulta de la "última cita")
(3, '2023-10-05 09:00:00', 'Dolor estomacal', 1, 1), -- Última cita de Firulais
(4, '2023-10-10 16:00:00', 'Chequeo de rutina', 2, 1), -- Última cita de Garfield
(5, '2023-10-12 12:00:00', 'Caída desde el techo', 3, 2), -- Última cita de Milaneso
(6, '2023-10-15 10:00:00', 'Vacunas cachorro', 4, 1); -- Última cita de Sol

-- 6. Insertar Detalle de Tratamientos por Cita (Dosis y Costos)
INSERT INTO Citas_Tratamientos (id_cita, id_tratamiento, dosis, costo) VALUES
(1, 1, 'N/A', 350.00),
(2, 1, 'N/A', 350.00),
(2, 2, '1 ampolleta', 200.00),
(3, 1, 'N/A', 400.00),
(3, 3, '1 pastilla (10mg)', 150.00),
(4, 1, 'N/A', 400.00),
(5, 1, 'N/A', 600.00),
(5, 4, '2 placas', 800.00),
(5, 5, 'Pierna trasera derecha', 1200.00),
(6, 1, 'N/A', 400.00),
(6, 2, '1 ampolleta', 250.00),
(6, 3, 'Medio comprimido', 100.00);