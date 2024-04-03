import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

// Events
abstract class WeatherEvent {}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;

  FetchWeatherEvent(this.cityName);
}

// State
class WeatherState {
  final String cityName;
  final double temperature;
  final String weatherCondition;
  final bool isLoading;
  final String errorMessage;

  WeatherState({
    required this.cityName,
    this.temperature = 0.0,
    this.weatherCondition = '',
    this.isLoading = false,
    this.errorMessage = '',
  });
}

// BLoC
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState(cityName: '')) {
    on<FetchWeatherEvent>(_onFetchWeather);
  }

  void _onFetchWeather(FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(state.copyWith(isLoading: true, cityName: event.cityName));

    try {
      final weather = await fetchWeather(event.cityName);
      emit(state.copyWith(
        isLoading: false,
        temperature: weather['main']['temp'],
        weatherCondition: weather['weather'][0]['main'],
      ));
    } catch (error) {
      emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
    }
  }

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    final apiKey = dotenv.env['API_KEY'];   // Replace with your API key
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

extension WeatherStateCopyWith on WeatherState {
  WeatherState copyWith({
    String? cityName,
    double? temperature,
    String? weatherCondition,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WeatherState(
      cityName: cityName ?? this.cityName,
      temperature: temperature ?? this.temperature,
      weatherCondition: weatherCondition ?? this.weatherCondition,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}