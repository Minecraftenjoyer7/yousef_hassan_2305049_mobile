1. App Description

WeatherApp is a mobile application that allows users to:
- Search for any city
- View current weather conditions
- Read detailed weather information such as humidity, wind speed, sunrise/sunset, and more
- Save favorite cities for quick access
The app is lightweight, fast, and built with clean UI components to ensure a smooth user experience.

------------------------------------------------------------------------------------------------------
2. Key Features

* Live Weather Data
- Temperature
- Weather description
- Weather icon
- Feels-like temperature
- Humidity
- Wind speed
- Sunrise & sunset time

* Favorites System
- Add cities to favorites
- Remove from favorites
- View favorites anytime
- Stored using Provider state management

* Clean UI
- Responsive design
- Simple and modern layout
- Weather icons fetched from OpenWeatherMap

* State Management
- Implemented using Provider package

----------------------------------------------------------------------------------------------------

4. API Usage
This project connects to:
OpenWeatherMap Current Weather API
Request example:
https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}&units=metric

The API returns:
- temp
- feels_like
- humidity
- wind
- sunrise/sunset (UNIX)
- weather icon
The app processes the JSON response and displays it in a clean UI.
-------------------------------------------------------------------------------------------------------------



