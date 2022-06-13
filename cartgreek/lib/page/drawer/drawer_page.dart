import 'package:cartgreek/constants/localfiles.dart';
import 'package:cartgreek/constants/text_styles.dart';
import 'package:cartgreek/constants/themes.dart';
import 'package:cartgreek/widgets/y_margin.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final VoidCallback onTap;
  const DrawerPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  List<String> listb = [
    'Home',
    'Book a Nanney',
    "How it's work",
    'Why Nanney Nanney',
    'My Booking',
    'My Profile',
    'Support'
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YMargin(size: MediaQuery.of(context).padding.top + 48),
              Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(Localfiles.userImage),
                    radius: 32,
                  ),
                  const YMargin(size: 8),
                  Text(
                    'Emily Crus',
                    style: TextStyles(context)
                        .getBoldStyle()
                        .copyWith(fontSize: 18, color: AppTheme.primaryColor),
                  ),
                ],
              ),
              const YMargin(size: 8),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: listb.length,
                  itemBuilder: (context, index) {
                    final data = listb[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 16.0),
                          child: Text(
                            data,
                            style:
                                TextStyles(context).getRegularStyle().copyWith(
                                      color: AppTheme.secondaryColor,
                                    ),
                          ),
                        ),
                        if (index != 6)
                          SizedBox(
                            width: 140,
                            child: Divider(
                              height: 1,
                              color: AppTheme.primaryTextColor.withOpacity(0.2),
                            ),
                          )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
