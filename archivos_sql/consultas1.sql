WITH UltimasCitas AS (
    SELECT 
        c.id_cita,
        c.id_mascota,
        ROW_NUMBER() OVER(PARTITION BY c.id_mascota ORDER BY c.fecha_hora DESC) as rn
    FROM Citas c
)
SELECT 
    d.nombre AS nombre_dueno,
    m.nombre AS nombre_mascota,
    COALESCE(SUM(ct.costo), 0) AS costo_total_ultima_cita
FROM UltimasCitas uc
JOIN Mascotas m ON uc.id_mascota = m.id_mascota
JOIN Duenos d ON m.id_dueno = d.id_dueno
LEFT JOIN Citas_Tratamientos ct ON uc.id_cita = ct.id_cita
WHERE uc.rn = 1
GROUP BY d.nombre, m.nombre;