import 'dart:convert';

import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/geolocator_service.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart' as geo;

class UserProvider{
  GeolocatorService _geolocatorService = GeolocatorService();

  Future<User> getNewUser() async{
    final response = await http.get(
        'https://randomuser.me/api/');

    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body));

      geo.Position currentPosition = await _geolocatorService.getCurrentLocation();
      double distance = await _geolocatorService.getDistance(currentPosition.latitude, currentPosition.longitude, double.parse(user.Lat), double.parse(user.Lng));
      distance = distance * 0.000621371;
      user.setDistance(distance.toStringAsFixed(2));

      return user;
    } else {
      throw Exception('Failed to load next user data');
    }
  }
}