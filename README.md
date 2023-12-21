
# Proyecto base de datos SQL (Inmobiliaria)

Proyecto de una base de datos creada con SQL utilizando como principal herramienta MySQL. El proyecto fue basado en una Inmobiliaria.


## Ejecutar el proyecto (opción uno)

Para ejecutar el proyecto se puede realizar de dos formas distintas, la primera es ejecutar script por script.

El primer paso meternos en la carpeta `Scripts Realstate` y luego ejecutar los scripts del 1 al 7.

1 - `DBrealstate_tables.sql`: Crea la base de datos y tablas de las mismas (Incluye las de auditoría).

2 - `DBrealstate_tables.sql`:  Crea y prepara los disparadores en las correspondientes tablas para poder realizar acciones o enviar información a las tablas de auditoría.

3 - `DBrealstate_tables.sql`: Crea las funciones para poder complementar el funcionamiento de la base de datos o aclarar dudas sobre datos específicos.

4 - `DBrealstate_tables.sql`: Crea procedimientos para poder simplificar lineas de codigo y realizar inserciónes de datos de forma acotada y simple.

5 - `DBrealstate_tables.sql`: Utilizando los procedimientos inserta los datos en las tablas y los relaciona entre si.

6 - `DBrealstate_tables.sql`: Utilizando Joins crea views de las relaciones de las tablas más importantes.

7 - `DBrealstate_tables.sql`: Crea los usuarios con sus respectivas restrincciones para realizar un eficiente control de la tabla.


## Ejecutar el proyecto (opción dos)


La opción dos es más facil, simplemente nos metemos a la carpeta `Scripts Realstate` y luego ejecutamos el backup de la base que se encuentra con el numero "8".

8 - `DBrealstate_backup.sql`: Es el backup de la base de datos despúes de correr los archivos del 1 - 7. (Se puede ejecutar solo este archivo para obtener el mismo resultado)

# Modelo Entidad - Relación

![App Screenshot](https://drive.google.com/uc?id=12KWXhZqr3LQghn3qzd4Pvl0uc2nrYdzi)


## Documentación

[Documentación funcional.](https://github.com/JoaRodDev/RealStateCompanyDB-SQL/blob/main/Documental%20Funcional.pdf)


### Herramientas
**MySQL:** Se realizo el mayor porcentaje del proyecto, desde la creación de la base hasta la inserción de datos.

**Excel:** Se utilizó para armar una guía de lo que serían las futuras tablas y para exportar los datos a archivos CSV.

**Git y GitHub:** Fue la principal herramienta para poder versionar el codigo y separarlo en diferentes ramas para una mayor comprensión del proyecto.

**Power Bi:** Se generaron reportes visuales, gracias a los datos, podemos generar análisis que nos sirve para la toma de decisiones.


### Autor del proyecto

- [Joaquín Rodríguez](https://www.linkedin.com/in/joaquinrodriguez-dev/)
