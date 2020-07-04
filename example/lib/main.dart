import 'package:flutter/material.dart';
import 'package:flutter_vant_kit/main.dart';

import './routes/index.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Component library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Component library"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Collapse(
            name: ["0"],
            list: [
              CollapseItem(
                customTitle: Text("Basic components",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("Button push button", (ctx) => DemoButton(),
                        padding: false),
                    PageCell("Cell Cell", (ctx) => DemoCell(), padding: false),
                    PageCell("Image picture", (ctx) => DemoImage(),
                        padding: true),
                    PageCell("Avatar head portrait", (ctx) => DemoAvatar(),
                        padding: true),
                  ],
                ),
              ),
              CollapseItem(
                customTitle: Text("Form component",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("Calendar", (ctx) => DemoCalendar(),
                        padding: false),
                    PageCell("Checkbox", (ctx) => DemoCheckbox(),
                        padding: true),
                    PageCell("Field", (ctx) => DemoField(), padding: false),
                    PageCell("NumberKeyboard", (ctx) => DemoNumberKeyboard(),
                        padding: true),
                    PageCell("PasswordInput", (ctx) => DemoPasswordInput(),
                        padding: true),
                    PageCell("Picker", (ctx) => DemoPicker(), padding: false),
                    PageCell("Radio", (ctx) => DemoRadio(), padding: true),
                    PageCell("Rate", (ctx) => DemoRate(), padding: false),
                    PageCell("Search", (ctx) => DemoSearch(), padding: false),
                    PageCell("Stepper", (ctx) => DemoStepper(), padding: false),
                    PageCell("ImageWall", (ctx) => DemoImageWall(),
                        padding: false),
                  ],
                ),
              ),
              CollapseItem(
                customTitle: Text("Feedback component",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell(
                        "ActionSheet Pull-up menu", (ctx) => DemoActionSheet(),
                        padding: true),
                    PageCell("Dialog Pop-ups", (ctx) => DemoDialog(),
                        padding: true),
                    PageCell("Loading", (ctx) => DemoLoading(), padding: true),
                  ],
                ),
              ),
              CollapseItem(
                customTitle: Text("Display components",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("Badge", (ctx) => DemoBadge(), padding: true),
                    PageCell("Circle", (ctx) => DemoCircle(), padding: true),
                    PageCell("Collapse", (ctx) => DemoCollapse(),
                        padding: false),
                    // PageCell("CountDown 倒计时", (ctx) => DemoCountDown(), padding: false),
                    PageCell("Divider", (ctx) => DemoDivider(), padding: true),
                    PageCell("ImagePreview", (ctx) => DemoImagePreview(),
                        padding: true),
                    PageCell("List", (ctx) => DemoList(),
                        padding: false, withScaffold: false),
                    PageCell("NoticeBar", (ctx) => DemoNoticeBar(),
                        padding: false),
                    PageCell("Panel", (ctx) => DemoPanel(), padding: false),
                    PageCell("Price", (ctx) => DemoPrice(), padding: true),
                    PageCell("Progress", (ctx) => DemoProgress(),
                        padding: true),
                    PageCell("Skeleton", (ctx) => DemoSkeleton(),
                        padding: true),
                    PageCell("Steps", (ctx) => DemoSteps(), padding: false),
                    PageCell("Swipe", (ctx) => DemoSwipe(), padding: false),
                    PageCell("Tag", (ctx) => DemoTag(), padding: true),
                  ],
                ),
              ),
              CollapseItem(
                customTitle: Text("Navigation component",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("Pagination", (ctx) => DemoPagination(),
                        padding: true),
                    PageCell("Sidebar", (ctx) => DemoSidebar(), padding: true),
                    PageCell("TreeSelect", (ctx) => DemoTreeSelect(),
                        padding: false),
                  ],
                ),
              ),
              CollapseItem(
                customTitle: Text("Business components",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                isExpanded: true,
                child: CellGroup(
                  border: false,
                  children: <Widget>[
                    PageCell("AddressEdit", (ctx) => DemoAddressEdit(),
                        padding: false),
                    PageCell("AddressList", (ctx) => DemoAddressList(),
                        padding: false),
                    PageCell("Card", (ctx) => DemoCard(), padding: false),
                    PageCell("Coupon", (ctx) => DemoCoupon(), padding: false),
                    PageCell("GoodsAction", (ctx) => DemoGoodsAction(),
                        padding: false),
                    PageCell("SubmitBar", (ctx) => DemoSubmitBar(),
                        padding: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageCell extends StatelessWidget {
  PageCell(
    this.title,
    this.builder, {
    this.withScaffold = true,
    this.padding = true,
  });

  final String title;
  final WidgetBuilder builder;
  final bool withScaffold;
  final bool padding;

  void _openPage(BuildContext context) {
    Navigator.push<dynamic>(context,
        MaterialPageRoute<dynamic>(builder: (context) {
      if (!withScaffold) {
        return builder(context);
      }
      return PageScaffold(
          title: title, body: builder(context), padding: padding);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Cell(
      title: title,
      isLink: true,
      onClick: () => _openPage(context),
    );
  }
}

class PageScaffold extends StatelessWidget {
  PageScaffold({this.title, this.body, this.padding: false});

  final String title;
  final Widget body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: padding
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: body,
                )
              : body,
        ));
  }
}
