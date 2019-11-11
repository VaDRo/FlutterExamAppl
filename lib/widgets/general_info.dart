import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/user_provider.dart';
import 'package:flutter_app/widgets/user_preview_container.dart';

import 'detailed_info.dart';

class GeneralInfo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _GeneralInfoState();
  }

}

class _GeneralInfoState extends State<GeneralInfo>{
  final _userProvider = UserProvider();
  User _user = null;

  @override
  Widget build(BuildContext context) {
    //final user = User("Amparo Voga", "https://randomuser.me/api/portraits/men/6.jpg", "https://randomuser.me/api/portraits/med/men/6.jpg", "-88.4331", "-72.3621");

    return FutureBuilder<User>(
      future: _userProvider.getNewUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (_user == null)
            _user = snapshot.data;
          return
            Column(
              children: <Widget>[
                UserPreviewContainer(_user),
                Center(
                    child: ButtonBar(
                      children: <Widget>[
                        FloatingActionButton(
                            heroTag: "loadNewUserBtn",
                            onPressed: () => _loadNewUser(),
                            child: Icon(Icons.autorenew)
                        ),
                        FloatingActionButton(
                            heroTag: "showDetailsBtn",
                            onPressed: () => _showDetails(_user),
                            child: Icon(Icons.arrow_forward)
                        )
                      ],
                    )
                )
              ]
          );//UserPreviewContainer(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },

    );
  }

  void _loadNewUser() async {
    _user = await _userProvider.getNewUser();
    setState(() {

    });
  }

  void _showDetails(User user){
    Navigator.push(context,
        MaterialPageRoute<User>(
            builder: (BuildContext context) => DetailedInfo(user)
        )
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<User>(
      future: _userProvider.getNewUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return UserPreviewContainer(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },

    );
  }*/

  /*
  return Scaffold(
      body: Center(
        child: Column(
            children: <Widget>[
              UserPreviewContainer(user),
              Center(
                  child: ButtonBar(
                    children: <Widget>[
                      FloatingActionButton(
                          onPressed: () => _loadNewUser(),
                          child: Icon(Icons.autorenew)
                      ),
                      FloatingActionButton(
                          onPressed: () => _showDetails(user),
                          child: Icon(Icons.arrow_forward)
                      )
                    ],
                  )
              )
            ]
        )
      )
    );
   */
}