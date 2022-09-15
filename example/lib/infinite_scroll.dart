import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class InfiniteScrollExample extends StatefulWidget {
  const InfiniteScrollExample({super.key});

  @override
  _InfiniteScrollExampleState createState() => _InfiniteScrollExampleState();
}

class _InfiniteScrollExampleState extends State<InfiniteScrollExample> {
  var hasMore = true;
  var count = 1;

  @override
  Widget build(BuildContext context) {
    return AntInfiniteScroll(
      hasMore: hasMore,
      loadMore: (isRetry) async {
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          count += 1;
          hasMore = count < 5;
        });
      },
      child: AntList(
        items: List.generate(
          count * 26,
          (index) => AntListItem(
            child: Text(String.fromCharCode((index % 26) + 65)),
          ),
        ),
      ),
    );
  }
}
