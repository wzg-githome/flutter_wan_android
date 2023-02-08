import 'package:flutter_easyrefresh/easy_refresh.dart';

Header? getCustomHeader() {
  return ClassicalHeader(
    refreshText: "下拉刷新",
    refreshReadyText: "释放刷新",
    refreshingText: "刷新中...",
    refreshedText: "刷新完成",
    refreshFailedText: "刷新失败",
    noMoreText: "没有更多",
    showInfo: true,
    infoText: "更新时间 %T",
  );
}

Footer? getCustomFooter() {
  return ClassicalFooter(
    loadText: "上拉加载",
    loadReadyText: "释放加载",
    loadingText: "加载中...",
    loadedText: "加载完成",
    loadFailedText: "加载失败",
    noMoreText: "没有更多",
    showInfo: true,
    infoText: "更新时间 %T",
  );
}
