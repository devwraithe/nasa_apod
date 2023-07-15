import 'package:cloudwalk_assessment/app/core/routes/routes_builder.dart';
import 'package:cloudwalk_assessment/app/core/theme/theme.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utilities/injectors/dependency_injector.dart' as di;

class CloudwalkAssessment extends StatelessWidget {
  const CloudwalkAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ImagesCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Cloudwalk Assessment',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        themeMode: ThemeMode.light,
        home: const HomeScreen(),
        routes: appRoutes,
      ),
    );
  }
}
