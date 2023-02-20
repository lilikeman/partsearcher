// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;

class CardView extends StatefulWidget {
  const CardView({Key? key, this.width, this.height}) : super(key: key);
  final double? width;
  final double? height;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchForm(),
      ],
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  var list = [];
  var selectIndex = 0;

  String keyword = "";

  void onClickSearch(String partNum) async {
    print("$partNum 검색시작");
    var request = await http.get(Uri.parse(
        "https://us-central1-h-startup.cloudfunctions.net/getpart?OEM_part_number=$partNum&uid=8e856f61cc464235b308f46dc0bd1c32"));
    var response = jsonDecode(request.body);
    if (response["parts"] != "") {
      setState(() {
        List<ListItem> items = [];
        for (var i = 0; i < response["parts"].length; i++) {
          ListItem item = ListItem(
              partName: response["parts"][i]["epik_def_info"]["name"] as String,
              vendorId: response["parts"][i]["vendor_id"] as String,
              epikPrice:
                  response["parts"][i]["epik_def_info"]["price"] as String,
              oemPrice: response["parts"][i]["oem_def_inf"]["price"] as String,
              savePrice: (int.parse(
                          response["parts"][i]["oem_def_inf"]["price"]) -
                      int.parse(response["parts"][i]["oem_def_inf"]["price"]))
                  .toString() as String,
              refundPrice: getRefundPrice(
                  response["parts"][i]["epik_def_info"]["type"],
                  response["parts"][i]["oem_def_inf"]["price"]) as String,
              epikUid: response["parts"][i]["epik_uid"] as String,
              partType: response["parts"][i]["epik_def_info"]["type"] as String,
              idx: 0,
              vendorPic: response["parts"][i]["vendor_def_info"]["pic"]);
          items.add(item);
        }
        list.add(items);
      });
    }
  }

  String getRefundPrice(String type, String oemPrice) {
    if (type == "001") {
      return (int.parse(oemPrice) * 0.25).toString();
    } else if (type == "002") {
      return (int.parse(oemPrice) * 0.2).toString();
    } else {
      return oemPrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(
            "부품번호로 부품을 조회합니다.",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Text("구매하고자 하시는 부품의\n부품번호를 입력한 후 검색을 눌러주세요."),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: TextField(
                onChanged: (v) {
                  setState(() {
                    keyword = v;
                  });
                },
                decoration: InputDecoration(
                    hintText: "부품번호 입력(띄어쓰기 없이)",
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Color(0xff2e5252)))),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: SizedBox(
                  width: 70,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        onClickSearch(keyword);
                      },
                      child: Text("검색",
                          style: TextStyle(
                              color: Color(0xff2e5252), fontSize: 15)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
                        backgroundColor: Color(0xffffffff),
                        side: BorderSide(width: 1.0, color: Color(0xff2e5252)),
                      )),
                ),
              )
            ],
          ),
        ),
        CustomListView(list: list),
        // Container(
        //   child: Row(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //     children: [
        //       SizedBox(
        //         width: 200,
        //         height: 50,
        //         child: ElevatedButton(
        //             onPressed: () {},
        //             child: Text("장바구니 담기", style: TextStyle(color: Color(0xff2e5252), fontSize: 20)),
        //             style: ElevatedButton.styleFrom(
        //               padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
        //               backgroundColor: Color(0xffffffff),
        //               side: BorderSide(width: 1.0, color: Color(0xff2e5252)),
        //             )),
        //       ),
        //       SizedBox(
        //         width: 200,
        //         height: 50,
        //         child: ElevatedButton(
        //             onPressed: () {},
        //             child: Text("선택한 부품 구매", style: TextStyle(color: Color(0xffffffff), fontSize: 20)),
        //             style: ElevatedButton.styleFrom(
        //               padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
        //               backgroundColor: Color(0xff2e5252),
        //               side: BorderSide(width: 1.0, color: Color(0xff2e5252)),
        //             )),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}

class CustomListView extends StatefulWidget {
  const CustomListView({Key? key, this.list}) : super(key: key);
  final list;

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  int _photoIndex = 0;
  int _selectIndex = 0;

  int _listLength = 0;
  List<int> _selectedIndices = [];

  String getVendorName(String vendorId) {
    if (vendorId == "0001") {
      return "인선모터스";
    } else if (vendorId == "0002") {
      return "카프렌즈";
    } else if (vendorId == "0003") {
      return "에이티랩스오토";
    } else {
      return "미상";
    }
  }

