import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_wan_android/ui/main/inner_page/home_page/home_model.dart';

import 'entity/banner_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerEntity?>? _bannerList;

  @override
  void initState() {
    HomeModel.getBannerList((data) {
      setState(() {
        if (data != null && data.isNotEmpty) {
          _bannerList = data;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          height: 200,
          child: Swiper(
            itemCount: 3,
            itemBuilder: (context, index) {
              if (_bannerList != null && _bannerList!.isNotEmpty) {
                var indexItem = _bannerList![index];
                return Image.network(indexItem!.url!);
              }
              return const Center(
                child: Text("loading..."),
              );
            },
          ),
        )
      ],
    );
  }
}
