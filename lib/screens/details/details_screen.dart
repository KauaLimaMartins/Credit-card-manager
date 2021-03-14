import 'package:credit_card_manager/constants.dart';
import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/models/transactions.dart';
import 'package:credit_card_manager/screens/details/widgets/transaction_summary_widget.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:credit_card_manager/widgets/card/back_card_widget.dart';
import 'package:credit_card_manager/widgets/card/front_card_widget.dart';
import 'package:credit_card_manager/widgets/flippable_widget.dart';
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
          _buildHeader(sheetProgress),
          Container(
            padding: EdgeInsets.fromLTRB(
              SizeConfig.defaultWidth * 2,
              0,
              SizeConfig.defaultWidth * 2,
              sheetProgress > 0.462
                  ? SizeConfig.defaultHeight * 55
                  : SizeConfig.defaultHeight * 20 + sheetProgress * 600,
            ),
            alignment: Alignment.center,
            child: Transform.scale(
              scale: sheetProgress > 0.462 ? 1 - (sheetProgress - 0.462) : 1,
              child: FlippableWidget(
                backCardWidget: BackCardWidget(card: widget.card),
                frontCardWidget: FrontCardWidget(card: widget.card),
              ),
            ),
          ),
          _buildBottomSheet(),
        ],
      ),
    );
  }

  Widget _buildHeader(double sheetProgress) {
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

  Widget _buildBottomSheet() {
    return Align(
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
    );
  }
}
