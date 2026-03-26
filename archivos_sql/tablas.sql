use db_veterinaria;
-- Creación de la tabla Dueños
CREATE TABLE Duenos (
    id_dueno INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono int(10)
);

-- Creación de la tabla Mascotas
CREATE TABLE Mascotas (
    id_mascota INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_dueno INT NOT NULL,
    FOREIGN KEY (id_dueno) REFERENCES Duenos(id_dueno)
);

-- Creación de la tabla Médicos
CREATE TABLE Medicos (
    id_medico INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100)
);

-- Creación de la tabla Citas
CREATE TABLE Citas (
    id_cita INT PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    motivo VARCHAR(255) NOT NULL,
    id_mascota INT NOT NULL,
    id_medico INT NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES Mascotas(id_mascota),
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

-- Creación del catálogo de Tratamientos
CREATE TABLE Tratamientos (
    id_tratamiento INT PRIMARY KEY,
    nombre_descripcion VARCHAR(255) NOT NULL
);

-- Creación de la tabla detalle para los Tratamientos por Cita
CREATE TABLE Citas_Tratamientos (
    id_cita INT,
    id_tratamiento INT,
    dosis VARCHAR(100) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_cita, id_tratamiento),
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamientos(id_tratamiento)
);

