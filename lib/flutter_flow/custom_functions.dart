import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? regixNumberFormat(String numberText) {
  int number = int.parse(numberText);
  return NumberFormat('###,###,###,###')
      .format(number)
      .replaceAll(' ', '')
      .toString();
}

String? totalArrayItem(List<String> array) {
  int sum = 0;
  array.forEach((str) => sum += int.parse(str));

  return sum.toString();
}

String? getThumbnail(String uid) {
  return "https://storage.googleapis.com/h-startup_pub_picture/pictures/${uid}/1.png";
}

List<String> getImageArray(
  String imageUid,
  int countImage,
) {
  List<String> arr = [];
  for (var i = countImage; i > 0; i--) {
    arr.add(
        "https://storage.googleapis.com/h-startup_pub_picture/pictures/${imageUid}/${i}.png");
  }
  arr.sort((y, x) => y.compareTo(x));
  return arr;
}

List<String> getRecommendPartsImageUrl(List<String> uid) {
  List<String> array = [];
  for (int i = 0; i < uid.length; i++) {
    array.add(
        "https://storage.googleapis.com/h-startup_pub_picture/pictures/${uid[i]}/1.png");
  }
  print(array);
  return array;
}
