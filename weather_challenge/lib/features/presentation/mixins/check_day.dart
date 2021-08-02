import 'package:weather_challenge/core/utils/forecast_compare_regex.dart';
import 'package:weather_challenge/features/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_challenge/features/domain/entities/forecast/list_element_entity.dart';

mixin CheckForecastByDay {
  List<ElementEntity> checkForecastByDay(ForecastEntity forecastEntity) {
    List<ElementEntity> forecastByDayList = [];

    for (var element in forecastEntity.list) {
      if (element.dtTxt.contains(forecastRegExp)) {
        forecastByDayList.add(element);
      }
    }
    return forecastByDayList;
  }
}
