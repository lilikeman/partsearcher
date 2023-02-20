import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_view_modal_model.dart';
export 'more_view_modal_model.dart';

class MoreViewModalWidget extends StatefulWidget {
  const MoreViewModalWidget({
    Key? key,
    this.imgArrayLength,
    this.imgUid,
  }) : super(key: key);

  final int? imgArrayLength;
  final String? imgUid;

  @override
  _MoreViewModalWidgetState createState() => _MoreViewModalWidgetState();
}

class _MoreViewModalWidgetState extends State<MoreViewModalWidget> {
  late MoreViewModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreViewModalModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 45,
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                    FFAppState().update(() {
                      FFAppState().imgSrc = '';
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                  child: Text(
                    '더보기',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'SpoqaHanSansNeo',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl: FFAppState().imgSrc == ''
                    ? 'https://storage.googleapis.com/h-startup_pub_picture/pictures/${widget.imgUid}/1.png'
                    : FFAppState().imgSrc,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '좌우로 드래그, 선택하여 크게 볼 수 있습니다.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'SpoqaHanSansNeo',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: false,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color(0xFFE1E1E1),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(7, 7, 0, 7),
                      child: Builder(
                        builder: (context) {
                          final imageDataArray = functions
                              .getImageArray(
                                  widget.imgUid!, widget.imgArrayLength!)
                              .map((e) => e)
                              .toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: imageDataArray.length,
                            itemBuilder: (context, imageDataArrayIndex) {
                              final imageDataArrayItem =
                                  imageDataArray[imageDataArrayIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                                child: InkWell(
                                  onTap: () async {
                                    FFAppState().update(() {
                                      FFAppState().imgSrc = imageDataArrayItem;
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: CachedNetworkImage(
                                      imageUrl: imageDataArrayItem,
                                      width: 100,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
