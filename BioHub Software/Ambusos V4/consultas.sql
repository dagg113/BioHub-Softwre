-- 1. Consultar las ambulancias que tienen el mismo plan que la ambulancia con el id 5.
-- Finalidad: Permite identificar otras ambulancias con características similares (mismo plan), lo que puede ser útil para intercambios de servicio o mantenimiento.
SELECT id, placa, disponibilidad, plan 
FROM ambulancias
WHERE plan = (
    SELECT plan 
    FROM ambulancias
    WHERE id = 5
);

-- 2. Mostrar todas las ambulancias en mantenimiento ordenadas por la prioridad del plan.
-- Finalidad: Ayuda a decidir el orden en el que se reparan las ambulancias, dándole prioridad a las que tienen planes más avanzados.
SELECT id, placa, disponibilidad, conductor_id, equipo_trabajo, plan, categoria_ambu
FROM ambulancias
WHERE disponibilidad = 'En mantenimiento'
ORDER BY FIELD(plan, 'Especializado 3', 'Especializado 2', 'Especializado 1', 'Avanzado 3', 'Avanzado 2', 'Avanzado 1', 'Básico 3', 'Básico 2', 'Básico 1') DESC, placa DESC;

-- 3. Identificar ambulancias cuyos conductores son personal clave y verificar disponibilidad.
-- Finalidad: Garantiza que los conductores clave (con IDs bajos, indicando mayor antigüedad o experiencia) estén asignados a ambulancias disponibles.
SELECT a.id, a.conductor_id, a.disponibilidad
FROM ambulancias a
WHERE a.conductor_id IN (
    SELECT p.id 
    FROM personal p
    WHERE p.id < 10
);

-- 4. Encontrar las ambulancias cuyo plan es el segundo más frecuente en la base de datos.
-- Finalidad: Ayuda a identificar las ambulancias que tienen el plan que es el segundo más común, lo cual es útil para analizar la distribución de recursos.
SELECT id, placa, plan
FROM ambulancias
WHERE plan = (
    SELECT plan 
    FROM ambulancias
    GROUP BY plan
    ORDER BY COUNT(*) DESC
    LIMIT 1 OFFSET 1
);

-- 5. Mostrar todas las ambulancias en servicio ordenadas por id del conductor de menor a mayor.
-- Finalidad: Muestra todas las ambulancias que están activamente en servicio, ordenadas por conductor, lo que permite una asignación más organizada.
SELECT id, placa, disponibilidad, conductor_id, equipo_trabajo, plan, categoria_ambu
FROM ambulancias
WHERE disponibilidad = 'En servicio'
ORDER BY conductor_id ASC;

-- 6. Mostrar ambulancias con planes superiores para reasignación de recursos avanzados.
-- Finalidad: Identifica ambulancias con un plan superior al de la ambulancia con id 8, útil para reasignar ambulancias avanzadas en situaciones de emergencia.
SELECT id, placa, plan
FROM ambulancias
WHERE FIELD(plan, 'Básico 1', 'Básico 2', 'Básico 3', 'Avanzado 1', 'Avanzado 2', 'Avanzado 3', 'Especializado 1', 'Especializado 2', 'Especializado 3') > (
    SELECT FIELD(plan, 'Básico 1', 'Básico 2', 'Básico 3', 'Avanzado 1', 'Avanzado 2', 'Avanzado 3', 'Especializado 1', 'Especializado 2', 'Especializado 3')
    FROM ambulancias
    WHERE id = 8
);

-- 7. Encontrar las ambulancias cuyo plan y disponibilidad no se repiten en más de una ambulancia.
-- Finalidad: Identifica ambulancias únicas en términos de plan y disponibilidad, lo que puede ser útil para asignaciones especializadas o auditorías.
SELECT id, plan, disponibilidad
FROM ambulancias
WHERE (plan, disponibilidad) IN (
    SELECT plan, disponibilidad 
    FROM ambulancias
    GROUP BY plan, disponibilidad
    HAVING COUNT(*) = 1
);

-- 8. Listar las ambulancias cuyos conductores tienen una mayor experiencia (id mayor al promedio).
-- Finalidad: Identifica ambulancias conducidas por personal con experiencia (ID mayor que el promedio), para asegurar que personal experimentado esté a cargo de situaciones críticas.
SELECT placa 
FROM ambulancias
WHERE conductor_id IN (
    SELECT id 
    FROM personal
    WHERE id > (
        SELECT AVG(id) 
        FROM personal
    )
);

-- 9. Obtener los id, categoria_ambu de las ambulancias que están en mantenimiento y cuyo categoria_ambu coincide con la categoria_ambu más frecuente.
-- Finalidad: Prioriza la reparación de ambulancias en mantenimiento que pertenecen a la categoría más común, optimizando el uso de recursos.
SELECT id, categoria_ambu
FROM ambulancias
WHERE disponibilidad = 'En mantenimiento'
  AND categoria_ambu = (
      SELECT categoria_ambu 
      FROM ambulancias
      GROUP BY categoria_ambu
      ORDER BY COUNT(*) DESC
      LIMIT 1
  );

-- 10. Identificar las ambulancias en servicio con el menor equipo de trabajo para optimizar asignación de personal.
-- Finalidad: Ayuda a redistribuir personal de manera eficiente, identificando ambulancias en servicio que tienen menos equipo de trabajo asignado.
SELECT id, placa, disponibilidad 
FROM ambulancias
WHERE equipo_trabajo = (
    SELECT MIN(equipo_trabajo) 
    FROM ambulancias
    WHERE disponibilidad = 'En servicio'
);






