import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plover/plover.dart';
import 'package:voice_ui/const/app_color.dart';
import 'package:voice_ui/const/app_text_stype.dart';

final double tabItemLength = 462.w;

class ResultTabs extends StatefulWidget {
  final List<String> tabTitles;
  const ResultTabs({
    super.key,
    this.tabTitles = const [
      "Live TV",
      "Youtube",
      "Netflix",
      "TV Show",
      "Movie",
    ],
  });

  @override
  State<ResultTabs> createState() => _ResultTabsState();
}

class _ResultTabsState extends State<ResultTabs> {
  final WTabController _wTabController = WTabController();
  int? prevIndex;
  late final int _itemCount;

  @override
  void initState() {
    super.initState();
    _itemCount = widget.tabTitles.length;
  }

  void _onFocusItemChange({
    required int index,
    required bool value,
  }) {
    if (prevIndex != index) {
      _wTabController.changeTab(index, index);
    }
    if (value) {
      _wTabController.changeTab(index, null);
      prevIndex = index;
    } else {
      _wTabController.exitTab(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: WFocusableScope(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 100.w,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18).r,
                // color: AppColors.normal.withOpacity(0.3),
                color: Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 12.h,
              ),
              width: _itemCount * tabItemLength + 15.w * 2,
              child: WTabs(
                direction: Axis.horizontal,
                wTabController: _wTabController,
                itemCount: _itemCount,
                onFocusItemChange: (value, isHovered, index) {
                  _onFocusItemChange(index: index, value: value);
                },
                itemBuilder: (index, isHover, isSelected) {
                  return TabItem(
                    hovered: isHover,
                    index: index,
                    selected: isSelected,
                    itemCount: _itemCount,
                    title: widget.tabTitles[index],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.index,
    required this.itemCount,
    required this.hovered,
    required this.selected,
    required this.title,
  });

  final int index;
  final int itemCount;
  final bool hovered;
  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tabItemLength,
      height: 90.h,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
      ),
      decoration: BoxDecoration(
        border: (index == itemCount - 1)
            ? null
            : Border(
                right: BorderSide(
                  color: AppColors.black,
                  width: 1.w,
                ),
              ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18).r,
          color: Colors.transparent,
        ),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: const BoxDecoration(
                  color: AppColors.normal,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              WMarquee(
                text: title,
                focused: selected,
                style: AppTextStype.font60Weight400.copyWith(
                  color: selected ? AppColors.normal : AppColors.secondaryColor,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
