import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_images.dart';
import 'package:voice_ui/const/app_text_stype.dart';

class MoviesCarousel extends StatefulWidget {
  const MoviesCarousel({super.key});

  @override
  State<MoviesCarousel> createState() => _MoviesCarousel();
}

class _MoviesCarousel extends State<MoviesCarousel> {
  @override
  Widget build(BuildContext context) {
    return FocusScrollConfig(
      alignFocusedElement: AlignFocusedElement.start,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 500.h,
            child: WAnimatedCarousel(
              childMargin: 36.w,
              initialOfFocused: 2,
              padding: EdgeInsets.symmetric(
                horizontal: 72.w,
              ),
              onFocusedItemAnimationChange: (int index,
                  AnimationStatus animStatus, Size size, Offset offset) {},
              onLongPress: (int index, KeyEvent? keyEvent) {
                // debugPrint('On long press at $index $keyEvent');
              },
              onTap: (int index) {
                // debugPrint('On tap at $index');
              },
              itemBuilder:
                  (BuildContext childContext, int index, bool isFocus) {
                return ItemAnimation(
                  isFocus,
                  index,
                );
              },
              itemKey: (int index) {
                return index.toString();
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemAnimation extends StatefulWidget {
  const ItemAnimation(this.isFocus, this.index, {super.key});

  final bool isFocus;
  final int index;

  @override
  State<ItemAnimation> createState() => _ItemAnimationState();
}

class _ItemAnimationState extends State<ItemAnimation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 500.h,
      child: Stack(
        children: [
          Image.asset(
            widget.index.isEven
                ? AppImages.venom
                : AppImages.antman,
                fit: BoxFit.fitWidth,
            width: 360.w,
          ),

          widget.isFocus
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  width: double.infinity,
                  height: double.infinity,
                )
              : const SizedBox.shrink(),
          Positioned(
            bottom: 54.h,
            right: 6.w,
            left: 6.w,
            child: Column(
              children: [
                WMarquee(
                  text: "text text text text text text",
                  style: AppTextStype.font60Weight400,
                  focused: widget.isFocus,
                ),
                // Button(
                //   customSize: Size(216.w, 66.h),
                //   onPressed: () {},
                //   boxDecoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(40.r)),
                //     gradient: const LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [
                //         Color(0xFF8D35DD),
                //         Color(0xFF345BD5),
                //       ],
                //       stops: [0.0, 1.0],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
