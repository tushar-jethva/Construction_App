import 'package:construction_mate/logic/controllers/bloc/bottom_bar_bloc.dart';
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
      providers: [BlocProvider(create: (_) => BottomBarBloc())],
      child: ScreenUtilInit(
        designSize: const Size(392.72, 783.27),
        splitScreenMode: true,
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
    );
  }
}
