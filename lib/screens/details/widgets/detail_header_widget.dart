import 'package:credit_card_manager/size_config.dart';
import 'package:flutter/material.dart';

class DetailHeaderWidget extends StatelessWidget {
  const DetailHeaderWidget({
    Key key,
    @required this.sheetProgress,
  }) : super(key: key);

  final double sheetProgress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.scale(
        scale: 1 - (sheetProgress * 20),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              'Full Card',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: SizeConfig.defaultHeight * 1.5),
            Text(
              'Rotate card to view the security code',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
