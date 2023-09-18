//Weather Data Fie

import 'CurrentWetherData.dart';
import 'DailyWeatherData.dart';
import 'HourlyWeatherData.dart';
import 'location_name.dart';

class WeatherData {
  CurrentWeatherData? current;
  HourlyWeatherData? hourly;
  DailyWeatherData? daily;
  LocationNameData? lname;

  WeatherData([this.current, this.hourly, this.daily, this.lname]);

  CurrentWeatherData currentWeatherData() => current!;

  HourlyWeatherData hourlyWeatherData() => hourly!;

  DailyWeatherData dailyWeatherData() => daily!;

  LocationNameData locationNameData() => lname!;
}
