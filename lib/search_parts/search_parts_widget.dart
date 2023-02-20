import '../backend/api_requests/api_calls.dart';
import '../components/loading_card_view_widget.dart';
import '../components/more_view_modal_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_parts_model.dart';
export 'search_parts_model.dart';

class SearchPartsWidget extends StatefulWidget {
  const SearchPartsWidget({Key? key}) : super(key: key);

  @override
  _SearchPartsWidgetState createState() => _SearchPartsWidgetState();
}

class _SearchPartsWidgetState extends State<SearchPartsWidget> {
  late SearchPartsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPartsModel());

    _model.inputSearchKeywordController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            '부품번호로 부품검색',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'SpoqaHanSansNeo',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 70,
          elevation: 1,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            '부품번호로 부품을 조회합니다.',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'SpoqaHanSansNeo',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            '구매하고자 하시는 부품의\n부품번호를 입력한 후 검색을 눌러주세요.',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'SpoqaHanSansNeo',
                                      color: Colors.black,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: TextFormField(
                                  controller:
                                      _model.inputSearchKeywordController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: '부품번호 입력(띄어쓰기 없이)',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF98A2B3),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'SpoqaHanSansNeo',
                                        color: Colors.black,
                                        useGoogleFonts: false,
                                      ),
                                  validator: _model
                                      .inputSearchKeywordControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                if (_model.inputSearchKeywordController.text !=
                                    '') {
                                  if ((FFAppState().searchKeywordList.contains(
                                              _model
                                                  .inputSearchKeywordController
                                                  .text) ==
                                          false) ||
                                      (FFAppState().searchKeywordList.contains(
                                              FFAppState()
                                                  .searchResultList
                                                  .contains(getJsonField(
                                                    (_model.searchResult
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.parts[*].part_number''',
                                                  ))) ==
                                          false)) {
                                    if ((String keywordInput) {
                                      return keywordInput.split("-").length > 1;
                                    }(_model
                                        .inputSearchKeywordController.text)) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('서비스 준비중'),
                                            content:
                                                Text('다중 부품검색 서비스는 준비중입니다.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      FFAppState().update(() {
                                        FFAppState().isLoading = true;
                                        FFAppState().isVisible = true;
                                      });
                                      _model.searchResult =
                                          await GetPartsSearchDataCall.call(
                                        oEMPartNumber: _model
                                            .inputSearchKeywordController.text
                                            .trim(),
                                      );
                                      _shouldSetState = true;
                                      if (getJsonField(
                                            (_model.searchResult?.jsonBody ??
                                                ''),
                                            r'''$.parts''',
                                          ) !=
                                          null) {
                                        FFAppState()
                                            .addToSearchResultList(getJsonField(
                                          (_model.searchResult?.jsonBody ?? ''),
                                          r'''$''',
                                        ));
                                        FFAppState().searchResult =
                                            getJsonField(
                                          (_model.searchResult?.jsonBody ?? ''),
                                          r'''$''',
                                        );
                                        FFAppState().update(() {
                                          FFAppState().addToSearchKeywordList(
                                              _model
                                                  .inputSearchKeywordController
                                                  .text);
                                        });
                                        FFAppState().update(() {
                                          FFAppState().sumPartsPrice =
                                              (int.parse(FFAppState()
                                                          .sumPartsPrice) +
                                                      int.parse(getJsonField(
                                                        (_model.searchResult
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.parts[0].vendor_def_info.price''',
                                                      ).toString()))
                                                  .toString();
                                        });
                                        FFAppState().update(() {
                                          FFAppState().isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '추가되었습니다!',
                                              style: TextStyle(
                                                fontFamily: 'SpoqaHanSansNeo',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1500),
                                            backgroundColor: Color(0xB32E5252),
                                          ),
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '검색 결과가 없습니다.',
                                              style: TextStyle(
                                                fontFamily: 'SpoqaHanSansNeo',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 1500),
                                            backgroundColor: Color(0xB32E5252),
                                          ),
                                        );
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '이미 검색된 결과가 있습니다.',
                                          style: TextStyle(
                                            fontFamily: 'SpoqaHanSansNeo',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 1500),
                                        backgroundColor: Color(0xB32E5252),
                                      ),
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '검색어가 입력되지 않았습니다.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xB32E5252),
                                    ),
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: '검색',
                              options: FFButtonOptions(
                                width: 80,
                                height: 50,
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'SpoqaHanSansNeo',
                                      color: Color(0xFF2E5252),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF2E5252),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              showLoadingIndicator: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (FFAppState().isVisible == true)
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '다른 부품도 구매를 원하시는 경우, 검색을 이어서 시도해주세요. \n구매를 원치 않는 항목은 x를 눌러 삭제하실 수 있습니다.\n여러개의 부품을 동시에 검색할 경우, 부품번호에 \'-\' 표시를 넣어 \n검색하십시오.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'SpoqaHanSansNeo',
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '구매금액 합계 ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'SpoqaHanSansNeo',
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.regixNumberFormat(
                                                    FFAppState().sumPartsPrice),
                                                '0',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'SpoqaHanSansNeo',
                                                    color: Color(0xFF2E5252),
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Text(
                                              '원',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily:
                                                        'SpoqaHanSansNeo',
                                                    color: Color(0xFF2E5252),
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.bold,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                    ),
                                    child: SingleChildScrollView(
                                      controller: _model.columnController,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final searchResultCardView =
                                                  FFAppState()
                                                      .searchResultList
                                                      .map((e) => e)
                                                      .toList();
                                              return InkWell(
                                                onTap: () async {
                                                  if (FFAppState()
                                                          .searchResultList
                                                          .length
                                                          .toString()
                                                          .length >
                                                      2) {
                                                    await _model
                                                        .columnController
                                                        ?.animateTo(
                                                      _model
                                                          .columnController!
                                                          .position
                                                          .maxScrollExtent,
                                                      duration: Duration(
                                                          milliseconds: 100),
                                                      curve: Curves.ease,
                                                    );
                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      searchResultCardView
                                                          .length,
                                                  itemBuilder: (context,
                                                      searchResultCardViewIndex) {
                                                    final searchResultCardViewItem =
                                                        searchResultCardView[
                                                            searchResultCardViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 8, 8, 0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 350,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(7,
                                                                      7, 7, 7),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            7),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        searchResultCardViewItem,
                                                                        r'''$.parts[0].epik_def_info.name''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                14,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'SpoqaHanSansNeo',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          35,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .close_rounded,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState()
                                                                              .removeFromSearchResultList(searchResultCardViewItem);
                                                                          FFAppState()
                                                                              .removeFromSearchKeywordList(getJsonField(
                                                                            searchResultCardViewItem,
                                                                            r'''$.parts[*].part_number[0]''',
                                                                          ).toString());
                                                                          FFAppState()
                                                                              .sumPartsPrice = (int.parse(FFAppState().sumPartsPrice) -
                                                                                  int.parse(getJsonField(
                                                                                    searchResultCardViewItem,
                                                                                    r'''$.parts[*].vendor_def_info.price''',
                                                                                  ).toString()))
                                                                              .toString();
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              4,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.4,
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                CachedNetworkImage(
                                                                                  imageUrl: functions.getThumbnail(getJsonField(
                                                                                    searchResultCardViewItem,
                                                                                    r'''$.parts[0].epik_uid''',
                                                                                  ).toString())!,
                                                                                  width: double.infinity,
                                                                                  height: 275,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFB79D64),
                                                                                          borderRadius: BorderRadius.circular(10),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                          child: Text(
                                                                                            () {
                                                                                              if (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_def_info.type''',
                                                                                                  ) ==
                                                                                                  FFAppState().used) {
                                                                                                return '중고(재사용품)';
                                                                                              } else if (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_def_info.type''',
                                                                                                  ) ==
                                                                                                  FFAppState().qulityAsured) {
                                                                                                return '품질인증품';
                                                                                              } else if (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_def_info.type''',
                                                                                                  ) ==
                                                                                                  FFAppState().reManufact) {
                                                                                                return '제재조';
                                                                                              } else if (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_def_info.type''',
                                                                                                  ) ==
                                                                                                  FFAppState().am) {
                                                                                                return '애프터마켓';
                                                                                              } else if (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_def_info.type''',
                                                                                                  ) ==
                                                                                                  FFAppState().oem) {
                                                                                                return '제조사신품(OEM)';
                                                                                              } else if (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_def_info.type''',
                                                                                                  ) ==
                                                                                                  FFAppState().kapa) {
                                                                                                return 'KAPA인증품';
                                                                                              } else {
                                                                                                return '미상';
                                                                                              }
                                                                                            }(),
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'SpoqaHanSansNeo',
                                                                                                  color: Colors.white,
                                                                                                  fontSize: 12,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30,
                                                                                        borderWidth: 1,
                                                                                        buttonSize: 35,
                                                                                        fillColor: Colors.white,
                                                                                        icon: Icon(
                                                                                          Icons.zoom_in,
                                                                                          color: Colors.black,
                                                                                          size: 20,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Color(0x99D9D9D9),
                                                                                            isDismissible: false,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return Padding(
                                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                                child: MoreViewModalWidget(
                                                                                                  imgArrayLength: (getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].vendor_def_info.pic''',
                                                                                                  ) as List)
                                                                                                      .map<String>((s) => s.toString())
                                                                                                      .toList()!
                                                                                                      .length,
                                                                                                  imgUid: getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[0].epik_uid''',
                                                                                                  ).toString(),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => setState(() {}));
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              7),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                () {
                                                                                  if (getJsonField(
                                                                                        searchResultCardViewItem,
                                                                                        r'''$.parts[0].vendor_id''',
                                                                                      ) ==
                                                                                      FFAppState().atLabsAutoCodeNum) {
                                                                                    return FFAppState().atLabsAuto;
                                                                                  } else if (getJsonField(
                                                                                        searchResultCardViewItem,
                                                                                        r'''$.parts[0].vendor_id''',
                                                                                      ) ==
                                                                                      FFAppState().carFriendsCodeNum) {
                                                                                    return FFAppState().carFriends;
                                                                                  } else if (getJsonField(
                                                                                        searchResultCardViewItem,
                                                                                        r'''$.parts[0].vendor_id''',
                                                                                      ) ==
                                                                                      FFAppState().insunMotorsCodeNum) {
                                                                                    return FFAppState().insumMotors;
                                                                                  } else {
                                                                                    return '미상';
                                                                                  }
                                                                                }(),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Colors.black,
                                                                                      fontSize: 15,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                '추천부품가격',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions.regixNumberFormat(getJsonField(
                                                                                        searchResultCardViewItem,
                                                                                        r'''$.parts[0].epik_def_info.price''',
                                                                                      ).toString()),
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'SpoqaHanSansNeo',
                                                                                          color: Color(0xFFB79D64),
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '원',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'SpoqaHanSansNeo',
                                                                                          color: Color(0xFFB79D64),
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                '신품가격 ',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Color(0xFFA9A9A9),
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.regixNumberFormat(valueOrDefault<String>(
                                                                                    getJsonField(
                                                                                      searchResultCardViewItem,
                                                                                      r'''$.parts[0].oem_def_inf.price''',
                                                                                    ).toString(),
                                                                                    '1',
                                                                                  )),
                                                                                  '1',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Color(0xFFA9A9A9),
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                '원',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Color(0xFFA9A9A9),
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                '절감금액',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      functions.regixNumberFormat(valueOrDefault<String>(
                                                                                        (String newPartsPrice, String recommendPartsPrice) {
                                                                                          return int.parse(newPartsPrice) - int.parse(recommendPartsPrice) > 0 ? (int.parse(newPartsPrice) - int.parse(recommendPartsPrice)).toString() : "1";
                                                                                        }(
                                                                                            valueOrDefault<String>(
                                                                                              getJsonField(
                                                                                                searchResultCardViewItem,
                                                                                                r'''$.parts[0].oem_def_inf.price''',
                                                                                              ).toString(),
                                                                                              '0',
                                                                                            ),
                                                                                            getJsonField(
                                                                                              searchResultCardViewItem,
                                                                                              r'''$.parts[0].epik_def_info.price''',
                                                                                            ).toString()),
                                                                                        '1',
                                                                                      )),
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'SpoqaHanSansNeo',
                                                                                          color: Colors.black,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '원',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'SpoqaHanSansNeo',
                                                                                          color: Colors.black,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                '환급금',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    () {
                                                                                      if (getJsonField(
                                                                                            searchResultCardViewItem,
                                                                                            r'''$.parts[0].epik_def_info.type''',
                                                                                          ) ==
                                                                                          FFAppState().used) {
                                                                                        return ((int.parse(getJsonField(
                                                                                                  searchResultCardViewItem,
                                                                                                  r'''$.parts[0].oem_def_inf.price''',
                                                                                                ).toString()) *
                                                                                                0.25)
                                                                                            .toString());
                                                                                      } else if (getJsonField(
                                                                                            searchResultCardViewItem,
                                                                                            r'''$.parts[0].epik_def_info.type''',
                                                                                          ) ==
                                                                                          FFAppState().qulityAsured) {
                                                                                        return ((int.parse(getJsonField(
                                                                                                  searchResultCardViewItem,
                                                                                                  r'''$.parts[0].oem_def_inf.price''',
                                                                                                ).toString()) *
                                                                                                0.2)
                                                                                            .toString());
                                                                                      } else {
                                                                                        return '0';
                                                                                      }
                                                                                    }(),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'SpoqaHanSansNeo',
                                                                                          color: Colors.black,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '원',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'SpoqaHanSansNeo',
                                                                                          color: Colors.black,
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                '구매수량',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Colors.black,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                              FlutterFlowDropDown<String>(
                                                                                initialOption: _model.dropDownValueMap[searchResultCardViewItem] ??= '1',
                                                                                options: [
                                                                                  '1',
                                                                                  '2',
                                                                                  '3'
                                                                                ],
                                                                                onChanged: (val) => setState(() => _model.dropDownValueMap[searchResultCardViewItem] = val!),
                                                                                width: 65,
                                                                                height: 40,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                      color: Colors.black,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                                icon: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  color: Colors.black,
                                                                                  size: 15,
                                                                                ),
                                                                                fillColor: Colors.white,
                                                                                elevation: 2,
                                                                                borderColor: Color(0xFF98A2B3),
                                                                                borderWidth: 0,
                                                                                borderRadius: 4,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(10, 7, 10, 7),
                                                                                hidesUnderline: true,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Text(
                                                                                        '최적부품 목록',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'SpoqaHanSansNeo',
                                                                                              color: Colors.black,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 90,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                      borderRadius: BorderRadius.circular(4),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Builder(
                                                                                            builder: (context) {
                                                                                              final getRecommendPartsImage = functions
                                                                                                  .getRecommendPartsImageUrl((getJsonField(
                                                                                                    searchResultCardViewItem,
                                                                                                    r'''$.parts[:].epik_uid''',
                                                                                                  ) as List)
                                                                                                      .map<String>((s) => s.toString())
                                                                                                      .toList()!)
                                                                                                  .toList();
                                                                                              return ListView.builder(
                                                                                                padding: EdgeInsets.zero,
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                itemCount: getRecommendPartsImage.length,
                                                                                                itemBuilder: (context, getRecommendPartsImageIndex) {
                                                                                                  final getRecommendPartsImageItem = getRecommendPartsImage[getRecommendPartsImageIndex];
                                                                                                  return Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 5),
                                                                                                    child: Stack(
                                                                                                      children: [
                                                                                                        CachedNetworkImage(
                                                                                                          imageUrl: getRecommendPartsImageItem,
                                                                                                          width: 75,
                                                                                                          height: 150,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0xFFB79D64),
                                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                                              child: Text(
                                                                                                                () {
                                                                                                                  if (getJsonField(
                                                                                                                        searchResultCardViewItem,
                                                                                                                        r'''$.parts[0].epik_def_info.type''',
                                                                                                                      ) ==
                                                                                                                      FFAppState().used) {
                                                                                                                    return '중고(재사용품)';
                                                                                                                  } else if (getJsonField(
                                                                                                                        searchResultCardViewItem,
                                                                                                                        r'''$.parts[0].epik_def_info.type''',
                                                                                                                      ) ==
                                                                                                                      FFAppState().qulityAsured) {
                                                                                                                    return '품질인증품';
                                                                                                                  } else if (getJsonField(
                                                                                                                        searchResultCardViewItem,
                                                                                                                        r'''$.parts[0].epik_def_info.type''',
                                                                                                                      ) ==
                                                                                                                      FFAppState().reManufact) {
                                                                                                                    return '제재조';
                                                                                                                  } else if (getJsonField(
                                                                                                                        searchResultCardViewItem,
                                                                                                                        r'''$.parts[0].epik_def_info.type''',
                                                                                                                      ) ==
                                                                                                                      FFAppState().am) {
                                                                                                                    return '애프터마켓';
                                                                                                                  } else if (getJsonField(
                                                                                                                        searchResultCardViewItem,
                                                                                                                        r'''$.parts[0].epik_def_info.type''',
                                                                                                                      ) ==
                                                                                                                      FFAppState().oem) {
                                                                                                                    return '제조사신품(OEM)';
                                                                                                                  } else if (getJsonField(
                                                                                                                        searchResultCardViewItem,
                                                                                                                        r'''$.parts[0].epik_def_info.type''',
                                                                                                                      ) ==
                                                                                                                      FFAppState().kapa) {
                                                                                                                    return 'KAPA인증품';
                                                                                                                  } else {
                                                                                                                    return '미상';
                                                                                                                  }
                                                                                                                }(),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'SpoqaHanSansNeo',
                                                                                                                      color: Colors.white,
                                                                                                                      fontSize: 8,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                controller: _model.listViewController2,
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  controller: _model
                                                      .listViewController1,
                                                ),
                                              );
                                            },
                                          ),
                                          if (FFAppState().isLoading == true)
                                            wrapWithModel(
                                              model:
                                                  _model.loadingCardViewModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: LoadingCardViewWidget(),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Color(0x33000000),
                        offset: Offset(0, -2),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '장바구니 담기',
                            options: FFButtonOptions(
                              width: 170,
                              height: 45,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'SpoqaHanSansNeo',
                                    color: Color(0xFF2E5252),
                                    useGoogleFonts: false,
                                  ),
                              borderSide: BorderSide(
                                color: Color(0xFF2E5252),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '선택한 부품 구매',
                            options: FFButtonOptions(
                              width: 170,
                              height: 45,
                              color: Color(0xFF2E5252),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'SpoqaHanSansNeo',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
