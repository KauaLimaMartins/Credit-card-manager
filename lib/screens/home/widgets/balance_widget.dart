import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({
    Key key,
    @required int previousIndex,
    @required int currentIndex,
  })  : _previousIndex = previousIndex,
        _currentIndex = currentIndex,
        super(key: key);

  final int _previousIndex;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.defaultWidth * 2,
        vertical: SizeConfig.defaultHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Balance',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.white70),
          ),
          SizedBox(height: SizeConfig.defaultHeight),
          Row(
            children: [
              Text(
                '\$',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              McCountingText(
                begin: cards[_previousIndex].amount,
                end: cards[_currentIndex].amount,
                precision: 2,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
