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

class SearchPartsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for inputSearchKeyword widget.
  TextEditingController? inputSearchKeywordController;
  String? Function(BuildContext, String?)?
      inputSearchKeywordControllerValidator;
  // Stores action output result for [Backend Call - API (getPartsSearchData)] action in buttonSearch widget.
  ApiCallResponse? searchResult;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for DropDown widget.
  Map<dynamic, String> dropDownValueMap = {};
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Model for loadingCardView component.
  late LoadingCardViewModel loadingCardViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    loadingCardViewModel = createModel(context, () => LoadingCardViewModel());
  }

  void dispose() {
    inputSearchKeywordController?.dispose();
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    loadingCardViewModel.dispose();
  }

  /// Additional helper methods are added here.

}
