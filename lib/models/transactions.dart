import 'package:flutter/material.dart';

class Transaction {
  String title, category;
  IconData icon;
  MaterialColor color;
  double value;

  Transaction({
    @required this.title,
    @required this.category,
    @required this.icon,
    @required this.color,
    @required this.value,
  });
}

List<Transaction> transactions = [
  Transaction(
    title: 'Transfer into',
    category: 'Envya',
    icon: Icons.send,
    color: Colors.pink,
    value: 2000,
  ),
  Transaction(
    title: 'Nike',
    category: 'Shoes',
    icon: Icons.shopping_basket,
    color: Colors.amber,
    value: -145.50,
  ),
  Transaction(
    title: 'Apple music',
    category: 'Entertainment',
    icon: Icons.music_note,
    color: Colors.deepPurple,
    value: -15.5,
  ),
  Transaction(
    title: 'Fast food',
    category: 'Food',
    icon: Icons.fastfood,
    color: Colors.indigo,
    value: -6,
  ),
  Transaction(
    title: 'Transfer into',
    category: 'Envya',
    icon: Icons.send,
    color: Colors.pink,
    value: 2000,
  ),
  Transaction(
    title: 'Nike',
    category: 'Shoes',
    icon: Icons.shopping_basket,
    color: Colors.amber,
    value: -145.50,
  ),
  Transaction(
    title: 'Apple music',
    category: 'Entertainment',
    icon: Icons.music_note,
    color: Colors.deepPurple,
    value: -15.5,
  ),
  Transaction(
    title: 'Fast food',
    category: 'Food',
    icon: Icons.fastfood,
    color: Colors.indigo,
    value: -6,
  ),
];
