import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';

class TPrimarHeaderContainer extends StatelessWidget {
  const TPrimarHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeswidgets(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
