import 'package:flutter/material.dart';
import './human.dart';

late List nameScore;
Future<List<Object>> getData() async {
  // List<String> name = ['Sati', 'Osman', 'Esraa', 'Hind'];

  return await Future.delayed(const Duration(seconds: 5), () => getscore());
}

getscore() {
  human sati = human('sati', 20, 'swimming', 0);
//  human co = human('name', 0, '', 0);
  List<human> ma = [
    human('osman', 23, 'football', 0),
    human('mohammed', 24, 'running', 0),
    human('tajAldden', 22, 'swimming', 0),
  ];
  ma.map((e) {
    if (e.age >= sati.age - 2 && e.age <= sati.age + 2) {
      e.score += 10;
    }
    if (e.hope == sati.hope && e.hope == sati.hope) {
      e.score += 10;
    }
    nameScore.add(e.name);
  }).toList();
  /* for (int i = 1; i <= ma.length; i++) {
    if (ma[i].score > ma[i - 1].score) {
      co = ma[i];
      ma[i] = ma[i - 1];
      ma[i - 1] = co;
    }
  }*/
//  ma.sort();
  return ma;
}

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot<List<Object>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const CircularProgressIndicator();

                  default:
                    if (snapshot.hasData) {
                      List<Object> names = snapshot.data!;
                      return ListView.builder(
                        itemCount: names.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Text(names[index].toString()),
                            ],
                          );
                        },
                      );
                    } else {
                      return Text("Erorr");
                    }
                }
              }),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
