import 'package:docpost/components/card_statistics.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:month_year_picker/month_year_picker.dart';
import '../../components/card_bill.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var loadingList = false;
  var dropdownValue = 'Pendentes';
  DateTime? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Container(
            alignment: AlignmentDirectional.centerStart,
            child: const Text(
              'Olá, Alexandre!',
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/preferences');
              },
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Stack(children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  loadingList = true;
                });
                await Future.delayed(const Duration(seconds: 2));
                setState(() {
                  loadingList = false;
                });
              },
              child: loadingList
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                          child: LoadingAnimationWidget.discreteCircle(
                              color: Colors.blue,
                              secondRingColor: Colors.blue,
                              thirdRingColor: Colors.blue,
                              size: 50)),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Estatísticas',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 100,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return OverflowBox(
                                    minWidth: 0.0,
                                    minHeight: 0.0,
                                    maxWidth: MediaQuery.of(context).size.width,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        CardStatistics(
                                          width: constraints.maxWidth / 3,
                                        ),
                                        CardStatistics(
                                          width: constraints.maxWidth / 3,
                                        ),
                                        CardStatistics(
                                          width: constraints.maxWidth / 3,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: CardStatistics(
                                            width: constraints.maxWidth / 3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 28),
                            Row(
                              children: [
                                const Text(
                                  'Boletos',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward),
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.blue),
                                  items: <String>[
                                    'Pagos',
                                    'Pendentes',
                                    'Vencidos',
                                    'Cancelados'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                                ),
                                const Spacer(),
                                GestureDetector(
                                  child:
                                      const Icon(Icons.calendar_month_outlined),
                                  onTap: () => _onPressed(context: context),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                for (var i = 1; i < 10; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: CardBill(),
                                  )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ),
        ]));
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      locale: localeObj,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                surfaceTint: Colors.white,
                seedColor: Colors.blue,
                primary: Colors.blue,
                secondary: Colors.blue,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 520,
                child: child,
              ),
            ],
          ),
        );
      },
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
