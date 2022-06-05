import 'package:demo_app/ApiClient.dart';
import 'package:demo_app/models/login_resp.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  var text = "Hello";

  @override
  Future<void> setState(VoidCallback fn) async {
    // TODO: implement setState
    FutureBuilder<String>(
      future: await SharedPref().getUserData(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if(snapshot.hasData){
          print(snapshot.data);
          return Text('${snapshot.data}');
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Center(
        child: Text("Test"),
      ),
    );
  }
}
