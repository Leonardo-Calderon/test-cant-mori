# Prueba Técnica: Sistema para Clínica Veterinaria

Este repositorio contiene la solución a la prueba técnica para la digitalización de la operación de una clínica veterinaria. El proyecto incluye el modelado de la base de datos, la justificación de su normalización, y los scripts SQL para la creación de tablas, inserción de datos de prueba y consultas solicitadas.

---

## Contexto y Requerimientos del Negocio

La clínica necesita dejar atrás los registros en papel para no perder el rastro de los tratamientos de sus pacientes. Las reglas de negocio implementadas son las siguientes:

* **Dueños y Mascotas:** Un dueño puede tener varias mascotas (1:N), pero cada mascota pertenece a un solo dueño.
* **Citas:** Se registra la fecha, hora y motivo de la consulta.
* **Médicos:** La clínica cuenta con varios veterinarios. Cada cita es atendida por un solo médico.
* **Tratamientos:** En una cita se pueden recetar múltiples tratamientos (medicamentos o procedimientos). Es fundamental registrar la dosis y el costo específico de cada tratamiento durante esa consulta.

---

## Modelado (Diseño Entidad-Relación)

A continuación, se presenta el diagrama Entidad-Relación (ERD) que modela la solución. Se utilizó una tabla intermedia (`CITA_TRATAMIENTO`) para resolver la relación de muchos a muchos entre las citas y los tratamientos del catálogo, permitiendo guardar el costo y dosis específicos por evento.

```mermaid
erDiagram
    DUEÑO ||--o{ MASCOTA : posee
    MASCOTA ||--o{ CITA : realiza
    MÉDICO ||--o{ CITA : atiende
    CITA ||--o{ CITA_TRATAMIENTO : incluye
    TRATAMIENTO ||--o{ CITA_TRATAMIENTO : es_recetado_en

    DUEÑO {
        int id_dueno PK
        string nombre
        string telefono
    }

    MASCOTA {
        int id_mascota PK
        string nombre
        int id_dueno FK
    }

    MÉDICO {
        int id_medico PK
        string nombre
        string especialidad
    }

    CITA {
        int id_cita PK
        datetime fecha_hora
        string motivo
        int id_mascota FK
        int id_medico FK
    }

    TRATAMIENTO {
        int id_tratamiento PK
        string nombre_descripcion
    }

    CITA_TRATAMIENTO {
        int id_cita FK, PK
        int id_tratamiento FK, PK
        string dosis
        decimal costo
    }


