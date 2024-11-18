
# 1. Instale a biblioteca `requests` caso ainda não esteja instalada. Use o comando:
#    pip install requests

import requests  # Biblioteca para fazer requisições HTTP
import json  

def get_weather():
    """
    Função que obtém os dados climáticos de uma cidade usando a API OpenWeatherMap
    e salva os dados em um arquivo JSON.
    """
    # API KEY
    api_key = "969648e39721f18473800760fa56155a"
    
    city = "Natal,BR"  
    
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&units=metric&appid={api_key}"
    
    response = requests.get(url)
    
    if response.status_code == 200:
        data = response.json()
        
        temp = data["main"]["temp"]       # Temperatura atual
        temp_max = data["main"]["temp_max"]  # Temperatura máxima
        temp_min = data["main"]["temp_min"]  # Temperatura mínima
        humidity = data["main"]["humidity"]  # Umidade relativa do ar
        
        weather_data = {
            "cidade": city,
            "temperatura_atual": temp,
            "temperatura_maxima": temp_max,
            "temperatura_minima": temp_min,
            "umidade": humidity
        }

        # Abre/cria o arquivo 'weather_data.json' no modo de escrita
        with open("weather_data.json", "w", encoding="utf-8") as json_file:
            json.dump(weather_data, json_file, ensure_ascii=False, indent=4)
        
        print("Dados climáticos salvos em 'weather_data.json'")
    else:
        print(f"Erro ao buscar dados: {response.status_code}, {response.text}")


get_weather()
