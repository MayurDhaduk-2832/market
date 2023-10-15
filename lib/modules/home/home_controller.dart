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
      "latitude": PrefService.getDouble(LocaleKeys.SPULatitude),
      "longitude":PrefService.getDouble(LocaleKeys.SPULongitude),
    };

    loader.value = true;

    await AddProductApi.LocationGetDataApi(body).then((value){
      if(value!=null)
      {
        inRangeProducts = value;
      //  productData = productDataModel.data!;
        isLike.value = List.generate(inRangeProducts.data!.length, (index) => false);
      //  productData.sort((a, b) => double.parse(a.salePrice!).compareTo(double.parse(b.salePrice!)));
      }


    });

    // inRangeProducts = await InRangeProductApi.inRangeProductApi(body);
    // isLike.value = List.generate(inRangeProducts.data!.length, (index) => false);

    loader.value = false;
  }

  getOutRangeProducts() async {
    Map<String, dynamic> body = {
      "latitude": PrefService.getDouble(LocaleKeys.SPULatitude),
      "longitude":PrefService.getDouble(LocaleKeys.SPULongitude),
    };

    loader.value = true;

    await AddProductApi.LocationGetLongDataApi(body).then((value){
      if(value!=null)
      {
        outRangeProducts = value;
        // productLongData = productLongDataModel.data!;
        isLike.value = List.generate(outRangeProducts.data?.length ?? 0, (index) => false);
        // productLongData.sort((a, b) => double.parse(a.salePrice!).compareTo(double.parse(b.salePrice!)));
      }

    });

    // outRangeProducts = await OutRangeProductApi.outRangeProductApi(body);
    // isLike.value = List.generate(inRangeProducts.data!.length, (index) => false);
    loader.value = false;
  }
}
