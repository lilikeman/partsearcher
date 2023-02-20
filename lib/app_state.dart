import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _searchResult;
  dynamic get searchResult => _searchResult;
  set searchResult(dynamic _value) {
    _searchResult = _value;
  }

  List<dynamic> _searchResultList = [];
  List<dynamic> get searchResultList => _searchResultList;
  set searchResultList(List<dynamic> _value) {
    _searchResultList = _value;
  }

  void addToSearchResultList(dynamic _value) {
    _searchResultList.add(_value);
  }

  void removeFromSearchResultList(dynamic _value) {
    _searchResultList.remove(_value);
  }

  void removeAtIndexFromSearchResultList(int _index) {
    _searchResultList.removeAt(_index);
  }

  String _atLabsAuto = '에이티랩스오토';
  String get atLabsAuto => _atLabsAuto;
  set atLabsAuto(String _value) {
    _atLabsAuto = _value;
  }

  String _carFriends = '카프렌즈';
  String get carFriends => _carFriends;
  set carFriends(String _value) {
    _carFriends = _value;
  }

  String _insumMotors = '인선모터스';
  String get insumMotors => _insumMotors;
  set insumMotors(String _value) {
    _insumMotors = _value;
  }

  String _atLabsAutoCodeNum = '0003';
  String get atLabsAutoCodeNum => _atLabsAutoCodeNum;
  set atLabsAutoCodeNum(String _value) {
    _atLabsAutoCodeNum = _value;
  }

  String _carFriendsCodeNum = '0002';
  String get carFriendsCodeNum => _carFriendsCodeNum;
  set carFriendsCodeNum(String _value) {
    _carFriendsCodeNum = _value;
  }

  String _insunMotorsCodeNum = '0001';
  String get insunMotorsCodeNum => _insunMotorsCodeNum;
  set insunMotorsCodeNum(String _value) {
    _insunMotorsCodeNum = _value;
  }

  String _sumPartsPrice = '0';
  String get sumPartsPrice => _sumPartsPrice;
  set sumPartsPrice(String _value) {
    _sumPartsPrice = _value;
  }

  List<String> _searchKeywordList = [];
  List<String> get searchKeywordList => _searchKeywordList;
  set searchKeywordList(List<String> _value) {
    _searchKeywordList = _value;
  }

  void addToSearchKeywordList(String _value) {
    _searchKeywordList.add(_value);
  }

  void removeFromSearchKeywordList(String _value) {
    _searchKeywordList.remove(_value);
  }

  void removeAtIndexFromSearchKeywordList(int _index) {
    _searchKeywordList.removeAt(_index);
  }

  String _thumbnail = '';
  String get thumbnail => _thumbnail;
  set thumbnail(String _value) {
    _thumbnail = _value;
  }

  List<String> _imageList = [];
  List<String> get imageList => _imageList;
  set imageList(List<String> _value) {
    _imageList = _value;
  }

  void addToImageList(String _value) {
    _imageList.add(_value);
  }

  void removeFromImageList(String _value) {
    _imageList.remove(_value);
  }

  void removeAtIndexFromImageList(int _index) {
    _imageList.removeAt(_index);
  }

  String _used = '001';
  String get used => _used;
  set used(String _value) {
    _used = _value;
  }

  String _qulityAsured = '002';
  String get qulityAsured => _qulityAsured;
  set qulityAsured(String _value) {
    _qulityAsured = _value;
  }

  String _reManufact = '003';
  String get reManufact => _reManufact;
  set reManufact(String _value) {
    _reManufact = _value;
  }

  String _am = '004';
  String get am => _am;
  set am(String _value) {
    _am = _value;
  }

  String _oem = '005';
  String get oem => _oem;
  set oem(String _value) {
    _oem = _value;
  }

  String _kapa = '006';
  String get kapa => _kapa;
  set kapa(String _value) {
    _kapa = _value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool _value) {
    _isLoading = _value;
  }

  bool _isVisible = false;
  bool get isVisible => _isVisible;
  set isVisible(bool _value) {
    _isVisible = _value;
  }

  String _imgSrc = '';
  String get imgSrc => _imgSrc;
  set imgSrc(String _value) {
    _imgSrc = _value;
  }

  List<String> _searchKeywordArray = [];
  List<String> get searchKeywordArray => _searchKeywordArray;
  set searchKeywordArray(List<String> _value) {
    _searchKeywordArray = _value;
  }

  void addToSearchKeywordArray(String _value) {
    _searchKeywordArray.add(_value);
  }

  void removeFromSearchKeywordArray(String _value) {
    _searchKeywordArray.remove(_value);
  }

  void removeAtIndexFromSearchKeywordArray(int _index) {
    _searchKeywordArray.removeAt(_index);
  }

  String _partsName = '';
  String get partsName => _partsName;
  set partsName(String _value) {
    _partsName = _value;
  }

  String _vendorId = '';
  String get vendorId => _vendorId;
  set vendorId(String _value) {
    _vendorId = _value;
  }

  String _partsClassify = '';
  String get partsClassify => _partsClassify;
  set partsClassify(String _value) {
    _partsClassify = _value;
  }

  String _epikPrice = '';
  String get epikPrice => _epikPrice;
  set epikPrice(String _value) {
    _epikPrice = _value;
  }

  String _oemPrice = '';
  String get oemPrice => _oemPrice;
  set oemPrice(String _value) {
    _oemPrice = _value;
  }

  String _savePrice = '';
  String get savePrice => _savePrice;
  set savePrice(String _value) {
    _savePrice = _value;
  }

  String _refund = '';
  String get refund => _refund;
  set refund(String _value) {
    _refund = _value;
  }

  String _epikUid = '';
  String get epikUid => _epikUid;
  set epikUid(String _value) {
    _epikUid = _value;
  }

  String _vendorName = '';
  String get vendorName => _vendorName;
  set vendorName(String _value) {
    _vendorName = _value;
  }

  dynamic _partsSearchResultJson;
  dynamic get partsSearchResultJson => _partsSearchResultJson;
  set partsSearchResultJson(dynamic _value) {
    _partsSearchResultJson = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
