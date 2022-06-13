import 'package:cartgreek/constants/localfiles.dart';
import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/widgets/common_card.dart';
import 'package:cartgreek/widgets/y_margin.dart';
import 'package:flutter/material.dart';

class NannyView extends StatelessWidget {
  const NannyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16, top: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CardView(
              borderColor: Colors.transparent,
              color: AppTheme.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nanny And\nBabysitting Services',
                      style: TextStyles(context).getTitleStyle().copyWith(
                            fontSize: 20,
                            color: AppTheme.secondaryColor,
                          ),
                    ),
                    const YMargin(size: 8),
                    CardView(
                      borderColor: Colors.transparent,
                      color: AppTheme.secondaryColor,
                      child: SizedBox(
                        height: 30,
                        width: 90,
                        child: Center(
                          child: Text('Book Now',
                              style: TextStyles(context)
                                  .getRegularStyle()
                                  .copyWith(color: AppTheme.whiteColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -28,
            bottom: -28,
            right: -16,
            child: Image.asset(
              Localfiles.bImage,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
