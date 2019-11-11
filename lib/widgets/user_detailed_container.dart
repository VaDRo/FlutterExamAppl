import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:geolocator/geolocator.dart';

class UserDetailedContainer extends StatelessWidget{
  final User currentUser;

  UserDetailedContainer(this.currentUser);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
          children: <Widget>[
            Image.network(currentUser.LargePictureUrl),
            Text(currentUser.getDistanceInfo())
          ],
        )
    );
  }
}