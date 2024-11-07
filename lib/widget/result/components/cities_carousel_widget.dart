import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/const/app_text_stype.dart';

class CitiesCarousel extends StatefulWidget {
  const CitiesCarousel({super.key});

  @override
  State<CitiesCarousel> createState() => _CitiesCarousel();
}

class _CitiesCarousel extends State<CitiesCarousel> {
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
      width: 960.w,
      height: 500.h,
      child: Stack(
        children: [
          Container(
            color: widget.isFocus ? AppColors.normal : AppColors.carouselInactive,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WMarquee(
                  text: "London",
                  style: AppTextStype.font76Weight600.copyWith(
                    color: widget.isFocus
                        ? AppColors.textSelected
                        : AppColors.normal,
                  ),
                  focused: widget.isFocus,
                ),
                WMarquee(
                  text: "USA",
                  style: AppTextStype.font54Weight600.copyWith(
                    color: widget.isFocus
                        ? AppColors.textSelected.withOpacity(0.7)
                        : AppColors.normal.withOpacity(0.7),
                  ),
                  focused: widget.isFocus,
                ),
              ],
            ),
          ),
          // widget.isFocus
          //     ? Container(
          //         color: Colors.black.withOpacity(0.5),
          //         width: double.infinity,
          //         height: double.infinity,
          //       )
          //     : const SizedBox.shrink(),
          // Positioned(
          //   bottom: 54.h,
          //   right: 6.w,
          //   left: 6.w,
          //   child: Column(
          //     children: [
          //       WMarquee(
          //         text: "London",
          //         style: AppTextStype.font60Weight400.copyWith(
          //           color: AppColors.normal,
          //         ),
          //         focused: widget.isFocus,
          //       ),
          //       WMarquee(
          //         text: "USA",
          //         style: AppTextStype.font60Weight400,
          //         focused: widget.isFocus,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
