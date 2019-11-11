import 'package:geolocator/geolocator.dart';

class GeolocatorService{

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  Future<double> getDistance(double fromLatitude, double fromLongitude, double toLatitude, double toLongitude) async {
    double distanceInMeters = await Geolocator().distanceBetween(fromLatitude, fromLongitude, toLatitude, toLongitude);
    return distanceInMeters;
  }

}