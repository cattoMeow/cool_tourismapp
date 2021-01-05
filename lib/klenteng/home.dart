import 'package:cool_tourismapp/jsonDataCatcher.dart';
import 'package:cool_tourismapp/komponen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

//Done! The code is still spaghetti AF tho. I'll come back and fix later!
//If you can find a way to improve the code, let me know! :D - Putri Anna

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //inisialisasi TextStyle untuk header dan jadwal
  TextStyle headerStyle = Komponen.headerStyle;
  TextStyle narasiStyle = Komponen.narasiStyle;
  TextStyle timeStyle = Komponen.timeStyle;

  Future<Data> data;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    data = getKlentengList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return Column(
                children: [
                  //Slider image. Mungkin bakal aku ganti pake builder :D
                  Expanded(
                    flex: 1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 400,
                          margin: EdgeInsets.only(right: 5, bottom: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('${snapshot.data.images[0].name}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 400,
                          margin: EdgeInsets.only(right: 5, bottom: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('${snapshot.data.images[1].name}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 400,
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('${snapshot.data.images[2].name}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Badan teks :3
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(20),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 15,
                                children: [
                                  Text(
                                    "About",
                                    style: headerStyle,
                                  ),
                                  Text('${snapshot.data.about.narasi}',
                                      style: narasiStyle)
                                ],
                              ),
                            ),
                            Container(
                              height: 110,
                              padding:
                                  EdgeInsets.only(top: 5, left: 20, right: 20),
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 15,
                                children: [
                                  Text(
                                    "Jam Buka",
                                    style: headerStyle,
                                  ),
                                  Wrap(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${snapshot.data.about.jadwal[0]}',
                                            style: narasiStyle,
                                          ),
                                          Text(
                                            '${snapshot.data.about.jadwal[1]}',
                                            style: timeStyle,
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${snapshot.data.about.jadwal[2]}',
                                            style: narasiStyle,
                                          ),
                                          Text(
                                            '${snapshot.data.about.jadwal[3]}',
                                            style: timeStyle,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 200,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Wrap(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(FontAwesomeIcons.mapMarkerAlt,
                                          size: 30, color: HexColor("#A15D98")),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${snapshot.data.about.alamat}',
                                            style: narasiStyle,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.phoneAlt,
                                        size: 30,
                                        color: HexColor("#A15D98"),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${snapshot.data.about.notelp}',
                                            style: narasiStyle,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
