mixin DateConverter {
  String showOnlyDay({required String day}) {
    return day.replaceAll(RegExp('00:00:00'), '');
  }
}
