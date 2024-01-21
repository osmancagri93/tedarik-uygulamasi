import 'package:tedarik/models/supply_data.dart';
import 'package:tedarik/widgets/supplies_list/supply_item.dart';

import 'package:flutter/material.dart';

class SuppliesList extends StatelessWidget {
  const SuppliesList(
      {super.key, required this.supplies, required this.onRemoveSupply});

  final List<SuppliesData> supplies;
  final void Function(SuppliesData supply) onRemoveSupply;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: supplies.length,
      itemBuilder: (BuildContext context, int index) => Dismissible(
        background: Container(
          color: Colors.red,
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) {
          onRemoveSupply(supplies[index]);
        }, // listeyi sola kaydırıp silmeyi sağlar
        key: ValueKey(supplies[index]),
        child: SupplyItem(supplies[index]),
      ),
    );
  }
}
