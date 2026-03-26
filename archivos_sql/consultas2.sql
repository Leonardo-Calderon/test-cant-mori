SELECT 
    d.nombre AS nombre_dueno,
    m.nombre AS nombre_mascota,
    d.telefono
FROM Mascotas m
JOIN Duenos d ON m.id_dueno = d.id_dueno
WHERE m.nombre LIKE '%@ParametroBusqueda%' 
   OR d.nombre LIKE '%@ParametroBusqueda%';