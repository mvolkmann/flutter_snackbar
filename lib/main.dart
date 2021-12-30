import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class MyHomePage extends StatelessWidget {
  final String title;

  final snackBar = SnackBar(
    action: SnackBarAction(
      label: 'Panic',
      onPressed: () => print('got press'),
      textColor: Colors.white,
    ),
    backgroundColor: Colors.red.shade900,
    //behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(Icons.error_outline, color: Colors.white, size: 32),
        SizedBox(width: 16),
        // Using Expanded allows the text to wrap.
        Expanded(
          child: Text(
            'This is a long sentence that will require wrapping.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    ),
    //dismissDirection: DismissDirection.up,
    duration: Duration(seconds: 10),
    //elevation: 0,
    //margin: EdgeInsets.all(10),
    //padding: EdgeInsets.all(10),
    //shape: StadiumBorder(),
    //width: 200,
  );

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Show SnackBar #1'),
              onPressed: () {
                ScaffoldMessenger.of(context)
                  // If another SnackBar is currently displayed, remove it.
                  // There are two methods that do this.
                  //..hideCurrentSnackBar() // runs exit animation
                  ..removeCurrentSnackBar() // does not run exit animation
                  // Now show the new SnackBar.
                  ..showSnackBar(snackBar);
              },
            ),
            ElevatedButton(
              child: Text('Show SnackBar #2'),
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
            )
          ],
        ),
      ),
    );
  }
}
