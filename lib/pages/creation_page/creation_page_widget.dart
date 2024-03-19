import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bg_blur/bg_blur_widget.dart';
import '/components/image_results/image_results_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:signature/signature.dart';
import 'creation_page_model.dart';
export 'creation_page_model.dart';

class CreationPageWidget extends StatefulWidget {
  const CreationPageWidget({super.key});

  @override
  State<CreationPageWidget> createState() => _CreationPageWidgetState();
}

class _CreationPageWidgetState extends State<CreationPageWidget>
    with TickerProviderStateMixin {
  late CreationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.darkMode = true;
        _model.animateMessage = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.bgBlurModel,
                updateCallback: () => setState(() {}),
                child: const BgBlurWidget(),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32.0, 48.0, 32.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create with AI',
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                        ToggleIcon(
                          onPressed: () async {
                            setState(() => _model.darkMode = !_model.darkMode!);
                            if (_model.darkMode == true) {
                              setDarkModeSetting(context, ThemeMode.light);
                            } else {
                              setDarkModeSetting(context, ThemeMode.dark);
                            }
                          },
                          value: _model.darkMode!,
                          onIcon: Icon(
                            Icons.nightlight_round,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                          offIcon: Icon(
                            Icons.wb_sunny_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 12.0, 32.0, 12.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                width: double.infinity,
                                height: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                  ),
                                ),
                                child: Stack(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  children: [
                                    ClipRect(
                                      child: Signature(
                                        controller:
                                            _model.signatureController ??=
                                                SignatureController(
                                          penStrokeWidth: 3.0,
                                          penColor: Colors.black,
                                          exportBackgroundColor: Colors.white,
                                        ),
                                        backgroundColor: Colors.white,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 12.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 8.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: const Color(0xFFF49F77),
                                        icon: Icon(
                                          Icons.delete_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            _model.signatureController?.clear();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Describe your drawing...',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  lineHeight: 1.3,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsets.all(16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            lineHeight: 1.3,
                          ),
                      maxLines: 5,
                      minLines: 1,
                      keyboardType: TextInputType.multiline,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        var shouldSetState = false;
                        final signatureImage =
                            await _model.signatureController!.toPngBytes();
                        if (signatureImage == null) {
                          showUploadMessage(
                            context,
                            'Signature is empty.',
                          );
                          return;
                        }
                        showUploadMessage(
                          context,
                          'Uploading signature...',
                          showLoading: true,
                        );
                        final downloadUrl = (await uploadData(
                            getSignatureStoragePath(), signatureImage));

                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        if (downloadUrl != null) {
                          setState(
                              () => _model.uploadedSignatureUrl = downloadUrl);
                          showUploadMessage(
                            context,
                            'Success!',
                          );
                        } else {
                          showUploadMessage(
                            context,
                            'Failed to upload signature.',
                          );
                          return;
                        }

                        _model.createPrediction =
                            await ReplicateAPIsGroup.createCall.call(
                          prompt: _model.textController.text,
                          image: _model.uploadedSignatureUrl,
                        );
                        shouldSetState = true;
                        if ((_model.createPrediction?.succeeded ?? true)) {
                          _model.instantTimer = InstantTimer.periodic(
                            duration: const Duration(milliseconds: 2000),
                            callback: (timer) async {
                              _model.getPrediction =
                                  await ReplicateAPIsGroup.getCall.call(
                                id: ReplicateAPIsGroup.createCall.id(
                                  (_model.createPrediction?.jsonBody ?? ''),
                                ),
                              );
                              shouldSetState = true;
                              if ((_model.getPrediction?.succeeded ?? true)) {
                                if ((String status) {
                                  return status == "succeeded";
                                }(ReplicateAPIsGroup.getCall
                                    .status(
                                      (_model.getPrediction?.jsonBody ?? ''),
                                    )!
                                    .toString())) {
                                  await SketchesRecord.createDoc(
                                          currentUserReference!)
                                      .set(createSketchesRecordData(
                                    sketch: _model.uploadedSignatureUrl,
                                    timeCreated: getCurrentTimestamp,
                                    replicatePrompt: _model.textController.text,
                                    replicateOutput: ReplicateAPIsGroup.getCall
                                        .outputImageURLs(
                                          (_model.getPrediction?.jsonBody ??
                                              ''),
                                        )
                                        ?.first,
                                  ));
                                  setState(() {
                                    _model.animateMessage = true;
                                  });
                                  setState(() {
                                    _model.textController?.clear();
                                  });
                                  setState(() {
                                    _model.signatureController?.clear();
                                  });
                                  _model.instantTimer?.cancel();
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    barrierColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ImageResultsWidget(
                                            outputImage:
                                                ReplicateAPIsGroup.getCall
                                                    .outputImageURLs(
                                                      (_model.getPrediction
                                                              ?.jsonBody ??
                                                          ''),
                                                    )
                                                    ?.last,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  if (shouldSetState) setState(() {});
                                  return;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Get Prediction failed.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor: const Color(0x00000000),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Get Prediction failed.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor: const Color(0x00000000),
                                  ),
                                );
                              }
                            },
                            startImmediately: false,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Create Prediction Failed',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0x00000000),
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: const Color(0x00000000),
                            ),
                          );
                        }

                        if (shouldSetState) setState(() {});
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  if (_model.animateMessage == true)
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Your image is generating...',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
