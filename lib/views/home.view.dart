import 'package:checkgon/styles/containerStyle.dart';
import 'package:checkgon/styles/formStyle.dart';
import 'package:checkgon/styles/textStyle.dart';
import 'package:checkgon/styles/theme.color.dart';
import 'package:checkgon/view.models/home.view.model.dart';
import 'package:checkgon/views/call.state.view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ThemeColorApp themeColorApp = ThemeColorApp();
  TextStyleApp textStyleApp = TextStyleApp();
  ContainerStyle containerStyle = ContainerStyle();
  FormStyle formStyle = FormStyle();
  bool bankRadio = false;
  bool webRadio = false;
  bool phoneRadio = false;
  bool smsRadio = false;
  bool bankButton = false;
  bool webButton = false;
  bool phoneButton = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColorApp.blue04,
        title: Container(
            width: widthScreen * 0.30,
            height: 24,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo-white.png"),
                  fit: BoxFit.cover),
            )),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CallStateView(),
                ),
              );
            },
            icon: const Icon(Icons.menu_outlined),
            color: themeColorApp.white,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "checkgon.go.th",
                style: textStyleApp.headerYellow03(),
              ),
              Text(
                "ร่วมต่อต้านภัยฉ้อโกงออนไลน์",
                style: textStyleApp.narmolWhite03(),
              ),
              Text(
                "หากโดนโกงอย่านิ่งเฉย ช่วยกันแจ้ง\nช่วยกันเช็ก เพื่อป้องกันภัยออนไลน์",
                style: textStyleApp.narmolWhite01(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/spam01.png"),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              ),
              reportSpam(widthScreen, context),
              checkSpam(widthScreen, context),
              Container(
                  width: widthScreen,
                  height: 360,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/footter.png"),
                        fit: BoxFit.cover),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget reportSpam(double widthScreen, BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widthScreen * 0.9,
        height: 272,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage("assets/images/spam02.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Text(
              "แจ้งเบาะแสภัยออนไลน์",
              style: textStyleApp.narmolWhite02(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: radioRow1(context),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: radioRow2(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                decoration: containerStyle.normal(),
                child: formStyle.textFieldNormal("กรอกเบอร์แก๊ง Call center",
                    viewModel.spamOnSubmit, viewModel.spamOnSubmit),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: widthScreen,
                  height: 48,
                  decoration: containerStyle.normalYellow(),
                  child: Center(
                    child:
                        Text("แจ้งเลย!", style: textStyleApp.headerBlack01()),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget radioRow1(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: bankRadio,
                onChanged: (index) {
                  bool check = false;
                  if (index != null) check = index;
                  setState(() {
                    bankRadio = check;
                    smsRadio = false;
                    webRadio = false;
                    phoneRadio = false;
                    viewModel.setBankRadio = check;
                  });
                },
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return (bankRadio)
                      ? themeColorApp.yellow04
                      : themeColorApp.white;
                }),
              ),
              Expanded(
                child: Text(
                  'บัญชีธนาคาร',
                  style: bankRadio
                      ? textStyleApp.narmolYellow00()
                      : textStyleApp.narmolWhite00(),
                ),
              )
            ],
          ),
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: phoneRadio,
                onChanged: (index) {
                  bool check = false;
                  if (index != null) check = index;
                  setState(() {
                    phoneRadio = check;
                    bankRadio = false;
                    webRadio = false;
                    smsRadio = false;
                    viewModel.setPhoneRadio = check;
                  });
                },
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return (phoneRadio)
                      ? themeColorApp.yellow04
                      : themeColorApp.white;
                }),
              ),
              Expanded(
                  child: Text('เบอร์แก๊ง Call center',
                      style: phoneRadio
                          ? textStyleApp.narmolYellow00()
                          : textStyleApp.narmolWhite00()))
            ],
          ),
        ),
      ],
    );
  }

  Widget radioRow2(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: webRadio,
                onChanged: (index) {
                  bool check = false;
                  if (index != null) check = index;
                  setState(() {
                    webRadio = check;
                    bankRadio = false;
                    smsRadio = false;
                    phoneRadio = false;
                    viewModel.setWebRadio = check;
                  });
                },
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return (webRadio)
                      ? themeColorApp.yellow04
                      : themeColorApp.white;
                }),
              ),
              Expanded(
                child: Text('เว็บปลอม',
                    style: webRadio
                        ? textStyleApp.narmolYellow00()
                        : textStyleApp.narmolWhite00()),
              )
            ],
          ),
          flex: 1,
        ),
        Expanded(
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              Radio(
                value: true,
                groupValue: smsRadio,
                onChanged: (index) {
                  bool check = false;
                  if (index != null) check = index;
                  setState(() {
                    smsRadio = check;
                    bankRadio = false;
                    webRadio = false;
                    phoneRadio = false;
                    viewModel.setSmsRadio = check;
                  });
                },
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return (smsRadio)
                      ? themeColorApp.yellow04
                      : themeColorApp.white;
                }),
              ),
              Expanded(
                  child: Text('SMS หลอกลวง',
                      style: smsRadio
                          ? textStyleApp.narmolYellow00()
                          : textStyleApp.narmolWhite00()))
            ],
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget checkSpam(double widthScreen, BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widthScreen * 0.9,
        height: 272,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "เช็คเบอร์ Call Center/บัญชี/เว็บปลอม",
              style: textStyleApp.narmolWhite02(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: checkButton(context, widthScreen),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                decoration: containerStyle.normal(),
                child: formStyle.textFieldNormal(
                    "ลิ้ง URL ร้านค้า/เพจ/เว็บไซต์",
                    viewModel.spamOnSubmit,
                    viewModel.spamOnSubmit),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: widthScreen,
                  height: 48,
                  decoration: containerStyle.normalYellow(),
                  child: Center(
                    child:
                        Text("เช็คเลย!", style: textStyleApp.headerBlack01()),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget checkButton(BuildContext context, double widthScreen) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              bankButton = true;
              webButton = false;
              phoneButton = false;
            });
          },
          child: Container(
            decoration: bankButton
                ? containerStyle.normalBlue()
                : containerStyle.normal(),
            width: widthScreen * 0.25,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on,
                  color:
                      bankButton ? themeColorApp.white : themeColorApp.gray04,
                ),
                Text("เช็คบัญชี",
                    style: bankButton
                        ? textStyleApp.narmolWhite01()
                        : textStyleApp.narmolGray01())
              ],
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              bankButton = false;
              webButton = false;
              phoneButton = true;
            });
          },
          child: Container(
            decoration: phoneButton
                ? containerStyle.normalBlue()
                : containerStyle.normal(),
            width: widthScreen * 0.25,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color:
                      phoneButton ? themeColorApp.white : themeColorApp.gray04,
                ),
                Text("เช็คเบอร์",
                    style: phoneButton
                        ? textStyleApp.narmolWhite01()
                        : textStyleApp.narmolGray01())
              ],
            ),
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              bankButton = false;
              webButton = true;
              phoneButton = false;
            });
          },
          child: Container(
            decoration: webButton
                ? containerStyle.normalBlue()
                : containerStyle.normal(),
            width: widthScreen * 0.25,
            height: 64,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.web,
                  color: webButton ? themeColorApp.white : themeColorApp.gray04,
                ),
                Text("เช็คเว็ป",
                    style: webButton
                        ? textStyleApp.narmolWhite01()
                        : textStyleApp.narmolGray01())
              ],
            ),
          ),
        )
      ],
    );
  }
}
