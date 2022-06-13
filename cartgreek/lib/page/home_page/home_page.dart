import 'dart:ui';

import 'package:cartgreek/constants/localfiles.dart';
import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/core/controller/data_controller.dart';
import 'package:cartgreek/page/home_page/components/current_booking_ui/current_booking_view.dart';
import 'package:cartgreek/page/home_page/components/nanny_view.dart';
import 'package:cartgreek/page/home_page/components/pakages_ui/pakages_page.dart';
import 'package:cartgreek/widgets/common_card.dart';
import 'package:cartgreek/widgets/y_margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onTap;
  const HomePage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  void _getData() {
    Get.find<DataController>().onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (dataController) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YMargin(
            size: MediaQuery.of(context).padding.top + 8,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4.0),
                      onTap: widget.onTap,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Localfiles.menu,
                          height: 28,
                          width: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 0, bottom: 8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(Localfiles.userImage),
                        radius: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'welcome',
                              style: TextStyles(context).getRegularStyle(),
                            ),
                            Text(
                              'Emily Crus',
                              style: TextStyles(context)
                                  .getBoldStyle()
                                  .copyWith(
                                      fontSize: 18,
                                      color: AppTheme.primaryColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const YMargin(size: 8),
                const NannyView(),
                const YMargin(size: 8),
                CurrentBookingView(
                  dataController: dataController,
                ),
                PakagedPage(
                  dataController: dataController,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
