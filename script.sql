create DATABASE sitema_ayuda;
USE sistema_ayuda;
SHOW TABLE:
CREATE TABLE hogar (
    id INTEGER PRIMARY KEY,
    
);
ALTER TABLE hogar
    -> ADD nomPersonaContacto VARCHAR(50) NOT NULL,
    -> ADD apePersonaContacto VARCHAR(50) NOT NULL,
    -> ADD numPersonaContacto VARCHAR(15) NOT NULL,
    -> ADD numIntegrantes VARCHAR(15) NOT NULL,
    -> ADD nivelSocioEconomico VARCHAR(20) NOT NULL,
    -> ADD discapacidadSoN BOOLEAN NOT NULL,
    -> ADD niñezSoN BOOLEAN NOT NULL,
    -> ADD adultoMayorSoN BOOLEAN NOT NULL;

CREATE TABLE familia (
    -> id INTEGER PRIMARY KEY,
    -> nombreFamiliar VARCHAR(50) NOT NULL,
    -> nomCf VARCHAR(50) NOT NULL,
    -> apedCf VARCHAR(50) NOT NULL,
    -> numCf VARCHAR(15) NOT NULL);

CREATE TABLE miembros (
    -> id INTEGER PRIMARY KEY,
    -> nombreM VARCHAR(50) NOT NULL,
    -> apellidoM VARCHAR(50) NOT NULL,
    -> parentesco VARCHAR(50) NOT NULL,
    -> fechaNacimiento DATE NOT NULL,
    -> edad TINYINT NULL,
    -> genero CHAR(1) NOT NULL);

CREATE TABLE necesidad (
    -> id INTEGER PRIMARY KEY,
    -> nivelAtencion VARCHAR(15) NOT NULL,
    -> tipoNecesidad VARCHAR(15) NOT NULL,
    -> tipoAtencion VARCHAR(15) NOT NULL,
    -> nivelPrioridad VARCHAR(15) NOT NULL);

CREATE TABLE registro (
    ->      id INTEGER PRIMARY KEY,
    ->      nomRegistro VARCHAR(50) NOT NULL,
    ->      numRegistro VARCHAR(50) NOT NULL,
    ->      fechaRegistro DATETIME NOT NULL,
    ->      tipoRegistro VARCHAR(30) NOT NULL);

 CREATE TABLE reporte_hogar (
    -> id INTEGER PRIMARY KEY,
    -> nomPersonaContacto VARCHAR(50) NOT NULL,
    -> numPersonaContacto VARCHAR(50) NOT NULL,
    -> fechaReporte DATE NOT NULL,
    -> estadoReporte VARCHAR(15) NOT NULL);

CREATE TABLE zona_ubicacion (
    -> id INTEGER PRIMARY KEY,
    -> direccion VARCHAR(100) NULL,
    -> locacionAlternativa VARCHAR(100) NULL,
    -> usoZona VARCHAR(50) NOT NULL,
    -> tipoZona VARCHAR(30) NOT NULL,
    -> subZonaUno VARCHAR(50) NOT NULL,
    -> subZonaDos VARCHAR(50) NOT NULL);

CREATE TABLE entrega (
    -> id INTEGER PRIMARY KEY,
    -> fechaEntrega DATETIME NOT NULL);

 CREATE TABLE responsable (
    -> id INTEGER PRIMARY KEY,
    -> nomResponsable VARCHAR(50) NOT NULL,
    -> apeResponsable VARCHAR(50) NOT NULL,
    -> numResponsable VARCHAR(15) NOT NULL,
    -> docResponsable VARCHAR(20) NOT NULL UNIQUE);

CREATE TABLE tipo_ayuda (
    -> id INTEGER PRIMARY KEY,
    -> nivelUrgencia VARCHAR(15) NOT NULL,
    -> tipoAyuda VARCHAR(15) NOT NULL,
    -> mediaEstandar VARCHAR(15) NOT NULL);

 CREATE TABLE inventario (
    -> id INTEGER PRIMARY KEY,
    -> tipoElemento VARCHAR(50) NOT NULL,
    -> cantidadElemento INTEGER NOT NULL,
    -> registroElemento VARCHAR(50) NOT NULL);

 CREATE TABLE donacion (
    -> id INTEGER PRIMARY KEY,
    -> tipoDonacion VARCHAR(50) NOT NULL,
    -> tipoUnidad VARCHAR(20) NOT NULL,
    -> cantidadUnidad DECIMAL(10,2) NOT NULL,
    -> fechaDonacion DATETIME NOT NULL);

CREATE TABLE donante (
    -> id INTEGER PRIMARY KEY,
    -> nomDonante VARCHAR(50) NOT NULL,
    -> apeDonante VARCHAR(20) NOT NULL,
    -> numDonante VARCHAR(20) NOT NULL,
    -> docDonante VARCHAR(20) NOT NULL UNIQUE);

ALTER TABLE miembros
    -> ADD idFamilia INTEGER NOT NULL;
 ALTER TABLE miembros ADD FOREIGN KEY (idFamilia) REFERENCES familia(id);

ALTER TABLE registro
    -> ADD idResponsable INTEGER NOT NULL,
    -> ADD idReporteHogar INTEGER NOT NULL;

ALTER TABLE registro ADD FOREIGN KEY (idResponsable) REFERENCES responsable(id);
ALTER TABLE registro ADD FOREIGN KEY (idReporteHogar) REFERENCES reporte_hogar(id);

ALTER TABLE reporte_hogar
    -> ADD idHogar INTEGER NOT NULL,
    -> ADD idZonaUbicacion INTEGER NOT NULL;
ALTER TABLE reporte_hogar ADD FOREIGN KEY (idHogar) REFERENCES hogar(id);
ALTER TABLE reporte_hogar ADD FOREIGN KEY (idZonaUbicacion) REFERENCES zona_ubicacion(id);
ALTER TABLE reporte_hogar
    -> ADD idNecesidad INTEGER NOT NULL;
ALTER TABLE reporte_hogar ADD FOREIGN KEY (idNecesidad) REFERENCES necesidad(id);

ALTER TABLE entrega
    -> ADD idZonaUbicacion INTEGER NOT NULL,
    -> ADD idTipoAyuda INTEGER NOT NULL,
    -> ADD idResponsable INTEGER NOT NULL,
    -> ADD idRegistro INTEGER NOT NULL;
ALTER TABLE entrega ADD FOREIGN KEY (idZonaUbicacion) REFERENCES zona_ubicacion(id);
ALTER TABLE entrega ADD FOREIGN KEY (idTipoAyuda) REFERENCES tipo_ayuda(id);
ALTER TABLE entrega ADD FOREIGN KEY (idResponsable) REFERENCES responsable(id);
ALTER TABLE entrega ADD FOREIGN KEY (idRegistro) REFERENCES registro(id);

 ALTER TABLE tipo_ayuda
    -> ADD idNecesidad INTEGER NOT NULL,
    -> ADD idInventario INTEGER NOT NULL;

ALTER TABLE tipo_ayuda ADD FOREIGN KEY (idNecesidad) REFERENCES necesidad(id);
ALTER TABLE tipo_ayuda ADD FOREIGN KEY (idInventario) REFERENCES inventario(id);

ALTER TABLE inventario
    -> ADD idDonacion;
 ALTER TABLE inventario ADD FOREIGN KEY (idDonacion) REFERENCES donacion(id);

ALTER TABLE donacion
    -> ADD idDonante INTEGER NOT NULL;
ALTER TABLE donacion ADD FOREIGN KEY (idDonante) REFERENCES donante(id);