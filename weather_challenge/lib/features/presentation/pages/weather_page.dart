import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_challenge/core/shared/widgets/loading_widget.dart';
import 'package:weather_challenge/core/shared/widgets/message_display.dart';
import 'package:weather_challenge/features/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_challenge/features/presentation/widgets/search_controls.dart';
import 'package:weather_challenge/features/presentation/widgets/weather_display.dart';

import '../../../injection_container.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WeatherApp'),
        ),
        body: SingleChildScrollView(
          child: _buildBody(context),
        ));
  }

  BlocProvider<WeatherBloc> _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<WeatherBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SearchControls(),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is Initial) {
                  return MessageDisplay(
                    message: 'Type the city name!',
                  );
                } else if (state is WeatherLoading) {
                  return LoadingWidget();
                } else if (state is CurrentWeatherLoaded) {
                  return WeatherDisplay(
                    currentWeatherEntity: state.currentWeatherEntity,
                  );
                } else if (state is WeatherError) {
                  return MessageDisplay(
                    message: state.message,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
