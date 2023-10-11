import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sellproducts/api/in_range_product_api.dart';
import 'package:sellproducts/api/out_range_product_api.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/models/all_products_model.dart';

class HomeController extends GetxController {
  Position? position;

  RxBool loader = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("asknfsdfl");

    getInRangeProducts();
    getOutRangeProducts();
  }




  AllProducts inRangeProducts = AllProducts();
  AllProducts outRangeProducts = AllProducts();

  getInRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude":PrefService.getDouble(LocaleKeys.SPULatitude),
      "longitude":PrefService.getDouble(LocaleKeys.SPULongitude)
    };

    loader.value = true;

    inRangeProducts = await InRangeProductApi.inRangeProductApi(body);

    loader.value = false;
  }

  getOutRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude":PrefService.getDouble(LocaleKeys.SPULatitude),
      "longitude": PrefService.getDouble(LocaleKeys.SPULongitude)
    };

    loader.value = true;

    outRangeProducts = await OutRangeProductApi.outRangeProductApi(body);

    loader.value = false;
  }
}
