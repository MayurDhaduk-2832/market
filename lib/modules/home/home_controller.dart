import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sellproducts/api/in_range_product_api.dart';
import 'package:sellproducts/api/out_range_product_api.dart';
import 'package:sellproducts/models/all_products_model.dart';

class HomeController extends GetxController {
  Position? position;

  RxBool loader = false.obs;

  getLocation() async {
    bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Geolocator.openAppSettings();
      if (!_serviceEnabled) {
        return;
      }
    }

    LocationPermission _permissionGranted = await Geolocator.checkPermission();
    if (_permissionGranted == LocationPermission.denied) {
      _permissionGranted = await Geolocator.requestPermission();
      if (_permissionGranted != LocationPermission.always) {
        return;
      }
    }

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  AllProducts inRangeProducts = AllProducts();
  AllProducts outRangeProducts = AllProducts();

  getInRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude": position?.latitude,
      "longitude": position?.longitude
    };

    loader.value = true;

    inRangeProducts = await InRangeProductApi.inRangeProductApi(body);

    loader.value = false;
  }

  getOutRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude": position?.latitude,
      "longitude": position?.longitude
    };

    loader.value = true;

    outRangeProducts = await OutRangeProductApi.outRangeProductApi(body);

    loader.value = false;
  }
}
