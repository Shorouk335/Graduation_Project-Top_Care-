import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_care_gp/Firebase/Auth.dart';
import 'package:top_care_gp/Resource/Routes/Routes.dart';
import 'package:top_care_gp/Resource/Theme/bloc/theme_bloc.dart';


bool? IsLogin ;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // to not active land scape mode in app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  // لربط الفير بيز بالابلكيشن
   await Firebase.initializeApp();

  //لمعرفة المستخدم سجل دخول ولا لا
  var user = await getUserData();
  if (user == null) {
    IsLogin = false;
  } else {
    IsLogin = true;
  }

  runApp(TopCare());
}

class TopCare extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //to make the style of statusBar like app
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
    )
    );
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(context)..add(GetCurrentThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
                initialRoute:
                (IsLogin == true)
                    ? RouteGenerator.HomeRoute
                    : RouteGenerator.SplachRoute,
                onGenerateRoute: RouteGenerator.getRoute,
            );
          }
          return Container();
        },
      ),
    );
  }
}
