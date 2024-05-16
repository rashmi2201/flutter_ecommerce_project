import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeswidgets extends StatelessWidget {
  const TCurvedEdgeswidgets({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
