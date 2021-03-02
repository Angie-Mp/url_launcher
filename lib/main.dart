import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  @override
  Widget build(BuildContext context) {
    //cordenadas hacia el destino
    String lat = '-12.154849 ';
    String lng = '-76.982271';
    //
    return Scaffold(
        appBar: AppBar(
          title: Text('URL Launcher'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir el telefono del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(Icons.call),
                            onPressed: () async {
                              // Android
                              //se puede agregar numero
                              const url = 'tel:';

                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir los mensajes del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(Icons.message),
                            onPressed: () async {
                              // Android
                              //se puede agregar numero
                              const url = 'sms: ';

                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir google del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(Icons.language),
                            onPressed: () async {
                              // Android
                              const url = 'https://google.com ';

                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir waze del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: Icon(Icons.drive_eta),
                          onPressed: () async {
                            final String googleMapsUrl =
                                "comgooglemaps://?center=$lat,$lng";
                            final String appleMapsUrl =
                                'https://waze.com/ul?ll=$lat,$lng';

                            if (await canLaunch(googleMapsUrl)) {
                              await launch(googleMapsUrl);
                            }
                            if (await canLaunch(appleMapsUrl)) {
                              await launch(appleMapsUrl, forceSafariVC: false);
                            } else {
                              throw "Couldn't launch URL";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir google maps del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          icon: Icon(Icons.drive_eta),
                          onPressed: () async {
                            final String googleMapsUrl =
                                "comgooglemaps://?center=$lat,$lng";
                            final String appleMapsUrl =
                                "https://maps.apple.com/?q=$lat,$lng";

                            if (await canLaunch(googleMapsUrl)) {
                              await launch(googleMapsUrl);
                            }
                            if (await canLaunch(appleMapsUrl)) {
                              await launch(appleMapsUrl, forceSafariVC: false);
                            } else {
                              throw "Couldn't launch URL";
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir facebook del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () async {
                              // Android
                              const url = 'https://es-la.facebook.com/';

                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'Abrir youtube del movil',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () async {
                              // Android
                              const url =
                                  'https://www.youtube.com/?hl=es-419&gl=PE';

                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
