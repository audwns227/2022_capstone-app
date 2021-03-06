import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/collcom_mainpage.dart';
import 'package:flutter_login/collcom_navigationbar/report_page.dart';
import 'package:flutter_login/collector_navigationbar/collect_page.dart';
import 'package:flutter_login/components/Collector_components/pickup_list_form.dart';
import 'package:flutter_login/components/login/PO_login_form.dart';
import 'package:flutter_login/example.dart';
import 'package:flutter_login/pages/CollCom_pages/collcom_pickup_page.dart';
import 'package:flutter_login/pages/Collector_pages/pickup_page.dart';
import 'package:flutter_login/pages/login/collcom_login_page.dart';
import 'package:flutter_login/pages/login/collector_login_page.dart';
import 'package:flutter_login/pages/login/select_job_login.dart';
import 'package:flutter_login/pages/signup/collcom_signup_page.dart';
import 'package:flutter_login/pages/signup/collector_signup_page.dart';
import 'package:flutter_login/initial_page.dart';
import 'package:flutter_login/pages/login/PO_login_page.dart';
import 'package:flutter_login/pages/signup/PO_signup_page.dart';
import 'package:flutter_login/pages/PO_pages/scale_measure_page.dart';
import 'package:flutter_login/pages/signup/select_po_page.dart';
import 'package:flutter_login/pages/signup/select_signup_page.dart';
import 'package:flutter_login/pages/signup/signup_parttime.dart';
import 'package:flutter_login/provider/PO_list_provider.dart';
import 'package:flutter_login/provider/collcom_pickup_provider.dart';
import 'package:flutter_login/provider/collector_list_provider.dart';
import 'package:flutter_login/provider/count.dart';
import 'package:flutter_login/provider/discharge_list.dart';
import 'package:flutter_login/provider/pickup_list_provider.dart';
import 'package:flutter_login/provider/scale_list.dart';
import 'package:flutter_login/provider/user_info/PO_info.dart';
import 'package:flutter_login/provider/user_info/collcom_info.dart';
import 'package:flutter_login/provider/user_info/collector_info.dart';
import 'package:flutter_login/provider/weight.dart';
import 'package:provider/provider.dart';
import 'collector_mainpage.dart';
import 'mainPage.dart';

void main() {
  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Count()), //????????????
        ChangeNotifierProvider(create: (_) => Weight()),//????????????
        ChangeNotifierProvider(create: (_) => ScaleList()),//????????????
        ChangeNotifierProvider(create: (_) => DischargeList()),//????????????
        ChangeNotifierProvider(create: (_) => POListProvider()),//???????????? ????????? ???????????????
        ChangeNotifierProvider(create: (_) => PickupListProvider()), //???????????? ?????? ????????? ???????????? ???????????? ??????
        ChangeNotifierProvider(create: (_) => CollectorListProvider()),//???????????? ??????????????? ????????????
        ChangeNotifierProvider(create: (_) => CollcomPickupListProvider()),//??????????????????
        ChangeNotifierProvider(create: (_) => POInfo()),//??????????????????
        ChangeNotifierProvider(create: (_) => CollectorInfo()),//??????????????????
        ChangeNotifierProvider(create: (_) => CollComInfo()),//??????????????????
      ],
      child: MaterialApp(

        initialRoute: "/initial", //"/initial"??? ?????????
        routes: {
          '/mainPO': (context) => MainPage(),
          '/mainCollector': (context) => CollectorMainPage(),
          "/mainCollCom": (context) => CollComMainPage(),
          "/selectjoblogin": (context) => SelectJobLogin(),
          "/CollectorLogin": (context) =>CollectorLoginPage(),
          "/CollComLogin": (context) => CollComLoginPage(),
          "/signup": (context) => POSignupPage(),
          "/collectorsignup": (context) => CollectorSignupPage(),
          "/collcomsignup": (context) => CollComSignupPage(),
           "/POlogin": (context) => POLoginPage(),
          "/initial": (context) => InitialPage(),
          "/selectSignup": (context) => SelectSignupPage(),
          "/selectrestaurant": (context) => SelectPOPage(),
          // "/signupparttime": (context) => SignupParttimePage(),
          "/Measure": (context) => MeasurePage(),
          "/Example": (context) => Example(),
          "/pickup": (context) => PickUpPage(),
          "/collcom_pickup": (context) => CollComPickUpPage(),
          "/pickuplist": (context) => CollectPage(),
          "/collcomreport": (context) => ReportPage(),
        },
      ),
    );
  }
}
