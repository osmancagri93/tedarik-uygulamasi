import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // tarihi formatlamak için paket

const uuid = Uuid(); // özel bir id oluşturan paket fonksiyonu kullandık

final formatter = DateFormat().add_yMd();

enum Category {
  food,
  travel,
  personal,
  work
} // sadece belirli stringleri kabul etmesi için kullandık

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.personal: Icons.movie,
  Category.work: Icons.work,
};

class SuppliesData {
  SuppliesData(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.supplies});

  ExpenseBucket.forCategory(List<SuppliesData> allSupplies, this.category)
      : supplies = // Custom construction function
            allSupplies.where((supply) => supply.category == category).toList();

  final Category category;
  final List<SuppliesData> supplies;

  double get totalSupplies {
    double sum = 0;

    for (final i in supplies) {
      sum += i.amount;
    }

    return sum;
  }
}


//Bu sayfa tek bir expense kartı için gereken tüm özellikleri tanımlayarak bir blueprint oluşturur ve tekrar tekrar kullanmamızı sağlar
//(models/expense_data.dart)
