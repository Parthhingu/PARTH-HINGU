import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/core/controller/data_controller.dart';
import 'package:cartgreek/widgets/common_card.dart';
import 'package:cartgreek/widgets/custom_circluar_view.dart';
import 'package:cartgreek/widgets/x_margin.dart';
import 'package:cartgreek/widgets/y_margin.dart';
import 'package:flutter/material.dart';

class CurrentBookingView extends StatefulWidget {
  final DataController dataController;
  const CurrentBookingView({Key? key, required this.dataController})
      : super(key: key);

  @override
  State<CurrentBookingView> createState() => _CurrentBookingViewState();
}

class _CurrentBookingViewState extends State<CurrentBookingView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16.0),
          child: Text(
            'Current Booking',
            style: TextStyles(context).getBoldStyle().copyWith(
                  fontSize: 18,
                  color: AppTheme.secondaryColor,
                ),
          ),
        ),
        widget.dataController.isFecthing
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    YMargin(size: 48),
                    CustomCircularProgressIndicator(),
                    YMargin(size: 48),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16.0, top: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryTextColor.withOpacity(0.1),
                        blurRadius: 2,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.dataController.currentBookingData
                                      .packageLabel ??
                                  "",
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(color: AppTheme.primaryColor),
                            ),
                            CardView(
                              borderColor: Colors.transparent,
                              color: AppTheme.primaryColor,
                              child: SizedBox(
                                height: 22,
                                width: 68,
                                child: Center(
                                  child: Text('Start',
                                      style: TextStyles(context)
                                          .getDescriptionStyle()
                                          .copyWith(
                                              color: AppTheme.whiteColor)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From',
                                    style: TextStyles(context)
                                        .getDescriptionStyle()
                                        .copyWith(fontSize: 14),
                                  ),
                                  const YMargin(size: 4),
                                  _getCalendareUI(
                                    Icons.calendar_month_outlined,
                                    widget.dataController.currentBookingData
                                            .fromDate ??
                                        "",
                                  ),
                                  const YMargin(size: 4),
                                  _getCalendareUI(
                                    Icons.schedule_outlined,
                                    widget.dataController.currentBookingData
                                            .fromTime ??
                                        "",
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: TextStyles(context)
                                        .getDescriptionStyle()
                                        .copyWith(fontSize: 14),
                                  ),
                                  const YMargin(size: 4),
                                  _getCalendareUI(
                                    Icons.calendar_month_outlined,
                                    widget.dataController.currentBookingData
                                            .toDate ??
                                        "",
                                  ),
                                  const YMargin(size: 4),
                                  _getCalendareUI(
                                    Icons.schedule_outlined,
                                    widget.dataController.currentBookingData
                                            .toTime ??
                                        "",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const YMargin(size: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _getBookingCommonUI(
                                    Icons.star_border, 'Rate Us'),
                                const XMargin(size: 8),
                                _getBookingCommonUI(
                                    Icons.location_on_outlined, 'Geolocation'),
                                const XMargin(size: 8),
                                _getBookingCommonUI(
                                    Icons.speaker_group_outlined,
                                    'Survillence'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
      ],
    );
  }

  Widget _getBookingCommonUI(IconData icon, String title) {
    return CardView(
      borderColor: Colors.transparent,
      color: AppTheme.secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AppTheme.whiteColor,
              size: 18,
            ),
            const XMargin(size: 4),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Text(
                title,
                style: TextStyles(context).getRegularStyle().copyWith(
                      color: AppTheme.whiteColor,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getCalendareUI(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppTheme.primaryColor,
          size: 18,
        ),
        const XMargin(size: 4),
        Text(
          title,
          style: TextStyles(context).getRegularStyle(),
        )
      ],
    );
  }
}
