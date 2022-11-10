import 'package:azlistview/azlistview.dart';
import 'package:explore_reo/consts/app_colors.dart';
import 'package:explore_reo/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class _AZItem extends ISuspensionBean {
  final String title;
  final String tag;

  _AZItem({
    required this.title,
    required this.tag,
  });

  @override
  String getSuspensionTag() => tag;
}

class AlphabetScrollWidget extends StatefulWidget {
  const AlphabetScrollWidget(
      {Key? key, required this.items, required this.onClickedItem})
      : super(key: key);
  final List<String?> items;
  final ValueChanged<String> onClickedItem;
  @override
  State<AlphabetScrollWidget> createState() => _AlphabetScrollWidgetState();
}

class _AlphabetScrollWidgetState extends State<AlphabetScrollWidget> {
  List<_AZItem> items = [];

  @override
  void initState() {
    super.initState();
    initList(widget.items);
  }

  void initList(List<String?> items) {
    this.items = items
        .map((item) => _AZItem(title: item!, tag: item[0].toUpperCase()))
        .toList();

    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
      padding: const EdgeInsets.all(5),
      data: items,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildListItem(item);
      },
      indexHintBuilder: (context, hint) => Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: TextWidget(
          text: hint,
          fontSize: 30,
        ),
      ),
      indexBarOptions: const IndexBarOptions(
          needRebuild: true,
          selectTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          selectItemDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          indexHintAlignment: Alignment.centerRight,
          indexHintOffset: Offset(-10, 0)),
    );
  }

  Widget _buildListItem(_AZItem item) {
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;
    return Column(
      children: [
        Offstage(offstage: offstage, child: buildHeader(tag)),
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: ListTile(
            title: TextWidget(text: item.title),
            onTap: () => widget.onClickedItem(item.title),
          ),
        ),
      ],
    );
  }

  Widget buildHeader(String tag) => Container(
        height: 18,
        alignment: Alignment.centerLeft,
        child: Text(
          tag,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      );
}
