import 'dart:math';

import 'package:credit_card_manager/models/credit_card.dart';
import 'package:credit_card_manager/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FrontCardWidget extends StatelessWidget {
  const FrontCardWidget({
    Key key,
    @required this.card,
    this.showCardNumber = false,
    this.animateCardNumber = true,
  }) : super(key: key);

  final CreditCard card;
  final bool showCardNumber;
  final bool animateCardNumber;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultWidth * 2,
          vertical: SizeConfig.defaultHeight * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              card.colors[0],
              card.colors[1],
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Credit Card',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      Icons.wifi,
                      size: SizeConfig.defaultHeight * 4,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Transform.translate(
                    offset: Offset(-SizeConfig.defaultWidth, 0),
                    child: Image.asset(
                      'assets/images/chip.png',
                      height: 120,
                      width: 80,
                    ),
                  ),
                  Spacer(),
                  if (showCardNumber)
                    PlayAnimation(
                      tween: IntTween(begin: 0, end: card.number.length),
                      delay: Duration(
                        milliseconds: 200,
                      ),
                      duration: Duration(
                        milliseconds: 600,
                      ),
                      builder: (context, child, value) {
                        return Text(
                          animateCardNumber
                              ? card.number.substring(0, value)
                              : card.number,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        );
                      },
                    )
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'CARD HOLDER',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white70),
                      ),
                      Text(
                        card.cardHolder,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    card.brand == CardBrand.visa
                        ? 'assets/images/visa.png'
                        : 'assets/images/mastercard.png',
                    height: SizeConfig.defaultHeight * 3,
                    color: card.brand == CardBrand.visa ? Colors.white70 : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
