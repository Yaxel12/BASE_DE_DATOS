-- CAMBIOS

-- Agregue una columna al video llamada Popular para saber si el video es popular o no.
ALTER TABLE E1_Video ADD COLUMN popular BOOLEAN DEFAULT FALSE;

-- Actualiza todos los vídeos con más de 20 Me gusta para que sean populares o márcalos si no son populares.
UPDATE E1_Video
SET popular = CASE WHEN likes > 20 THEN TRUE ELSE FALSE END;

-- Eliminar los comentarios con la palabra feo.
DELETE FROM E2_Comment
WHERE content LIKE '%feo%';