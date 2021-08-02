import 'package:flutter/material.dart';
import 'package:weather_challenge/features/domain/entities/current_weather/current_weather_entity.dart';
import 'package:weather_challenge/features/presentation/mixins/temp_converter.dart';

class WeatherDisplay extends StatelessWidget {
  final CurrentWeatherEntity currentWeatherEntity;
  const WeatherDisplay({
    Key? key,
    required this.currentWeatherEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return _WeatherCard(currentWeatherEntity: currentWeatherEntity, size: size);
  }
}

class _WeatherCard extends StatelessWidget with TempConverter {
  const _WeatherCard({
    Key? key,
    required this.currentWeatherEntity,
    required this.size,
  }) : super(key: key);

  final CurrentWeatherEntity currentWeatherEntity;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.1),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                currentWeatherEntity.name,
                style: TextStyle(
                  fontSize: size.height * 0.03,
                ),
              ),
              Text(
                currentWeatherEntity.sys.country,
                style: TextStyle(
                  fontSize: size.height * 0.03,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentWeatherEntity.main.temp.toStringAsFixed(2) + '°C',
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  SizedBox(width: size.width * 0.05),
                  Text(
                    celsiusToFahrenheit(celsius: currentWeatherEntity.main.temp)
                            .toStringAsFixed(2) +
                        '°F',
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
