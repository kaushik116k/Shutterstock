import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:shutterstock/strings.dart';
import 'models/Assets.dart';
import 'models/Data.dart';
import 'models/HugeThumb.dart';
import 'models/LargeThumb.dart';
import 'models/Model.dart';
import 'models/Preview.dart';
import 'models/Preview1000.dart';
import 'models/Preview1500.dart';
import 'models/SmallThumb.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
const String hiveBox = "new_shutterBox";
late Model model;
const String _baseURL = Constants.url;
int _page = 1;
const int _limit = 5;
final _controller = ScrollController();
String dimensions = "Preview";
var list = [];
Box<dynamic> globalBox = Hive.box<dynamic>(hiveBox);
late bool connection;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Data>(DataAdapter());
  Hive.registerAdapter<Assets>(AssetsAdapter());
  Hive.registerAdapter<Preview>(PreviewAdapter());
  Hive.registerAdapter<Preview1000>(Preview1000Adapter());
  Hive.registerAdapter<Preview1500>(Preview1500Adapter());
  Hive.registerAdapter<LargeThumb>(LargeThumbAdapter());
  Hive.registerAdapter<SmallThumb>(SmallThumbAdapter());
  Hive.registerAdapter<HugeThumb>(HugeThumbAdapter());
  await Hive.openBox<dynamic>(hiveBox);
  runApp(ShutterStockApiIntegration());
}

class ShutterStockApiIntegration extends StatefulWidget {
  const ShutterStockApiIntegration({super.key});

  @override
  State<ShutterStockApiIntegration> createState() => AppState();
}

class AppState extends State<ShutterStockApiIntegration> {
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  Future<void> fetch() async {
    http.Response response = await http
        .get(Uri.parse("$_baseURL?per_page=$_limit&page=$_page "), headers: {
      "Authorization": Constants.token,
    });
    if (response.statusCode == 200) {
      print("fetching data");
      try {
        setState(() {
          Map<String, dynamic> userMap = json.decode(response.body);
          model = Model.fromJson(userMap);
          list.addAll(model.data);
          print(list.length);
        });
        globalBox.clear();

      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source)  {
      setState(() => _source = source);
      if(connection) pagenationData();;
    });
    //call();
  }

  @override
  Widget build(BuildContext context) {
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        connection = true;
        break;
      case ConnectivityResult.wifi:
        connection = true;
        break;
      case ConnectivityResult.none:
      default:
        connection = false;
    }
    print("connection: $connection");
    return HomePage();
  }

  void pagenationData() {
      if(_page == 1){
        print("calling fetch function");
        fetch();
        _page++;
      }
      _controller.addListener(() {
        if(_controller.position.pixels == _controller.position.maxScrollExtent){
          fetch();
          _page++;
        }
      });
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Shutter Stock"),
            actions: [
              PopupMenuButton(itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  child: Text('Preview'),
                  value: 0,
                ),
                const PopupMenuItem(
                  child: Text('Preview 1000'),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text('Preview 1500'),
                  value: 2,
                ),
                const PopupMenuItem(
                  child: Text('Small Thumb'),
                  value: 3,
                ),
                const PopupMenuItem(
                  child: Text('Large Thumb'),
                  value: 4,
                ),
                const PopupMenuItem(
                  child: Text('Huge Thumb'),
                  value: 5,
                ),
              ],
                onSelected: (result) async {
                  switch (result) {
                    case 0:
                      dimensions = "Preview";
                      //list.removeRange(0, list.length);
                      _page = 1;
                      //AppState().call();
                      break;
                    case 1:
                      dimensions = "Preview_1000";
                      //list.removeRange(0, list.length);
                      _page = 1;
                      //AppState().call();
                      break;
                    case 2:
                      dimensions = "Preview_1500";
                      //list.removeRange(0, list.length);
                      _page = 1;
                      //AppState().call();
                      break;
                    case 3:
                      dimensions = "SmallThumb";
                      //list.removeRange(0, list.length);
                      _page = 1;
                      //AppState().call();
                      break;
                    case 4:
                      dimensions = "LargeThumb";
                      //list.removeRange(0, list.length);
                      _page = 1;
                      //AppState().call();
                      break;
                    case 5:
                      dimensions = "HugeThumb";
                      //list.removeRange(0, list.length);
                      _page = 1;
                      //AppState().call();
                      break;
                  }
                },
              )
            ],
          ),
          body: ValueListenableBuilder(
            valueListenable: Hive.box<dynamic>(hiveBox).listenable(),
            builder: ((context, Box<dynamic> box, _) {
              globalBox.add(list);
              if(!connection && box.isEmpty){
                return Center(child: Text("No data available"),);
              }
              else if(!connection && box.isNotEmpty){
                return ListView.separated(
                  itemBuilder: (context, index){
                    return offlineData(index);
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: box.getAt(0).length,
                );
              }
              else{
                //AppState().call();
                return NetworkData();
              }
            }
            ),
          )
      ),
    );
  }
}

