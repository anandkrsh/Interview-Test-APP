import 'dart:collection';

import 'package:get/get.dart';

typedef JsonToModel = dynamic Function(String);
class ApiUtils extends GetConnect
{

  Future<Response> callApi(String url,int method,HashMap<String,dynamic> params)async
  {
    if(method==1) {
      return await
          get(url);
    }else  {
     return await post(url,  params);
    }
  }
  void CallNetWorkRequest(String url,int method,HashMap<String,dynamic> params,JsonToModel jsonTomodel,bool shoerro,bool showloader)async
  {



  }

}