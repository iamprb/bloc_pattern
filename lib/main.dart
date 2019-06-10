import 'package:flutter/material.dart';

import 'BLoC/Counter_BLoC.dart';
import 'BLoC_event/Counter_BLoC_event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final _bloc = Counter_BLoC();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child:StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context , AsyncSnapshot<int> snapshot){
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button ${snapshot.data} times:',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              );
          },

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> _bloc.counterEventSink.add(IncreamentEvent()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  @override
  void dispose(){
    super.dispose();
    _bloc.dispose();
  }
}
