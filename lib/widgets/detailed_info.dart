import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/geolocator_service.dart';
import 'package:flutter_app/widgets/user_detailed_container.dart';
import 'package:geolocator/geolocator.dart';

class DetailedInfo extends StatelessWidget{

  final User currentUser;
  final GeolocatorService _geolocatorService = GeolocatorService();

  DetailedInfo(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
                  children: <Widget>[
                    UserDetailedContainer(currentUser)
                  ]
              )
        );
  }

}
