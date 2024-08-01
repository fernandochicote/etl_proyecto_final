# ETL Proyecto Final

## Descripción

Este proyecto de ETL (Extract, Transform, Load) procesa datos de taxis de Chicago, realiza transformaciones necesarias, ejecuta pruebas de calidad y visualiza los resultados en una aplicación de Streamlit.

## Requisitos

- Docker
- Docker Compose

## Detalles de los Archivos

#### Dockerfile
Este archivo define la imagen de Docker que se utiliza para el proyecto. Incluye la instalación de Python, DBT, DuckDB y Streamlit, así como las dependencias necesarias.

#### docker-compose.yml
Este archivo define los servicios necesarios para ejecutar el proyecto utilizando Docker Compose. Incluye la configuración del contenedor de Docker para el proyecto ETL.

#### orquestador.sh
Este script automatiza la ejecución del pipeline de ETL, incluyendo la ejecución de las transformaciones de DBT, las pruebas y la publicación de los resultados si los tests pasan.

## Configuración

### 1. Clonar el Repositorio

```sh
git clone https://github.com/fernandochicote/etl_proyecto_final.git
cd etl_proyecto_final
```

### 2. Construir e inciar la imagen de Docker

```sh
docker-compose up --build
```

### 4. Ejecutar el Pipeline de ETL

```sh
docker exec -it etl_project bash -c "./orquestador.sh YYYY-MM-DD"
```

Ejemplo:
```sh
docker exec -it etl_project bash -c "./orquestador.sh 2023-01-16"
```
