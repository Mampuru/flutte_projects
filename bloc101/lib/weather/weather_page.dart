import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: WeatherView(),
      ),
    );
  }
}

class WeatherView extends StatelessWidget {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    weatherBloc.add(FetchWeatherEvent(_cityController.text));
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return CircularProgressIndicator();
                } else if (state.errorMessage.isNotEmpty) {
                  return Text(state.errorMessage);
                } else {
                  return Column(
                    children: [
                      Text(
                        'City: ${state.cityName}',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Temperature: ${state.temperature.toStringAsFixed(1)} °C',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Weather: ${state.weatherCondition}',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
