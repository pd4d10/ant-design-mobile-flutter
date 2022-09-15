import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';

class AntInfiniteScroll extends StatefulWidget {
  const AntInfiniteScroll({
    super.key,
    required this.hasMore,
    required this.loadMore,
    required this.child,
    this.threshold = 250,
  });

  final bool hasMore;
  final Future<void> Function(bool isRetry) loadMore; // TODO: retry
  final double threshold;
  final Widget child;

  @override
  State<AntInfiniteScroll> createState() => _AntInfiniteScrollState();
}

class _AntInfiniteScrollState extends State<AntInfiniteScroll> {
  final _controller = ScrollController();
  var _loading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() async {
      if (_controller.position.maxScrollExtent - _controller.offset <
              widget.threshold &&
          !_controller.position.outOfRange &&
          !_loading &&
          widget.hasMore) {
        setState(() {
          _loading = true;
        });

        await widget.loadMore(false);
        setState(() {
          _loading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        children: [
          widget.child,
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              '加载中',
              style: TextStyle(
                fontSize: AntTheme.fontSizeMain,
                color: AntTheme.weak,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
