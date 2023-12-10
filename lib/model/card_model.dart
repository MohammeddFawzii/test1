import 'package:flutter/material.dart';

class CardModel {
  final String cardImge;
  final Color strokColor;
  final String userImge;
  final String rating;
  final String userName;
  final Color? ratingColor;


  CardModel({

    required this.cardImge,
    required this.rating,
    required this.strokColor,
    required this.userImge,
    required this.userName,
    @required this.ratingColor,

  });
}
