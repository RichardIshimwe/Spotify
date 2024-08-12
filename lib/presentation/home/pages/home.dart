import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/home/widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.homeTopCard),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 63),
              child: Image.asset(AppImages.homeArtist),
            ),
          )
        ]),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        tabs: const [
          Text(
            'News',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Videos',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            'Artists',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text('Podcasts',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        ]);
  }
}
