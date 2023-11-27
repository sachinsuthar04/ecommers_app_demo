import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';

class ApiServices {
  razorPayApi(num amount, String recieptId) async {
    var auth =
        'Basic ${base64Encode(utf8.encode('$razorPayKey:$razorPaySecret'))}';
    var headers = {'content-type': 'application/json', 'Authorization': auth};
    var request =
        http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
    request.body = json.encode({
      "amount": amount * 100, // Amount in smallest unit like in paise for INR
      "currency": "INR", //Currency
      "receipt": recieptId //Reciept Id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200) {
      return {
        "status": "success",
        "body": jsonDecode(await response.stream.bytesToString())
      };
    } else {
      return {"status": "fail", "message": (response.reasonPhrase)};
    }
  }
}
