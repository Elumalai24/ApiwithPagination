import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/products_model.dart';

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/products';

  Future<List<Products>> getProducts(
      {required int page, required int limit}) async {
    final res =
        await http.get(Uri.parse('$_baseUrl?_page=$page&_limit=$limit'));
    final Map<String, dynamic> decodedMap = json.decode(res.body);
    List<dynamic> products = decodedMap['products'];
    return products.map((item) => Products.fromJson(item)).toList();
  }
}
