#Análisis exploratorio de datos
import pandas as pd

url = "https://practicum-content.s3.us-west-1.amazonaws.com/data-analyst-eng/moved_chicago_weather_2017.html"


weather_records = pd.read_html(url, attrs={"id": "weather_records"})[0]


pd.set_option('display.max_rows', None)
print(weather_records)
