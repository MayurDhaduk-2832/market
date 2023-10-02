
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sellproducts/api/add_product_api.dart';
import 'package:sellproducts/modules/home/model/product_data_model.dart';
import 'package:sellproducts/modules/home/model/product_long_data_model.dart';

class HomeScreenController extends GetxController{

  RxInt iSelect = 0.obs;
  RxBool isLoad = false.obs;
  List<Datum> productData=[];
  List<DatuLong> productLongData=[];
  RxList<bool> isLike=<bool>[].obs;

  ProductDataModel productDataModel=ProductDataModel();
  ProductLongDataModel productLongDataModel=ProductLongDataModel();



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("asknfsdfl");
    getDestaricData();
    getDestaricLongData();

  }

  getDestaricData() async {
    Map<String, dynamic> body = {
      "latitude": 21.257438,
      "longitude":72.96897,
    };

    isLoad.value = true;

    await AddProductApi.LocationGetDataApi(body).then((value){
      if(value!=null)
        {
          productDataModel = value;
          productData = productDataModel.data!;
          isLike.value = List.generate(productDataModel.data!.length, (index) => false);
          productData.sort((a, b) => double.parse(a.salePrice!).compareTo(double.parse(b.salePrice!)));
        }


    });
    isLoad.value = false;

  }

  getDestaricLongData() async {
    Map<String, dynamic> body = {
      "latitude": 21.257438,
      "longitude":72.96897,
    };

    isLoad.value = true;

    await AddProductApi.LocationGetLongDataApi(body).then((value){
      if(value!=null)
      {
        productLongDataModel = value;
        productLongData = productLongDataModel.data!;
        isLike.value = List.generate(productDataModel.data!.length, (index) => false);
        productLongData.sort((a, b) => double.parse(a.salePrice!).compareTo(double.parse(b.salePrice!)));
      }


    });
    isLoad.value = false;

  }
}