import 'package:docpost/app/pages/bill/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  var _copyingCode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Empresa',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const Text(
            'Banco do Brasil S.A.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vencimento',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const Text(
                    '05/09/2023',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Valor',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const Text(
                    'R\$ 203,54',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const Text(
                    'Vencido',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Número do Código de Barras',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          const Text(
            '82330000101-1 54760113201-6 3845067 0665-8 19747950601-5',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => PDFViewer());
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(color: Colors.blue),
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text('VISUALIZAR'),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    setState(() {
                      _copyingCode = !_copyingCode;
                    });
                    Clipboard.setData(const ClipboardData(
                        text:
                            '82330000101-1 54760113201-6 3845067 0665-8 19747950601-5'));
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      _copyingCode = !_copyingCode;
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(color: Colors.blue),
                    foregroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  icon: _copyingCode
                      ? const Icon(Icons.check)
                      : const Visibility(
                          visible: false, child: Icon(Icons.check)),
                  label: _copyingCode
                      ? const Text('COPIADO!')
                      : const Text('COPIAR CÓDIGO'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
