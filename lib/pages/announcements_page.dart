import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/home_page/footer.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget/announcement_item_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/announcements_widget/visibility_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_app_bar.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/dropdown_sort.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/edu_banner.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/search_widget.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/lessonsPage_widgets/state.dart';
import 'package:provider/provider.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({super.key});

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    return ChangeNotifierProvider<StateData>(
      //Arama ve filtreleme işlemleri için ChangeNotifierProvider ile sarmalladım
      create: (context) => StateData(),
      child: Scaffold(
        appBar: CustomAppBarWidget(brightness: brightness),
        drawer: const MyDrawer(),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EduBannerWidget(title: AnnouncementConstants.announcements),
              Row(
                children: [
                  Expanded(
                      child: SearchWidget(hintText: LessonConstants.search)),
                  VisibilityWidget(),
                  SizedBox(width: 15),
                ],
              ),
              DropdownSortWidget(
                hint: AnnouncementConstants.type,
                dropdownItems: AnnouncementConstants.dropdownTypeItems,
              ),
              DropdownSortWidget(
                hint: AnnouncementConstants.organization,
                dropdownItems: AnnouncementConstants.dropdownCorporationItems,
              ),
              DropdownSortWidget(
                hint: AnnouncementConstants.alignment,
                dropdownItems: AnnouncementConstants.dropdownSortItems,
              ),
              // ignore: prefer_const_constructors
              AnnouncementItemWidget(), //const yapma
              FooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
