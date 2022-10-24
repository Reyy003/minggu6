import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class draw extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<draw> {
  @override
  final List<String> gambar = [
    "gif1.gif",
    "gif2.gif",
    "gif3.gif",
    "gif4.gif",
    "gif5.gif",
    "gif6.gif",
    "gif7.gif",
    "gif8.gif"
  ];
  static const Map<String, Color> colors = {
    'gif1': Color(0xFF2DB569),
    'gif2': Color(0xFFF386B8),
    'gif3': Color(0xFF45CAF5),
    'gif4': Color(0xFFB19ECB),
    'gif5': Color(0xFFF58E4C),
    'gif6': Color(0xFF46C1BE),
    'gif7': Color(0xFFFFEA0E),
    'gif8': Color(0xFFDBE4E9),
  };
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [Colors.white, Colors.purpleAccent, Colors.deepPurple]),
        ),
        child: new PageView.builder(
            controller: new PageController(viewportFraction: 0.8),
            itemCount: gambar.length,
            itemBuilder: (BuildContext context, int i) {
              return new Padding(
                  padding:
                      new EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
                  child: new Material(
                    elevation: 8.0,
                    child: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        new Hero(
                            tag: gambar[i],
                            child: new Material(
                              child: new InkWell(
                                child: new Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: colors.values.elementAt(i),
                                    child: new Image.asset(
                                      "img/${gambar[i]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            new Halamandua(
                                              gambar: gambar[i],
                                              colors:
                                                  colors.values.elementAt(i),
                                            ))),
                              ),
                            )),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}

class Halamandua extends StatefulWidget {
  Halamandua({required this.gambar, required this.colors});
  final String gambar;
  final Color colors;

  @override
  _HalamanduaState createState() => _HalamanduaState();
}

class _HalamanduaState extends State<Halamandua> {
  Color warna = Colors.grey;
  void _pilihannya(Pilihan pilihan) {
    setState(() {
      warna = pilihan.warna;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GIF CUTE"),
        backgroundColor: Colors.purpleAccent,
        actions: <Widget>[
          new PopupMenuButton<Pilihan>(
            onSelected: _pilihannya,
            itemBuilder: (BuildContext context) {
              return listPilihan.map((Pilihan x) {
                return new PopupMenuItem<Pilihan>(
                  child: new Text(x.teks),
                  value: x,
                );
              }).toList();
            },
          )
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new RadialGradient(
                    center: Alignment.center,
                    colors: [Colors.purple, Colors.white, Colors.deepPurple])),
          ),
          new Center(
            child: new Hero(
                tag: widget.gambar,
                child: new ClipOval(
                    child: new SizedBox(
                        width: 200.0,
                        height: 200.0,
                        child: new Material(
                          child: new InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: new Flexible(
                              flex: 1,
                              child: Container(
                                color: widget.colors,
                                child: new Image.asset(
                                  "img/${widget.gambar}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )))),
          )
        ],
      ),
    );
  }
}

class Pilihan {
  const Pilihan({required this.teks, required this.warna});
  final String teks;
  final Color warna;
}

List<Pilihan> listPilihan = const <Pilihan>[
  const Pilihan(teks: "Red", warna: Colors.red),
  const Pilihan(teks: "Green", warna: Colors.green),
  const Pilihan(teks: "Blue", warna: Colors.blue),
];
