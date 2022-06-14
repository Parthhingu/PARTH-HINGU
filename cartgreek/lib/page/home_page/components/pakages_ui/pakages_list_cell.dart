import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/model/pakages/pakages_data.dart';
import 'package:cartgreek/widgets/common_card.dart';
import 'package:flutter/material.dart';

class PakagesCellView extends StatelessWidget {
  final PakagesData pakagesData;
  final String image;
  final Color cardColor;
  final Color textColors, bookNowColor;
  const PakagesCellView(
      {Key? key,
      required this.pakagesData,
      required this.image,
      required this.cardColor,
      required this.textColors,
      required this.bookNowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8),
      child: CardView(
        radius: 8,
        color: cardColor,
        borderColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    image,
                    height: 38,
                    width: 38,
                  ),
                  CardView(
                    borderColor: Colors.transparent,
                    color: bookNowColor,
                    child: SizedBox(
                      height: 30,
                      width: 90,
                      child: Center(
                        child: Text('Book Now',
                            style: TextStyles(context)
                                .getDescriptionStyle()
                                .copyWith(
                                    color: AppTheme.whiteColor, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pakagesData.packageName ?? "",
                      style: TextStyles(context).getRegularStyle().copyWith(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '₹ ${pakagesData.price ?? ""}',
                      style: TextStyles(context).getRegularStyle().copyWith(
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              Text(
                pakagesData.description ?? "",
                style: TextStyles(context)
                    .getDescriptionStyle()
                    .copyWith(color: textColors),
              )
            ],
          ),
        ),
      ),
    );
  }
}
