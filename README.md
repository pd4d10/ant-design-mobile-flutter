# Ant Design Mobile for Flutter

Flutter implementation of [Ant Design Mobile](https://mobile.ant.design/)

## Installation

Add `antd_mobile` as a dependency to your `pubspec.yaml`.

## Usage

```dart
import 'package:antd_mobile/antd_mobile.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Widgets are prefixed with `Ant`, for example:
    return AntButton(
      child: const Text('Button'),
      onClick: () {
        // do something
      },
    );
  }
}
```

## Contribution

[Ant Design Mobile](https://mobile.ant.design/) has a rich set of components, only a small part of which has been implemented so far. There is still a lot of work to be done, and contributions are very welcome!

## Roadmap

- Common
  - [x] Button
  - [x] Icon
- Layout
  - [ ] AutoCenter
  - [ ] Divider
  - [ ] Grid
  - [ ] SafeArea
  - [ ] Space
- Navigation
  - [ ] CapsuleTabs
  - [ ] IndexBar
  - [ ] JumboTabs
  - [x] NavBar
  - [ ] SideBar
  - [x] TabBar
  - [ ] Tabs
- Data Display
  - [ ] Avatar
  - [ ] Card
  - [x] Collapse
  - [ ] Ellipsis
  - [ ] FloatingPanel
  - [ ] Image
  - [ ] ImageViewer
  - [ ] InfiniteScroll
  - [x] List
  - [ ] PageIndicator
  - [ ] Steps
  - [ ] Swiper
  - [x] Tag
  - [ ] WaterMark
  - [ ] Footer
- Data Entry
  - [ ] Cascader
  - [ ] CascaderView
  - [x] CheckList
  - [ ] Checkbox
  - [ ] Form
  - [x] Input
  - [ ] Picker
  - [ ] PickerView
  - [ ] Radio
  - [ ] Rate
  - [ ] SearchBar
  - [ ] Selector
  - [ ] Slider
  - [ ] Stepper
  - [ ] Switch
  - [ ] TextArea
- Feedback
  - [x] ActionSheet
  - [ ] Dialog
  - [ ] Empty
  - [ ] ErrorBlock
  - [ ] Loading
  - [ ] Mask
  - [ ] Modal
  - [ ] Popover
  - [x] Popup
  - [ ] ProgressBar
  - [ ] ProgressCircle
  - [ ] PullToRefresh
  - [ ] Result
  - [ ] Skeleton
  - [ ] SwipeAction
  - [x] Toast
- Guidance
  - [ ] Badge
  - [ ] NoticeBar

## License

MIT
