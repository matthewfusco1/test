import '/backend/api_requests/api_calls.dart';
import '/components/bg_blur/bg_blur_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'creation_page_widget.dart' show CreationPageWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class CreationPageModel extends FlutterFlowModel<CreationPageWidget> {
  ///  Local state fields for this page.

  String? sketch;

  bool? darkMode;

  bool? animateMessage;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for bgBlur component.
  late BgBlurModel bgBlurModel;
  // State field(s) for Signature widget.
  SignatureController? signatureController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String uploadedSignatureUrl = '';
  // Stores action output result for [Backend Call - API (Create)] action in Button widget.
  ApiCallResponse? createPrediction;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Get)] action in Button widget.
  ApiCallResponse? getPrediction;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    bgBlurModel = createModel(context, () => BgBlurModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bgBlurModel.dispose();
    signatureController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
