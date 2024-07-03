import 'package:construction_mate/logic/controllers/BottomBarBloc/bottom_bar_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottomBarBloc(),
        ),
        BlocProvider(
          create: (_) => StartAndEndDateBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72, 783.27),
        splitScreenMode: true,
        child: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => DateBlocBloc())],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: Routes.routes,
          ),
        ),
      ),
    );
  }
}
