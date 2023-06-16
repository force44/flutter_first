
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpUtils {

  // static const url = "http://4.230.35.161:8080";
  static const _context = "http://localhost:81";


  static Future<Response> post(String url, var paramData) async{
    return await http.post(
        Uri.parse( "$_context$url"),
        headers: {"Content-Type": "application/json;charset=UTF-8"},
        body: paramData
    );
  }

  static Future<Response> get(String url, var paramData) async{
    return await http.get(
        Uri.parse( "$_context$url"),
        headers: {"Content-Type": "application/json;charset=UTF-8"}
    );
  }
}