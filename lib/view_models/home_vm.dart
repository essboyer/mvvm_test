import 'dart:async';
import 'dart:math';

import 'package:mvvm_test/data_models/data_model.dart';
import 'package:mvvm_test/view_models/base_model.dart';

class HomeVM extends BaseModel {
  MyData _data;
  Timer _timer;
  final Random _random = Random();
  List<String> _strings = [
    'Hello',
    'Good-bye',
    'Alonzo',
    'FilledStacked',
    'Flutter',
    'Robot',
    'Doctor'
  ];

  MyData get data => _data;
  set data(MyData data) {
    _data = data;
    notifyListeners();
  }

  Future<void> init() async {
    data = MyData(value: 'Initial Value');
    // start the time to change value every 2 seconds
    _timer = Timer(Duration(seconds: 2), changeDataValue);
  }

  void changeDataValue() {
    // Set the value to a random value
    data.value = _strings[_random.nextInt(_strings.length - 1)];
    // restart the timer
    _timer = Timer(Duration(seconds: 2), changeDataValue);
    notifyListeners();
  }

}