  String getRefund(String partsType, String oemPrice) {
    if (partsType == "001") {
      return (int.parse(oemPrice) * 0.25).toString();
    } else if (partsType == "002") {
      return (int.parse(oemPrice) * 0.2).toString();
    } else {
      return oemPrice;
    }
  }

  String divideNumber(String number) {
    int num = int.parse(number);
    return NumberFormat('###,###,###,###')
        .format(num)
        .replaceAll(' ', '')
        .toString();
  }

  int _getTotalEpikPrice() {
    int total = 0;
    for (int i = 0; i < _listLength; i++) {
      total += int.tryParse(
              widget.list[i][_selectedIndices[i]].epikPrice.toString()) ??
          0;
    }
    return total;
  }

  String partClassify(String partClassifyId) {
    if (partClassifyId == "001") {
      return "중고품(재사용품)";
    } else if (partClassifyId == "002") {
      return "품질인증품";
    } else if (partClassifyId == "003") {
      return "재제조";
    } else if (partClassifyId == "004") {
      return "애프터마켓";
    } else if (partClassifyId == "005") {
      return "제조사신품(OEM)";
    } else if (partClassifyId == "006") {
      return "KAPA인증품";
    } else {
      return "미상";
    }
  }

  List<String> getImageArray(String imageUid, int countImage) {
    List<String> arr = [];
    for (var i = countImage; i > 0; i--) {
      arr.add(
          "https://storage.googleapis.com/h-startup_pub_picture/pictures/${imageUid}/${i}.png");
    }
    arr.sort((y, x) => y.compareTo(x));
    return arr;
  }

  @override
  void initState() {
    super.initState();
    _listLength = widget.list.length;
    _selectedIndices = List.filled(_listLength, 0);
  }

