import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c10_thursday/ui/home/hadeth_tab/hadeth_tab.dart';
import 'package:islami_c10_thursday/ui/home/quran_tab/quran_tab.dart';
import 'package:islami_c10_thursday/ui/home/radio_tab/radio_tab.dart';
import 'package:islami_c10_thursday/ui/home/settings_tab/settings_tab.dart';
import 'package:islami_c10_thursday/ui/home/tasbeh_tab/tasbeh_tab.dart';
import 'package:islami_c10_thursday/ui/styles/my_thtme_data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(MyThemeData.isDarkSelected
                  ? 'assets/images/main_background_dark.png'
                  : 'assets/images/main_background.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndexTab,
          onTap: (index) {
            setState(() {
              selectedIndexTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(
                  AssetImage('assets/images/quran_ic.png'),
                ),
                label: AppLocalizations.of(context)!.quran_tab),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(
                  AssetImage('assets/images/hadeth_ic.png'),
                ),
                label: AppLocalizations.of(context)!.hadeth_tab),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(
                  AssetImage('assets/images/sebha_ic.png'),
                ),
                label: AppLocalizations.of(context)!.tasbeh_tab),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(
                  AssetImage('assets/images/radio_ic.png'),
                ),
                label: AppLocalizations.of(context)!.radio_tab),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings_tab),
          ],
        ),
        body: tabs[selectedIndexTab],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
