--borrador
create table usuario
 ID_usuario SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    metas TEXT,
    preferencias TEXT
);

CREATE TABLE RutinaEjercicio (
    ID_rutina SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    duracion INTEGER,
    descripcion TEXT
);
CREATE TABLE PlanAlimentacion (
    ID_plan SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    descripcion TEXT,
    lista_alimentos TEXT[]
);

CREATE TABLE ProgresoUsuario (
    ID_progreso SERIAL PRIMARY KEY,
    ID_usuario INTEGER REFERENCES Usuario(ID_usuario),
    fecha DATE NOT NULL,
    peso DECIMAL(5, 2),
    medidas TEXT,
    comentarios TEXT
);

CREATE TABLE Usuario_RutinaEjercicio (
    ID_usuario INTEGER REFERENCES Usuario(ID_usuario),
    ID_rutina INTEGER REFERENCES RutinaEjercicio(ID_rutina),
    PRIMARY KEY (ID_usuario, ID_rutina)
);

CREATE TABLE Usuario_PlanAlimentacion (
    ID_usuario INTEGER REFERENCES Usuario(ID_usuario),
    ID_plan INTEGER REFERENCES PlanAlimentacion(ID_plan),
    PRIMARY KEY (ID_usuario, ID_plan)
);

CREATE TABLE Progreso_RutinaEjercicio (
    ID_progreso INTEGER REFERENCES ProgresoUsuario(ID_progreso),
    ID_rutina INTEGER REFERENCES RutinaEjercicio(ID_rutina),
    PRIMARY KEY (ID_progreso, ID_rutina)
);

CREATE TABLE Progreso_PlanAlimentacion (
    ID_progreso INTEGER REFERENCES ProgresoUsuario(ID_progreso),
    ID_plan INTEGER REFERENCES PlanAlimentacion(ID_plan),
    PRIMARY KEY (ID_progreso, ID_plan)
);
