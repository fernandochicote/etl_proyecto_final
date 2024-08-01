import requests
import pandas as pd
import os
import argparse

def generate_url(date):
    url = f'https://data.cityofchicago.org/resource/wrvz-psew.csv?$where=trip_start_timestamp%20between%20%27{date}T00:00:00%27%20and%20%27{date}T23:59:59%27'
    return url 

# Función para descargar el archivo CSV desde una URL específica
def download_csv(url, path):
    response = requests.get(url)
    if response.status_code == 200:
        with open(path, 'wb') as file:
            file.write(response.content)
        print(f"Archivo descargado y guardado en {path}")
    else:
        raise Exception(f"Error al descargar el archivo. Código de estado: {response.status_code}")

# Función para leer el archivo CSV en un DataFrame de pandas
def read_csv_to_dataframe(path):
    return pd.read_csv(path)

# Función para guardar el DataFrame en un archivo CSV
def save_dataframe_to_filesystem(df, path):
    df.to_csv(path, index=False)
    print(f"DataFrame guardado en {path}")

def ingest_csv(date):
    local_csv_path = f"chicago_taxi_data_{date.replace('-', '')}.csv"
    url = generate_url(date)

    download_csv(url, local_csv_path)
    df = read_csv_to_dataframe(local_csv_path)
    
    dest_dir = "/etl_project/taxis_chicago/data/bronze"
    source_name = "chicago_taxi"
    table_name = "taxi_trips"
    date_partition = date.replace('-', '_')
    
    processed_dir = os.path.join(dest_dir, source_name, table_name, date_partition)
    if not os.path.exists(processed_dir):
        os.makedirs(processed_dir)
    
    filename = f"chicago_taxi_data_{date.replace('-', '')}.csv"
    processed_path = os.path.join(processed_dir, filename)
    save_dataframe_to_filesystem(df, processed_path)
    
# Ejecutar el pipeline para una lista de fechas y URLs correspondientes
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Ingest Chicago taxi data for a specific date')
    parser.add_argument('date', type=str, help='Date in YYYY-MM-DD format')
    args = parser.parse_args()
    
    # Obtener la fecha del argumento de línea de comandos
    date = args.date

    ingest_csv(date)
    
    local_csv_path = f"chicago_taxi_data_{date.replace('-', '')}.csv"
    
    # Verifica si el archivo existe y elimínalo
    if os.path.exists(local_csv_path):
        os.remove(local_csv_path)
        print(f'Archivo {local_csv_path} eliminado con éxito.')
    else:
        print(f'El archivo {local_csv_path} no existe.')
