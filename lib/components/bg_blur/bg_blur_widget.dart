import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'bg_blur_model.dart';
export 'bg_blur_model.dart';

class BgBlurWidget extends StatefulWidget {
  const BgBlurWidget({super.key});

  @override
  State<BgBlurWidget> createState() => _BgBlurWidgetState();
}

class _BgBlurWidgetState extends State<BgBlurWidget> {
  late BgBlurModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BgBlurModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: const AlignmentDirectional(0.0, 1.0),
        children: [
          Align(
            alignment: const AlignmentDirectional(-4.5, -1.4),
            child: Container(
              width: 500.0,
              height: 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-4.5, -1.4),
            child: Container(
              width: 350.0,
              height: 350.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(4.5, -0.95),
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 40.0,
                  sigmaY: 40.0,
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).overlay,
                    ),
                    alignment: const AlignmentDirectional(0.0, 1.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
