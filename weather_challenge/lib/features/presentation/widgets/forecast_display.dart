import 'package:flutter/material.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_challenge/features/domain/entities/forecast/element_entity.dart';
import 'package:weather_challenge/features/presentation/mixins/check_day.dart';
import 'package:weather_challenge/features/presentation/mixins/date_time_converter.dart';
import 'package:weather_challenge/features/presentation/mixins/temp_converter.dart';

class ForecastDisplay extends StatelessWidget with CheckForecastByDay {
  final ForecastEntity forecastEntity;
  const ForecastDisplay({
    Key? key,
    required this.forecastEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<ElementEntity> forecastList = checkForecastByDay(forecastEntity);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: forecastList.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: _ForecastCard(
                day: forecastList[i].dtTxt,
                temperature: forecastList[i].main.temp,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ForecastCard extends StatelessWidget with TempConverter, DateConverter {
  final double temperature;
  final String day;

  const _ForecastCard({
    Key? key,
    required this.temperature,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.7,
        height: size.height * 0.1,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(showOnlyDay(day: day)),
                Text(temperature.toStringAsFixed(2) + 'C'),
                Text(celsiusToFahrenheit(celsius: temperature)
                        .toStringAsFixed(2) +
                    'F'),
              ],
            ),
          ),
        ));
  }
}
