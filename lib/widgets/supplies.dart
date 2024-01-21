import 'package:flutter/material.dart';
import 'package:tedarik/models/supply_data.dart';
import 'package:tedarik/widgets/new_supply.dart';
import 'package:tedarik/widgets/chart/chart.dart';
import 'package:tedarik/widgets/supplies_list/supply_list.dart';

class Supplies extends StatefulWidget {
  const Supplies({super.key});

  @override
  State<Supplies> createState() => _SuppliesState();
}

class _SuppliesState extends State<Supplies> {
  final List<SuppliesData> _reqisteredSupplies = [
    SuppliesData(
        title: 'Nova Danismanlik Firmasi Muhuru',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.personal),
    SuppliesData(
      title: 'Aras Havayollari Metal Dedektor',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.travel,
    ),
    SuppliesData(
      title: 'Taylan Nakliyat Buyuk Boy Esya Kutusu',
      amount: 26.49,
      date: DateTime.now(),
      category: Category.work,
    ),
    SuppliesData(
      title: 'Burger Dunyasi Masa',
      amount: 30.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    SuppliesData(
      title: 'Osman Insaat Beton',
      amount: 51.39,
      date: DateTime.now(),
      category: Category.work,
    ),
    SuppliesData(
      title: 'Zakir Giyim Kislik Mont',
      amount: 25.00,
      date: DateTime.now(),
      category: Category.personal,
    )
  ];

  void _openAddSupplyOverlay() {
    // tuşa basıldığıda bir geçici sekme açmak için kullanılır
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewSupply(
          onAddSupply: _addSupply), // başka sayfadan fonksiyon çağırdık
    );
  }

  void _addSupply(SuppliesData supply) {
    setState(() {
      _reqisteredSupplies.add(supply);
    });
  }

  void _removeExpense(SuppliesData supply) {
    final supplyIndex = _reqisteredSupplies.indexOf(supply);
    setState(() {
      _reqisteredSupplies.remove(supply);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      // aşağıda bildirim gösterip işlem yapmayı sağlar
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Tedarik Silindi'),
        action: SnackBarAction(
            label: 'Geri Al',
            onPressed: () {
              setState(() {
                _reqisteredSupplies.insert(supplyIndex, supply);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('Tedarik Bulunamadı'),
    );

    if (_reqisteredSupplies.isNotEmpty) {
      mainContent = SuppliesList(
        supplies: _reqisteredSupplies,
        onRemoveSupply: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mevcut Tedarik Listesi',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _openAddSupplyOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(supplies: _reqisteredSupplies),
                Expanded(child: mainContent)
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(supplies: _reqisteredSupplies)),
                Expanded(child: mainContent)
              ],
            ),
    );
  }
}
