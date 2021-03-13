import 'package:credit_card_manager/models/transactions.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:flutter/material.dart';

class TransactionSummaryWidget extends StatelessWidget {
  const TransactionSummaryWidget({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: SizeConfig.defaultWidth * 6,
            height: SizeConfig.defaultWidth * 6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 1],
                colors: [
                  transaction.color[400],
                  transaction.color[700],
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              transaction.icon,
              color: Colors.white,
              size: SizeConfig.defaultHeight * 3,
            ),
          ),
          title: Text(
            transaction.title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            transaction.category,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.white70),
          ),
          trailing: Text(
            transaction.value.toStringAsFixed(2),
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            SizeConfig.defaultWidth * 10,
            SizeConfig.defaultHeight,
            0,
            SizeConfig.defaultHeight,
          ),
          child: Divider(
            color: Colors.grey[700],
            height: 1,
          ),
        ),
      ],
    );
  }
}
