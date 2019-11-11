import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';

class UserPreviewContainer extends StatelessWidget{

  final User currentUser;

  UserPreviewContainer(this.currentUser);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(currentUser.SmallPictureUrl,
          fit: BoxFit.fill,
          height: 300,
          width: 300,),
        Text(currentUser.UserName)

      ]
    )
      );
  }

}