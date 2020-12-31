import 'package:cool_tourismapp/jsonDataCatcher.dart';
import 'package:flutter/material.dart';

//void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Data> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: 400,
                            margin: EdgeInsets.only(right: 5, bottom: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    '${snapshot.data.images[0].name}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 400,
                            margin: EdgeInsets.only(right: 5, bottom: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    '${snapshot.data.images[1].name}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 400,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    '${snapshot.data.images[2].name}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 400,
                  )
                ],
              );
            }
          }),
    );
  }
}
