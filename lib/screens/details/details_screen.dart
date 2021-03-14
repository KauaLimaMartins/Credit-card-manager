import 'package:credit_card_manager/constants.dart';
import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/models/transactions.dart';
import 'package:credit_card_manager/screens/details/widgets/detail_card_widget.dart';
import 'package:credit_card_manager/screens/details/widgets/detail_header_widget.dart';
import 'package:credit_card_manager/screens/details/widgets/transaction_summary_widget.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, @required this.card}) : super(key: key);

  final CreditCard card;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double sheetProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: SizeConfig.defaultHeight * 4,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.defaultWidth * 2),
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: SizeConfig.defaultHeight * 4,
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PlayAnimation(
            tween: Tween(begin: SizeConfig.defaultHeight * 20, end: 0.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            builder: (context, child, value) {
              return Transform.translate(
                offset: Offset(0, value),
                child: child,
              );
            },
            child: DetailHeaderWidget(
              sheetProgress: sheetProgress,
            ),
          ),
          PlayAnimation(
            tween: Tween(begin: 0.2, end: 1.0),
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 500),
            builder: (context, child, value) {
              return Transform.scale(
                scale: value,
                alignment: Alignment.center,
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: DetailCardWidget(
              sheetProgress: sheetProgress,
              card: widget.card,
            ),
          ),
          _buildBottomSheet(),
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return PlayAnimation(
      tween: Tween(begin: SizeConfig.defaultHeight * 30, end: 0.0),
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 500),
      builder: (context, child, value) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SlidingSheet(
          color: sheetColor,
          cornerRadius: SizeConfig.defaultWidth * 2.5,
          snapSpec: SnapSpec(
            snap: true,
            snappings: [0.3, 0.6, 1],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          listener: (state) {
            setState(() {
              sheetProgress = ((state.extent - 0.3) / 0.65);
            });
          },
          headerBuilder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultWidth * 2,
                vertical: SizeConfig.defaultHeight * 2,
              ),
              alignment: Alignment.centerLeft,
              height: SizeConfig.defaultHeight * 7,
              width: double.infinity,
              color: sheetColor,
              child: Text(
                'Today',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          },
          builder: (context, state) {
            return Container(
              color: sheetColor,
              child: ListView.builder(
                itemCount: transactions.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionSummaryWidget(
                    transaction: transactions[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
