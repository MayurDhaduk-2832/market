import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sellproducts/api/add_product_api.dart';
import 'package:sellproducts/api/in_range_product_api.dart';
import 'package:sellproducts/api/out_range_product_api.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/models/all_products_model.dart';

class HomeController extends GetxController {
  Position? position;

  RxBool loader = false.obs;
  RxList<bool> isLike=<bool>[].obs;





  var inRangeProducts = AllProducts().obs;
  var outRangeProducts = AllProducts().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("asknfsdfl");

    getInRangeProducts();
    getOutRangeProducts();
  }



  getInRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude": PrefService.getDouble(LocaleKeys.SPULatitude),
      "longitude":PrefService.getDouble(LocaleKeys.SPULongitude),
    };

    loader.value = true;

    inRangeProducts.value = await AddProductApi.LocationGetDataApi(body: body);
    isLike.value = List.generate(inRangeProducts.value.data?.length ?? 0, (index) => false);

    // inRangeProducts.value = await InRangeProductApi.inRangeProductApi(body);
    // isLike.value = List.generate(inRangeProducts.value.data?.length ?? 0, (index) => false);

    loader.value = false;
  }

 Future getOutRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude": PrefService.getDouble(LocaleKeys.SPULatitude),
      "longitude":PrefService.getDouble(LocaleKeys.SPULongitude),
    };

    loader.value = true;

    outRangeProducts.value = await AddProductApi.LocationGetLongDataApi(body: body);
    isLike.value = List.generate(outRangeProducts.value.data?.length ?? 0, (index) => false);

    // outRangeProducts.value = await OutRangeProductApi.outRangeProductApi(body);

    // isLike.value = List.generate(inRangeProducts.data!.length, (index) => false);
    loader.value = false;
  }
}
