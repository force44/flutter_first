import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../component/number/CountWinNumber.dart';
import '../provider/LottoStatProvider.dart';
import '../component/number/WinNumber.dart';


class TabSearch extends StatefulWidget {
  @override
  _TabSearch createState() => _TabSearch();
}

class _TabSearch extends  State<TabSearch> {

  //const TabLuck({super.key});
  //const TabLuck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String seed = '';
    String from = '';
    String to = '';

    return Center(
        child: ChangeNotifierProvider(
            create: (BuildContext context) => LottoStatProvider(),
            child: Text("yaho")
            )
    );
  }
}