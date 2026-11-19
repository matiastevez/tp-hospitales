# Monitoreo de Temperaturas Hospitalarias

Trabajo práctico de Administración de Sistemas GNU/Linux y Virtualización Avanzada.

## Descripción

El proyecto consiste en crear una base de datos MySQL utilizando Docker Compose.

La base de datos guarda información de una empresa que tiene hospitales como clientes. Cada hospital tiene distintos sectores donde hay sensores de temperatura instalados en heladeras, freezers y ultrafreezers.

También se guardan las temperaturas registradas por cada sensor, junto con la fecha y hora de cada medición.

## Herramientas utilizadas

- Ubuntu
- Docker
- Docker Compose
- MySQL 8.4
- phpMyAdmin
- Git y GitHub

## Arquitectura

El proyecto utiliza Docker Compose para ejecutar dos contenedores:

- **MySQL:** almacena la base de datos y sus registros.
- **phpMyAdmin:** permite administrar la base de datos desde el navegador.

Los contenedores se comunican mediante la red interna de Docker Compose.

Para guardar los datos utilizamos un volumen de Docker. Esto permite conservar la información aunque se elimine el contenedor.

## Requisitos

Para ejecutar el proyecto es necesario tener instalados:

- Docker Engine
- Docker Compose
- Git

## Instalación

Primero descargamos el repositorio desde GitHub:

```bash
git clone https://github.com/matiastevez/tp-hospitales.git
```

Ingresamos a la carpeta del proyecto:

```bash
cd tp-hospitales
```

Creamos el archivo `.env`:

```bash
cp .env.example .env
```

Editamos el archivo:

```bash
vim .env
```

Configuramos las contraseñas de MySQL y guardamos los cambios.

Después iniciamos los contenedores:

```bash
sudo docker compose up -d
```

Comprobamos que estén funcionando:

```bash
sudo docker compose ps
```

## Base de datos

La base de datos se llama `monitoreo_hospitales` y tiene cinco tablas:

- `empresas`: guarda los datos de la empresa.
- `hospitales`: guarda los hospitales clientes.
- `sectores`: guarda los sectores de cada hospital.
- `sensores`: guarda los sensores instalados.
- `registros_temperatura`: guarda las temperaturas registradas por cada sensor, con su fecha y hora.

Para ingresar a MySQL ejecutamos:

```bash
sudo docker compose exec mysql mysql -u admlinux -p
```

Ingresamos la contraseña configurada para el usuario `admlinux`.

## Acceso a phpMyAdmin

Para ingresar a phpMyAdmin abrimos el navegador de Ubuntu y escribimos:

`http://localhost:8085`

Ingresamos con el usuario `admlinux` y su contraseña.

Desde phpMyAdmin podemos consultar las tablas, agregar registros y modificar los datos de la base.

## Pruebas

Para verificar que los contenedores estén funcionando ejecutamos:

```bash
sudo docker compose ps
```

Para comprobar que la base de datos funciona, ingresamos a MySQL:

```bash
sudo docker compose exec mysql mysql -u admlinux -p
```

Seleccionamos la base de datos:

```sql
USE monitoreo_hospitales;
```

Mostramos las tablas:

```sql
SHOW TABLES;
```

Deberían aparecer las cinco tablas del proyecto.

También podemos consultar los hospitales registrados:

```sql
SELECT * FROM hospitales;
```

Para salir de MySQL:

```sql
exit;
```

## Almacenamiento de datos

Utilizamos un volumen de Docker para guardar la información de MySQL.

De esta manera, los datos no se pierden al detener, eliminar y volver a crear el contenedor.

Para comprobarlo podemos detener los contenedores:

```bash
sudo docker compose down
```

Volver a iniciarlos:

```bash
sudo docker compose up -d
```

Y verificar que los registros siguen guardados en la base de datos.

## Detención

Para detener y eliminar los contenedores sin borrar los datos:

```bash
sudo docker compose down
```

Para volver a iniciarlos:

```bash
sudo docker compose up -d
```

## Limpieza

Para eliminar los contenedores y la red creada por Docker Compose:

```bash
sudo docker compose down
```

Si también queremos eliminar el volumen donde se guarda la base de datos:

```bash
sudo docker compose down -v
```

**Importante:** este último comando elimina permanentemente los datos almacenados en el volumen del proyecto.
