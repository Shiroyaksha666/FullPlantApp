import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:full_plant_app/constants/constants.dart';
import 'package:full_plant_app/models/woocommerce/register_model.dart';

class ApiService {
  Future<bool> createCustomer(CustomerModel model) async {
    bool returnResponse = false;

    String authToken = base64Encode(
      utf8.encode(
          '${WoocommerceInfo.consumerKey} : ${WoocommerceInfo.consumerSecret}'),
    );

    try {
      var response = await Dio()
          .post(WoocommerceInfo.mainUrl + WoocommerceInfo.customerUrl,
              data: model.toJason(),
              options: Options(headers: {
                HttpHeaders.authorizationHeader: 'Basic $authToken',
                HttpHeaders.contentTypeHeader: 'application/json',
              }));
      if (response.statusCode == 201) {
        returnResponse = true;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        returnResponse = false;
      } else {
        returnResponse = false;
      }
    }
    return returnResponse;
  }
}
