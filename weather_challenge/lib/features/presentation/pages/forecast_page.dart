import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_challenge/core/shared/widgets/loading_widget.dart';
import 'package:weather_challenge/core/shared/widgets/message_display.dart';
import 'package:weather_challenge/features/presentation/bloc/forecast/forecast_bloc.dart';
import 'package:weather_challenge/features/presentation/bloc/forecast/forecast_state.dart';
import 'package:weather_challenge/features/presentation/widgets/forecast_display.dart';

import '../../../injection_container.dart';

class ForecastPage extends StatelessWidget {
  final String cityName;
  const ForecastPage({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = sl<ForecastBloc>();
    bloc.add(GetForecastEvent(cityName: cityName));

    return Scaffold(
      appBar: AppBar(
        title: Text('Forecast'),
      ),
      body: SingleChildScrollView(
        child: _buildBody(context, bloc, size),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, ForecastBloc bloc, Size size) {
  return Padding(
    padding: EdgeInsets.only(top: size.height * 0.05),
    child: Column(
      children: <Widget>[
        BlocBuilder<ForecastBloc, ForecastState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ForecastLoading) {
              return LoadingWidget();
            } else if (state is ForecastLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.forecastEntity.city.name,
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                    ),
                  ),
                  Text(
                    state.forecastEntity.city.country,
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                    ),
                  ),
                  ForecastDisplay(
                    forecastEntity: state.forecastEntity,
                  ),
                ],
              );
            } else if (state is ForecastError) {
              return MessageDisplay(
                message: state.message,
              );
            }
            return Container();
          },
        ),
      ],
    ),
  );
}