  @override
  void didUpdateWidget(CustomListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.list.length != _listLength) {
      setState(() {
        _listLength = widget.list.length;
        _selectedIndices = List.filled(_listLength, 0);
      });
    }
  }

  String bottomSheetPhotoIndex = "1";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.list.length == 0
              ? Container(
                  child: Row(
                    children: [Text("검색결과 없음")],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                )
              : Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("구매금액 합계 ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                              Text(
                                  "${divideNumber(_getTotalEpikPrice().toString())}원",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Color(0xff2e5252),
                                      fontWeight: FontWeight.w800))
                            ],
                          ),
                          Container(
                              color: Color(0xffeeeeee),
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: ListView.builder(
                                  itemCount: widget.list.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Container(
                                        color: Color(0xffffffff),
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 15),
                                                child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        widget
                                                            .list[i]
                                                                [_selectIndex]
                                                            .partName
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(Icons
                                                              .close_rounded))
                                                    ]),
                                              ),
                                              Row(
                                                // mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 70, 0),
                                                    child: Column(
                                                      // mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Image.network(
                                                                "https://storage.googleapis.com/h-startup_pub_picture/pictures/${widget.list[i][_selectedIndices[i]].epikUid.toString()}/1.png",
                                                                width: 240,
                                                                height: 240,
                                                                fit: BoxFit
                                                                    .cover),
                                                            Row(
                                                              // mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                          5,
                                                                          5,
                                                                          60,
                                                                          0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(4),
                                                                    color: Color(
                                                                        0xffb79d64),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    child: Text(
                                                                      partClassify(widget
                                                                          .list[
                                                                              i]
                                                                              [
                                                                              _selectedIndices[i]]
                                                                          .partType
                                                                          .toString()),
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffffffff),
                                                                          fontSize:
                                                                              16),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          5,
                                                                          5,
                                                                          0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: 40,
                                                                    height: 40,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          30,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xffffffff),
                                                                      child:
                                                                          IconButton(
                                                                        color: Color(
                                                                            0xff000000),
                                                                        iconSize:
                                                                            20,
                                                                        icon: Icon(
                                                                            Icons.zoom_in),
                                                                        onPressed:
                                                                            () {
                                                                          showModalBottomSheet(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              return StatefulBuilder(
                                                                                builder: (BuildContext context, setState) {
                                                                                  final imageKey = UniqueKey();
                                                                                  return SizedBox(
                                                                                    height: MediaQuery.of(context).size.height * 0.9,
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Padding(
                                                                                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                                                                            child: Row(
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close_rounded)),
                                                                                                Padding(
                                                                                                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                                                                                  child: Text("더보기", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                                                                                )
                                                                                              ],
                                                                                            )),
                                                                                        Padding(
                                                                                          padding: EdgeInsets.fromLTRB(20, 15, 15, 20),
                                                                                          child: Image.network(
                                                                                            "https://storage.googleapis.com/h-startup_pub_picture/pictures/${widget.list[i][_selectedIndices[i]].epikUid.toString()}/$bottomSheetPhotoIndex.png",
                                                                                            key: imageKey,
                                                                                            height: MediaQuery.of(context).size.height * 0.25,
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.of(context).size.width,
                                                                                              height: MediaQuery.of(context).size.height * 0.15,
                                                                                              child: ListView.builder(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: widget.list[i][_selectedIndices[i]].vendorPic.length,
                                                                                                itemBuilder: (cntx, idx) {
                                                                                                  return InkWell(
                                                                                                    onTap: () {
                                                                                                      setState(() {
                                                                                                        bottomSheetPhotoIndex = (idx + 1).toString();
                                                                                                      });
                                                                                                    },
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                                                                                      child: Image.network(
                                                                                                        "https://storage.googleapis.com/h-startup_pub_picture/pictures/${widget.list[i][_selectedIndices[i]].epikUid.toString()}/${idx + 1}.png",
                                                                                                        width: 80,
                                                                                                        height: 50,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        getVendorName(widget
                                                            .list[i][
                                                                _selectedIndices[
                                                                    i]]
                                                            .vendorId
                                                            .toString()),
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 7, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text("추천부품가격 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            Text(
                                                                "${divideNumber(widget.list[i][_selectedIndices[i]].epikPrice.toString())}원",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Color(
                                                                        0xffb79d64))),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 7, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text("신품가격 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xffa9a9a9))),
                                                            Text(
                                                                "${divideNumber(widget.list[i][_selectedIndices[i]].oemPrice.toString())}원",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Color(
                                                                        0xffa9a9a9))),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 7, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text("절감금액 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            Text(
                                                                "${divideNumber((int.parse(widget.list[i][_selectedIndices[i]].oemPrice.toString()) - int.parse(widget.list[i][_selectedIndices[i]].epikPrice.toString())).toString())}원",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 7, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text("환급금 ",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                            Text(
                                                                "${divideNumber(getRefund(widget.list[i][_selectedIndices[i]].partType.toString(), widget.list[i][_selectedIndices[i]].oemPrice.toString()))}원",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600)),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 7, 0, 5),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("최적부품목록"),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                          color:
                                                              Color(0xffeeeeee),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 90,
                                                          child:
                                                              ListView.builder(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemCount:
                                                                      widget
                                                                          .list[
                                                                              i]
                                                                          .length,
                                                                  itemBuilder:
                                                                      (BuildContext
                                                                              c,
                                                                          int index) {
                                                                    return InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            _selectedIndices[i] =
                                                                                index;
                                                                          });
                                                                        },
                                                                        child: Padding(
                                                                            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                                                                            child: Stack(
                                                                              children: [
                                                                                Image.network(
                                                                                  "https://storage.googleapis.com/h-startup_pub_picture/pictures/${widget.list[i][index].epikUid.toString()}/1.png",
                                                                                  width: 75,
                                                                                  height: 90,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                                Container(
                                                                                  margin: EdgeInsets.fromLTRB(3, 3, 0, 0),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(4),
                                                                                    color: Color(0xffb79d64),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(5),
                                                                                    child: Text(
                                                                                      "${partClassify(widget.list[i][_selectedIndices[i]].partType.toString()).substring(0, 4)}...",
                                                                                      style: TextStyle(color: Color(0xffffffff), fontSize: 12),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )));
                                                                  }))
                                                    ],
                                                  ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                        ],
                      )))
        ],
      ),
    );
  }
}

class ListItem {
  String partName;
  String vendorId;
  String epikPrice;
  String oemPrice;
  String savePrice;
  String refundPrice;
  String epikUid;
  String partType;
  int idx;
  List<dynamic> vendorPic;

  ListItem(
      {required this.partName,
      required this.vendorId,
      required this.epikPrice,
      required this.oemPrice,
      required this.savePrice,
      required this.refundPrice,
      required this.epikUid,
      required this.partType,
      required this.idx,
      required this.vendorPic});

  @override
  String toString() {
    return 'ListItem{epikUid: $epikUid}';
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
