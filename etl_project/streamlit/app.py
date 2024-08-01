import streamlit as st
import duckdb

# Conexión a la base de datos
con = duckdb.connect(database='/etl_project/taxis_chicago/dev.duckdb', read_only=True)

# Título
st.title("Chicago Taxis")

# Filtro de fechas
min_date, max_date = con.execute(
                                '''
                                SELECT 
                                    MIN(CAST(start_timestamp AS DATE)), 
                                    MAX(CAST(start_timestamp AS DATE))
                                FROM 
                                    dbt_green.fact_taxi_trips
                                '''
                                ).fetchone()

start_date, end_date = st.sidebar.date_input("Selecciona una fecha", [min_date, max_date])

# Consulta para filtrar los datos
query = """
        SELECT 
            CAST(start_timestamp AS DATE) AS fecha, 
            AVG(trip_total_amount_eur) AS avg_amount
        FROM 
            dbt_green.fact_taxi_trips
        WHERE 
            trip_start_date BETWEEN ? AND ?
        GROUP BY 
            fecha
        """
df = con.execute(query, (start_date, end_date)).df()


# Gráfico de líneas con el precio medio por dia
st.subheader("Precio medio por viaje al día")
df_daily = df.groupby('fecha')['avg_amount'].sum().reset_index()
st.line_chart(df_daily, x='fecha', y='avg_amount')


