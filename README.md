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
- Git

## Instalación

Para ejecutar el proyecto es necesario tener Docker y Docker Compose instalados.

Primero descargamos el repositorio e ingresamos a la carpeta del proyecto.

Creamos el archivo `.env`:

```bash
cp .env.example .env
```

Editamos el archivo `.env` y configuramos las contraseñas.

Después iniciamos el contenedor:

```bash
sudo docker compose up -d
```

## Base de datos

La base de datos se llama `monitoreo_hospitales` y tiene cinco tablas:

- `empresas`
- `hospitales`
- `sectores`
- `sensores`
- `registros_temperatura`

Para ingresar a MySQL ejecutamos:

```bash
sudo docker compose exec mysql mysql -u admlinux -p
```

## Almacenamiento de datos

Utilizamos un volumen de Docker para guardar la información de MySQL.

De esta manera, los datos no se pierden al eliminar y volver a crear el contenedor.

## Detener el contenedor

Para detener y eliminar el contenedor sin borrar los datos:

```bash
sudo docker compose down
```
