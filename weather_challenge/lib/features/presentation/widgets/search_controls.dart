import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';
import 'package:weather_challenge/features/domain/usecases/get_forecast.dart';
import 'package:weather_challenge/features/presentation/bloc/forecast/forecast_bloc.dart';

import 'package:weather_challenge/features/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_challenge/features/presentation/pages/forecast_page.dart';

import '../../../injection_container.dart';

class SearchControls extends StatefulWidget {
  const SearchControls({
    Key? key,
  }) : super(key: key);

  @override
  _SearchControlsState createState() => _SearchControlsState();
}

class _SearchControlsState extends State<SearchControls> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _controller,
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input a city name',
            ),
            validator: Validatorless.required('Please provide a city name!'),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                    child: Text('Search'),
                    onPressed: () {
                      var formValid = _formKey.currentState?.validate() ?? true;

                      if (formValid) {
                        _dispatchCurrentWeather(_controller.text);
                        _controller.clear();
                      }
                    }),
              ),
              SizedBox(width: 10),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: BlocProvider(
                  create: (context) => ForecastBloc(
                    getForecast: sl<GetForecast>(),
                  ),
                  child: TextButton(
                      child: Text('Forecast'),
                      onPressed: () {
                        var formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForecastPage(
                                cityName: _controller.text,
                              ),
                            ),
                          );
                        }
                      }),
                ),
              ),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }

  void _dispatchCurrentWeather(String inputStr) {
    _controller.clear();
    BlocProvider.of<WeatherBloc>(context).add(
      GetCurrentWeatherEvent(
        cityName: inputStr,
      ),
    );
  }
}
