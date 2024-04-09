from sqlalchemy import create_engine, Column, Integer, String, Text, ForeignKey, Date, DECIMAL, ARRAY
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

# Crear una instancia de la base declarativa
Base = declarative_base()

# Definición de los modelos de las tablas
class Usuario(Base):
    __tablename__ = 'usuario'
    
    ID_usuario = Column(Integer, primary_key=True, autoincrement=True)
    nombre = Column(String(50), nullable=False)
    correo_electronico = Column(String(100), unique=True, nullable=False)
    contrasena = Column(String(50), nullable=False)
    metas = Column(Text)
    preferencias = Column(Text)
    
    rutinas = relationship('RutinaEjercicio', secondary='usuario_rutinaejercicio')
    planes = relationship('PlanAlimentacion', secondary='usuario_planalimentacion')
    progresos = relationship('ProgresoUsuario', back_populates='usuario')

class RutinaEjercicio(Base):
    __tablename__ = 'rutinaejercicio'
    
    ID_rutina = Column(Integer, primary_key=True, autoincrement=True)
    nombre = Column(String(100), nullable=False)
    tipo = Column(String(50))
    duracion = Column(Integer)
    descripcion = Column(Text)
    
    usuarios = relationship('Usuario', secondary='usuario_rutinaejercicio')
    progresos = relationship('ProgresoRutinaEjercicio', back_populates='rutina')

class PlanAlimentacion(Base):
    __tablename__ = 'planalimentacion'
    
    ID_plan = Column(Integer, primary_key=True, autoincrement=True)
    nombre = Column(String(100), nullable=False)
    tipo = Column(String(50))
    descripcion = Column(Text)
    lista_alimentos = Column(ARRAY(String))
    
    usuarios = relationship('Usuario', secondary='usuario_planalimentacion')
    progresos = relationship('ProgresoPlanAlimentacion', back_populates='plan')

class ProgresoUsuario(Base):
    __tablename__ = 'progresousuario'
    
    ID_progreso = Column(Integer, primary_key=True, autoincrement=True)
    ID_usuario = Column(Integer, ForeignKey('usuario.ID_usuario'))
    fecha = Column(Date, nullable=False)
    peso = Column(DECIMAL(5, 2))
    medidas = Column(Text)
    comentarios = Column(Text)
    
    usuario = relationship('Usuario', back_populates='progresos')
    rutinas = relationship('ProgresoRutinaEjercicio', back_populates='progreso')
    planes = relationship('ProgresoPlanAlimentacion', back_populates='progreso')

class ProgresoRutinaEjercicio(Base):
    __tablename__ = 'progresorutinaejercicio'
    
    ID_progreso = Column(Integer, ForeignKey('progresousuario.ID_progreso'), primary_key=True)
    ID_rutina = Column(Integer, ForeignKey('rutinaejercicio.ID_rutina'), primary_key=True)
    
    progreso = relationship('ProgresoUsuario', back_populates='rutinas')
    rutina = relationship('RutinaEjercicio', back_populates='progresos')

class ProgresoPlanAlimentacion(Base):
    __tablename__ = 'progresoplanalimentacion'
    
    ID_progreso = Column(Integer, ForeignKey('progresousuario.ID_progreso'), primary_key=True)
    ID_plan = Column(Integer, ForeignKey('planalimentacion.ID_plan'), primary_key=True)
    
    progreso = relationship('ProgresoUsuario', back_populates='planes')
    plan = relationship('PlanAlimentacion', back_populates='progresos')

# Crear la base de datos y las tablas
engine = create_engine('postgresql://usuario:contraseña@localhost:5432/nombre_basedatos')
Base.metadata.create_all(engine)
