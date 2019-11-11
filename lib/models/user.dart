import 'package:geolocator/geolocator.dart';

class User{
  final String UserName;
  final String LargePictureUrl;
  final String SmallPictureUrl;
  final String Lng;
  final String Lat;
  String Distance;

  User(this.UserName, this.LargePictureUrl, this.SmallPictureUrl, this.Lng, this.Lat);

  User.fromJson(Map<String, dynamic> data)
  :
    this.UserName = data["results"][0]["name"]["first"] + " " + data["results"][0]["name"]["last"],
    this.LargePictureUrl = data["results"][0]["picture"]["large"],
    this.SmallPictureUrl = data["results"][0]["picture"]["medium"],
    this.Lat = data["results"][0]["location"]["coordinates"]["latitude"],
    this.Lng = data["results"][0]["location"]["coordinates"]["longitude"],
    this.Distance = "unknown"
  ;

  String getDistanceInfo(){

    return '${UserName} is ${getDistance()} miles from you ';
  }

  String getDistance(){
    return Distance;
  }

  void setDistance(String distance){
    this.Distance = distance;
  }
}