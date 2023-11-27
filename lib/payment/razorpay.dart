import 'package:ecommerce_app/payment/api_service.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/constants.dart';

class RazorPayIntegration {
  // final Razorpay _razorpay = Razorpay(); //Instance of razor pay

  openSession({required num amount, required Razorpay razorpay}) {
    createOrder(amount: amount).then((orderId) {
      print(orderId);
      if (orderId.toString().isNotEmpty) {
        var options = {
          'key': razorPayKey,
          //Razor pay API Key
          'amount': amount,
          //in the smallest currency sub-unit.
          'name': 'Company Name.',
          'order_id': orderId,
          // Generate order_id using Orders API
          'description': 'Description for order',
          //Order Description to be shown in razor pay page
          'timeout': 60,
          // in seconds
          'prefill': {
            'contact': '9123456789',
            'email': 'flutterwings304@gmail.com'
          }
          //contact number and email id of user
        };
        razorpay.open(options);
      } else {}
    });
  }

  createOrder({
    required num amount,
  }) async {
    final myData = await ApiServices().razorPayApi(amount, "rcp_id_1");
    if (myData["status"] == "success") {
      print(myData);
      return myData["body"]["id"];
    } else {
      return "";
    }
  }
}
