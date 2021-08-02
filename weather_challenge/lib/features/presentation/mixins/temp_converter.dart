mixin TempConverter {
  double celsiusToFahrenheit({required double celsius}) {
    return celsius * 5 / 9 + 32;
  }
}
