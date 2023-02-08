import 'package:flutter/material.dart';
import 'package:flutter_api_provider/api_provider.dart';

import 'album.dart';

class AlbumApiProvider extends APIProvider with ChangeNotifier {
  static AlbumApiProvider? _instance;
  List<Todos> _todoList=[];
  List<Todos> get todos => _todoList;
   bool isLoading = false;
  AlbumApiProvider._internal();
  factory AlbumApiProvider() {
    return _instance ?? AlbumApiProvider._internal();
  }

  @override
  String get apiUrl => '/todos';

  Future<void> fetchAlbums() async {
    isLoading = true;
    notifyListeners();
    var data = await fetch();
    _todoList = data;
    isLoading = false;
    notifyListeners();
    
  }
}
