import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:credit_card_manager/widgets/card/back_card_widget.dart';
import 'package:credit_card_manager/widgets/card/front_card_widget.dart';
import 'package:credit_card_manager/widgets/flippable_widget.dart';
import 'package:flutter/material.dart';

class DetailCardWidget extends StatefulWidget {
  const DetailCardWidget({
    Key key,
    @required this.sheetProgress,
    @required this.card,
  }) : super(key: key);

  final double sheetProgress;
  final CreditCard card;

  @override
  _DetailCardWidgetState createState() => _DetailCardWidgetState();
}

class _DetailCardWidgetState extends State<DetailCardWidget> {
  bool animateCardNumber = true;

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 1000),
      () => setState(() => animateCardNumber = false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.defaultWidth * 2,
        0,
        SizeConfig.defaultWidth * 2,
        widget.sheetProgress > 0.462
            ? SizeConfig.defaultHeight * 55
            : SizeConfig.defaultHeight * 20 + widget.sheetProgress * 600,
      ),
      alignment: Alignment.center,
      child: Transform.scale(
        scale: widget.sheetProgress > 0.462
            ? 1 - (widget.sheetProgress - 0.462)
            : 1,
        child: FlippableWidget(
          backCardWidget: BackCardWidget(card: widget.card),
          frontCardWidget: FrontCardWidget(
            card: widget.card,
            showCardNumber: true,
            animateCardNumber: animateCardNumber,
          ),
        ),
      ),
    );
  }
}
