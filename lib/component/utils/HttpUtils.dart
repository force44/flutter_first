
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpUtils {

  static const _context = "http://log.koreacentral.cloudapp.azure.com:8080";
  //static const _context = "http://localhost:81";

  static final storage = FlutterSecureStorage();

  static Future<Response> login(var paramData) async{
    print("$_context/login");
    print("paramData : $paramData" );
    return await http.post(
        Uri.parse( "$_context/login"),
        headers:  {
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: paramData
    );
  }

  static Future<Response> post(String url, var paramData) async{
   print("post : $_context$url" );
   print("paramData : $paramData" );
   var token =  await storage.read(key: '_token');
    return await http.post(
        Uri.parse( "$_context$url"),
        headers:  {
                    "Content-Type": "application/json;charset=UTF-8",
                    "Authorization": "Bearer $token"
        },
        body: paramData
    );
  }

  static Future<Response> get(String url, var paramData) async{
    print("get : $url" );
    var token =  await storage.read(key: '_token');
    print("token : $token" );
    return await http.get(
        Uri.parse( "$_context$url"),
        headers: {
                   "Content-Type": "application/json;charset=UTF-8",
                   "Authorization": "Bearer $token"
        }
    );
  }
}