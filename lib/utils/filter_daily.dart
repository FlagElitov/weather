List filterDaily({required List data}) {
  // sorry for this func
  List filtersDaily = [];
  for (int i = 0; i < data.length; i++) {
    if (i == 0 || i == 8 || i == 16 || i == 24 || i == 32) {
      filtersDaily.add(data[i]);
    }
  }
  return filtersDaily;
}
