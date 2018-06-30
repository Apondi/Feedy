import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      body: futureBuilder,
    );
  }

  Future<List<String>> _getData() async {
    var values = new List<String>();
    values.add("Cow");
    values.add("Goat");

    return values;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Divider(
              height: 5.0,
            ),
            new ListTile(
              leading: new Icon(Icons.album),
              title: new Text(values[index]),
              subtitle: new Text(
                  "This is where the content of the various feedback elements will go. "
                  "This area should display the various feedbacks effectively"),
            ),
            new ButtonTheme.bar(
              child: new ButtonBar(
                children: <Widget>[
                  new FlatButton(
                    child: const Text('COMMENTS'),
                    onPressed: () {},
                  ),
                  new FlatButton(
                    child: const Text('UP VOTE'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            new Divider(
              height: 5.0,
            ),
          ],
        );
      },
    );
  }
}

//}
//
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => new Container(
//    child: new Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        new Icon(
//          Icons.home,
//          size: 150.0,
//          color: Colors.black12
//        ),
//        new Text('Home tab content')
//      ],
//    )
//  );
//}
