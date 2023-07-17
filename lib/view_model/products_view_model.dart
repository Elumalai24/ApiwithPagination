import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/products_model.dart';
import '../service/api.dart';

class HomeViewModel extends ChangeNotifier {
  final _apiService = ApiService();
  int _page = 0;
  final int _limit = 10;
  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;
  List<Products> _posts = [];
  late ScrollController _scrollController;

  final _postsController = StreamController<List<Products>>.broadcast();
  Stream<List<Products>> get postsStream => _postsController.stream;

  ScrollController get scrollController => _scrollController;

  bool get isLoadMoreRunning => _isLoadMoreRunning;

  HomeViewModel() {
    _scrollController = ScrollController();
    _scrollController.addListener(_loadMore);
    _firstLoad();
  }

  void _loadMore() async {
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _scrollController.position.extentAfter < 100) {
      _isLoadMoreRunning = true;
      notifyListeners();

      _page += 1;

      try {
        final List<Products> products = await _apiService.getProducts(
          page: _page,
          limit: _limit,
        );
        if (products.isNotEmpty) {
          _posts.addAll(products);
          _postsController.add(_posts);
        } else {
          _hasNextPage = false;
        }
      } catch (err) {
        if (kDebugMode) {
          print('Catched Error$err');
        }
      }

      _isLoadMoreRunning = false;
      notifyListeners();
    }
  }

  void _firstLoad() async {
    _isFirstLoadRunning = true;
    notifyListeners();

    try {
      final List<Products> products = await _apiService.getProducts(
        page: _page,
        limit: _limit,
      );
      _posts = products;
      _postsController.add(_posts);
    } catch (err) {
      if (kDebugMode) {
        print('Catched Error$err');
      }
    }

    _isFirstLoadRunning = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _postsController.close();
    _scrollController.dispose();
    super.dispose();
  }
}
