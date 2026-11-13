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