class NetworkData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _controller,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: list.length + 1,
      itemBuilder: (context, index)  {
        if(index < list.length){
          return displayImages(index, dimensions);
        }
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class displayImages extends StatelessWidget{
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );
  late int index;
  String dimensions = "Preview";
  displayImages(this.index, this.dimensions);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          if(dimensions == "Preview")...[
            CachedNetworkImage(
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: list[index].assets.preview.url,),
            Text("width : ${list[index].assets.preview.width}"),
            Text("height : ${list[index].assets.preview.height}"),
            //addDataToBox(dimensions, index),
          ] else if(dimensions == "Preview_1000") ...[
            CachedNetworkImage(
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: list[index].assets.preview_1000.url,),
            Text("width : ${list[index].assets.preview_1000.width}"),
            Text("height : ${list[index].assets.preview_1000.height}"),
          ] else if(dimensions == "Preview_1500") ...[
            CachedNetworkImage(
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: list[index].assets.preview_1500.url,),
            Text("width : ${list[index].assets.preview_1500.width}"),
            Text("height : ${list[index].assets.preview_1500.height}"),
          ] else if(dimensions == "SmallThumb") ...[
            CachedNetworkImage(
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: list[index].assets.small_thumb.url,),
            Text("width : ${list[index].assets.small_thumb.width}"),
            Text("height : ${list[index].assets.small_thumb.height}"),
          ] else if(dimensions == "LargeThumb") ...[
            CachedNetworkImage(
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: list[index].assets.large_thumb.url,),
            Text("width : ${list[index].assets.large_thumb.width}"),
            Text("height : ${list[index].assets.large_thumb.height}"),
          ] else if(dimensions == "HugeThumb") ...[
            CachedNetworkImage(
              cacheManager: customCacheManager,
              key: UniqueKey(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: list[index].assets.huge_thumb.url,),
            Text("width : ${list[index].assets.huge_thumb.width}"),
            Text("height : ${list[index].assets.huge_thumb.height}"),
          ]
        ],
      ),
    );
  }
}

class offlineData extends StatelessWidget{
  late int index;
  offlineData(this.index);
  var data = globalBox.getAt(0);

  static final customCacheManager = CacheManager(
      Config(
        'customCacheKey',
        stalePeriod: const Duration(days: 15),
        maxNrOfCacheObjects: 100,
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(dimensions == "Preview")...[
          CachedNetworkImage(
            cacheManager: customCacheManager,
            key: UniqueKey(),
            imageUrl: data[index].assets.preview.url,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("width : ${data[index].assets.preview.width}"),
          Text("height : ${data[index].assets.preview.height}"),
          //addDataToBox(dimensions, index),
        ] else if(dimensions == "Preview_1000") ...[
          CachedNetworkImage(
            cacheManager: customCacheManager,
            key: UniqueKey(),
            imageUrl: data[index].assets.preview_1000.url,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("width : ${data[index].assets.preview_1000.width}"),
          Text("height : ${data[index].assets.preview_1000.height}"),
        ] else if(dimensions == "Preview_1500") ...[
          CachedNetworkImage(
            cacheManager: customCacheManager,
            key: UniqueKey(),
            imageUrl: data[index].assets.preview_1500.url,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("width : ${data[index].assets.preview_1500.width}"),
          Text("height : ${data[index].assets.preview_1500.height}"),
        ] else if(dimensions == "SmallThumb") ...[
          CachedNetworkImage(
            cacheManager: customCacheManager,
            key: UniqueKey(),
            imageUrl: data[index].assets.small_thumb.url,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("width : ${data[index].assets.small_thumb.width}"),
          Text("height : ${data[index].assets.small_thumb.height}"),
        ] else if(dimensions == "LargeThumb") ...[
          CachedNetworkImage(
            cacheManager: customCacheManager,
            key: UniqueKey(),
            imageUrl: data[index].assets.large_thumb.url,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("width : ${data[index].assets.large_thumb.width}"),
          Text("height : ${data[index].assets.large_thumb.height}"),
        ] else if(dimensions == "HugeThumb") ...[
          CachedNetworkImage(
            cacheManager: customCacheManager,
            key: UniqueKey(),
            imageUrl: data[index].assets.huge_thumb.url,
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text("width : ${data[index].assets.huge_thumb.width}"),
          Text("height : ${data[index].assets.huge_thumb.height}"),
        ]
      ],
    );
  }
}

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      print('commit 1');
      print('commit 2');
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}

