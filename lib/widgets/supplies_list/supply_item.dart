import 'package:tedarik/models/supply_data.dart';
import 'package:flutter/material.dart';

class SupplyItem extends StatelessWidget {
  const SupplyItem(this.supply, {super.key});

  final SuppliesData supply;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              supply.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  '\$${supply.amount.toStringAsFixed(2)}',
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[supply.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(supply.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
