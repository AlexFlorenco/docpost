import 'package:docpost/app/pages/bill/bill_page.dart';
import 'package:flutter/material.dart';

class CardBill extends StatefulWidget {
  CardBill({super.key});

  @override
  State<CardBill> createState() => _CardBillState();
}

class _CardBillState extends State<CardBill> {
  String dropdownValue = 'Pendente';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey)),
                child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Banco do Brasil',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text('20/08/2023', style: TextStyle(fontSize: 12)),
                    SizedBox(
                      height: 4,
                    ),
                    Text('R\$ 203,54',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                items: <String>['Pago', 'Pendente', 'Vencido', 'Cancelado']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              )
            ],
          ),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            showDragHandle: true,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.81,
                child: BillPage(),
              );
            });
      },
    );
  }
}
