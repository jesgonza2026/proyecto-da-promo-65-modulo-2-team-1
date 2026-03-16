# proyecto-da-promo-65-modulo-2-team-1

🛒 Pandemusic: Análisis de Tendencias Musicales (2018-2022)

📋 Descripción del Proyecto

Pandemusic es un proyecto de análisis de datos desarrollado para la discográfica Adalab Records. El objetivo principal es identificar cambios en los patrones de creación y consumo musical antes, durante y después del periodo de pandemia (2018-2022).
A través de un proceso de ETL (Extracción, Transformación y Carga), hemos procesado un volumen masivo de datos para construir una base de datos relacional robusta que permite realizar consultas estratégicas sobre el comportamiento del mercado musical.

📊 Cifras Clave

Dataset Original: 61,617 canciones (formato JSON de Spotify).
Dataset Filtrado: 11,729 canciones y 4,344 artistas únicos.
Periodo de Análisis: 2018 - 2022.
Efectividad de Rescate: 96.11% de información de artistas recuperada vía API.

🛠️ Stack Tecnológico

Lenguaje: Python 3.x
Librerías: Pandas, NumPy, Requests, SQLAlchemy.
Base de Datos: MySQL (Workbench).
API Externa: Last.fm API.

🏗️ Arquitectura de la Base de Datos

El proyecto se basa en un modelo relacional con dos tablas principales conectadas mediante integridad referencial:
tabla_artistas_limpia: Información maestra de artistas (PK: artista).
Campos: Biografía, Audiencia, Reproducciones, Artista Similar.
tabla_canciones: Registro detallado de tracks (FK: artist_name).
Campos: Género, Año de lanzamiento, Valoración, ID Único.


🚀 Instalación y Uso
1. Requisitos previos
MySQL Server instalado.
Python 3.10+.
Clave de API de Last.fm.

2. Configuración
Clona el repositorio:
Bash git clone 
https://github.com/jesgonza2026proyecto-da-promo-65-modulo-2-team-1.git

Crea un archivo  basado en SQLload.ipynb con tus credenciales de MySQL y tu API Key.

Importa la base de datos:
Ejecuta el archivo Files\sql_schemas\pandemusic_con_limpiado\pandemusic_data_pk.sql en MySQL Workbench para cargar las tablas con los 11,729 registros ya procesados.

3. Ejecución del Rescate 
Si deseas actualizar la información de los artistas manualmente:
Bash Files\sql_schemas\Rescate_Nulos_SQL_API.ipynb

📈 Análisis Destacados

El proyecto responde a preguntas críticas de negocio mediante consultas SQL avanzadas, tales como:

   * Impacto de la Pandemia: Comparativa de lanzamientos y valoraciones en los periodos 2018-2019 vs 2020-2021.

   * Artistas más populares: Análisis del ratio Reproducciones / Audiencia para identificar artistas con mayores reproducciones.

   * Dominio de Géneros: Identificación de los géneros que lideraron el mercado durante el confinamiento de 2020.

🔮 Next Steps

Dashboarding: Conectar la base de datos a Power BI/Tableau para visualizaciones en tiempo real.

NLP: Análisis de sentimiento de las biografías de los artistas para identificar temáticas líricas post-pandemia.

Predictive Analytics: Implementar un modelo de Machine Learning para predecir el éxito de nuevos lanzamientos basado en el género y la tendencia histórica.

👥 Equipo de Desarrollo

Aliris Escobar - Analista
Jesica González - Analista
Ana Marín - Analista
Milena Aguilera - Analista
Sara Guzmán - Scrum Máster


 