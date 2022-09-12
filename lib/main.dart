import 'package:flutter/material.dart';

// List for dropdown
final List<String> coreHangs = <String>['bent knees', 'L-sit', 'front lever'];
final _userCoreTime = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const CalculatorTest(title: '9C Test Calculator'),
    );
  }
}

class CalculatorTest extends StatefulWidget {
  const CalculatorTest({super.key, required this.title});
  final String title;

  @override
  State<CalculatorTest> createState() => _Test9C();
}

class _Test9C extends State<CalculatorTest> {
  // User inputs
  final _userBW = TextEditingController();
  final _userMaxPullUp = TextEditingController();
  final _userMaxHangs = TextEditingController();
  String userCoreHangs = coreHangs.first;
  final _userEnduranceHang = TextEditingController();

  // Text Widget
  userTextField(
          TextEditingController controllerVariable, String? inputHintText) =>
      {
        TextField(
          controller: controllerVariable,
          decoration: const InputDecoration(
            hintText: 'hello',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(20.0),
          ),
        )
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _userBW,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Input your body weight',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(20.0),
            ),
          ),
          TextField(
            controller: _userMaxPullUp,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Your 1 max weighted pull-up',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(20.0),
            ),
          ),
          TextField(
            controller: _userMaxHangs,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Your 1 max weighted hang',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(20.0),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButton<String>(
                    value: userCoreHangs,
                    onChanged: (String? value) => {
                      setState(() => {userCoreHangs = value!})
                    },
                    items:
                        coreHangs.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _userCoreTime,
                    decoration: const InputDecoration(
                      hintText: 'Time of hangs',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
