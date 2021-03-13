import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:flutter/material.dart';

class BackCardWidget extends StatelessWidget {
  const BackCardWidget({Key key, @required this.card}) : super(key: key);

  final CreditCard card;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.defaultHeight * 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: card.colors[1],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: SizeConfig.defaultHeight * 5,
              color: card.colors[0],
            ),
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.defaultHeight * 2,
                right: SizeConfig.defaultWidth * 5,
              ),
              padding: EdgeInsets.only(right: SizeConfig.defaultWidth),
              height: SizeConfig.defaultHeight * 4,
              width: SizeConfig.defaultWidth * 20,
              color: Colors.white,
              alignment: Alignment.centerRight,
              child: Text(
                card.securityCode,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.defaultWidth * 5,
              ),
              child: Text(
                'Service Hotline / 028-6577',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
