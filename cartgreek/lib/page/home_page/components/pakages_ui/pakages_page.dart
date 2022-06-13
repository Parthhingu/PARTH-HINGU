import 'package:cartgreek/constants/localfiles.dart';
import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/core/controller/data_controller.dart';
import 'package:cartgreek/page/home_page/components/pakages_ui/pakages_list_cell.dart';
import 'package:cartgreek/widgets/custom_circluar_view.dart';
import 'package:cartgreek/widgets/y_margin.dart';
import 'package:flutter/material.dart';

class PakagedPage extends StatefulWidget {
  final DataController dataController;
  const PakagedPage({Key? key, required this.dataController}) : super(key: key);

  @override
  State<PakagedPage> createState() => _PakagedPageState();
}

class _PakagedPageState extends State<PakagedPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16.0),
          child: Text(
            'Pakages',
            style: TextStyles(context).getBoldStyle().copyWith(
                  fontSize: 18,
                  color: AppTheme.secondaryColor,
                ),
          ),
        ),
        const YMargin(size: 8),
        widget.dataController.isFecthing
            ? const Center(child: CustomCircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: widget.dataController.pakagesDataList.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final pakages = widget.dataController.pakagesDataList[index];
                  return PakagesCellView(
                    pakagesData: pakages,
                    image:
                        index % 2 == 0 ? Localfiles.cImage : Localfiles.ccImage,
                    cardColor: index % 2 == 0
                        ? AppTheme.primaryColor.withOpacity(0.5)
                        : const Color(0xFF80ABDB),
                    textColors: index == 3
                        ? AppTheme.whiteColor
                        : AppTheme.primaryTextColor,
                    bookNowColor: index % 2 == 0
                        ? AppTheme.primaryColor
                        : const Color(0xFF0098D0),
                  );
                },
              ),
        // _getCommonUI(Localfiles.cImage, 'One Day Package', '2799',
        //     AppTheme.primaryColor),
        // _getCommonUI(Localfiles.ccImage, 'Three Day Package', '7499',
        //     const Color(0xFF80ABDB)),
        // _getCommonUI(Localfiles.cImage, 'Four Day Package', '11495',
        //     AppTheme.primaryColor),
        // _getCommonUI(Localfiles.ccImage, 'Five Day Package', '7499',
        //     const Color(0xFF80ABDB)),
      ],
    );
  }

//   Widget _getCommonUI(
//       String imageName, String title, String price, Color color) {
//     return
//     );
}
// }
