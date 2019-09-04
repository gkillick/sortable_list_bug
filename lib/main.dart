import 'package:flutter/material.dart';
void main() => runApp(App());
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reorderable List bug',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ReorderableListView(
                    onReorder: (old_index, new_index) {},
                    children: <Widget>[
                      textCard(),
                      textCard2()
                    ],
                ),
            ),
            Text('Keyboard behaves as expected here but will glitch on following page'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to SubPage'),
              onPressed: () {
                navigateToSubPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
  Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SubPage()));
}
}

class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        onReorder: (old_index, new_index) {},
        children: <Widget>[
          textCard(),
          textCard2(),
          RaisedButton(
            key: ValueKey('3'),
              textColor: Colors.white,
              color: Colors.redAccent,
              child: Text('Back to Main Page'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
        ],
    ),
    );
  }

  
}
Widget textCard() {
  return Card(
        key: ValueKey('1'),
        child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      '1.',
                      
                    )),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Enter text'),
                  )
                )
              ],
            )));
}
Widget textCard2() {
  return Card(
    key: ValueKey('2'),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter text'
      ),
    ),
  );
}
