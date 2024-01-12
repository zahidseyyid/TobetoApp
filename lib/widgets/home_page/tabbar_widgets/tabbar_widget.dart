import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/applications_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessons_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/surveys_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: SizedBox(
              width: deviceWidth * 0.6,
              child: Image.asset("lib/assets/istanbulkodluyor.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text(
              "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Text.rich(
            //Tırnak işaretli yeşil kısım
            TextSpan(
              text: 'Aradığın ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              children: <InlineSpan>[
                TextSpan(
                  text: '"',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D29B),
                  ),
                ),
                TextSpan(text: 'İş'),
                TextSpan(
                  text: '"',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00D29B),
                  ),
                ),
                TextSpan(text: ' burada!'),
              ],
            ),
          ),
          //Tabbar kod başlangıcı
          DefaultTabController(
            length: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  labelColor: Theme.of(context).colorScheme.primary,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.all(5),
                  tabAlignment: TabAlignment.start,
                  tabs: const [
                    Tab(
                      text: "Başvurularım",
                    ),
                    Tab(
                      text: "Eğitimlerim",
                    ),
                    Tab(
                      text: "Duyuru ve Haberlerim",
                    ),
                    Tab(
                      text: "Anketlerim",
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.23,
                  child: TabBarView(
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          // Başvurularım içeriği
                          ApplicationsWidget(),
                          ApplicationsWidget(),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          // Eğitimlerim içeriği
                          LessonsWidget(),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          // Duyuru ve Haberlerim içeriği
                          AnnouncementsWidget(),
                        ],
                      ),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          // Anketlerim içeriği
                          SurveysWidget(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
