#!/bin/bash

# Verifica que se proporcionó el parámetro necesario
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <date>"
    exit 1
fi

DATE=$1

echo "Date: $DATE"

# Ejecuta el pipeline de Python con la fecha
python dlt_pipeline.py "$DATE"

# Cambia al directorio de dbt
cd taxis_chicago

# Ejecuta las transformaciones de dbt
dbt run --profiles-dir .

# Ejecuta los tests de dbt
dbt test --profiles-dir .

# Verifica si los tests han pasado
if [ $? -eq 0 ]; then
  echo "Tests passed. Proceeding with publish."
  # Ejecuta la operación de publish en dbt
  dbt run-operation publish --profiles-dir . --target green
else
  echo "Tests failed. Aborting publish."
  exit 1
fi

# Regresa al directorio principal
cd ..

# Ejecuta la aplicación de Streamlit
streamlit run streamlit/app.py --server.port 8080 

