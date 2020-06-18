import 'package:flutter/material.dart';
import 'package:mvvm_test/view_models/home_vm.dart';
import 'package:mvvm_test/widgets/text_input_form_field.dart';
import 'package:stacked/stacked.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Text Field Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeVM>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => HomeVM(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(
            children: [
              Text('Random Text Demo'),
              TextInputFormField(value: model.data.value),
            ],
          )),
    );
  }
}
