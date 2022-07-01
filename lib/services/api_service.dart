import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_codigo5_museumapp/models/artist_model.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class APIService{

  Logger logger = Logger();

  Future<List<MuseumModel>> getMuseums() async{
    try{
      String _path = "http://192.168.1.6:8000/API/museum/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);

      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List museums = jsonDecode(source);
        List<MuseumModel> museumList = museums.map<MuseumModel>((e) => MuseumModel.fromJson(e)).toList();
        return museumList;
      }
      return [];
    } on TimeoutException catch(error){
      return Future.error("Error TimeoutException");
    } on SocketException catch(error){
      return Future.error("Error SocketException");
    } on FormatException catch(error){
      return Future.error("Error FormatException");
    }
    on Error catch(error){
      print(error);
      return Future.error("Error");
    }
  }

  Future<List<ArtistModel>> getArtists() async{
    try{
      String _path = "http://192.168.1.6:8000/API/artists/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      //logger.i(response.body);
      if(response.statusCode == 200){
        String source = Utf8Decoder().convert(response.bodyBytes);
        List artistList = jsonDecode(source);
        List<ArtistModel> artistModelList = artistList.map<ArtistModel>((e) => ArtistModel.fromJson(e)).toList();
        return artistModelList;
      }
      return [];

    }on TimeoutException catch(error){
      return Future.error("Error TimeoutException");
    } on SocketException catch(error){
      //logger.e(error);
      return Future.error("Error SocketException");
    } on FormatException catch(error){
      return Future.error("Error FormatException");
    }
    on Error catch(error){
      print(error);
      return Future.error("Error");
    }
  }
}