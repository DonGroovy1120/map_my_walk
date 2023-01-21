import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:map_my_walk/providers/app_provider.dart';
import 'package:map_my_walk/providers/user_location.dart';
import 'package:map_my_walk/screens/base_screen/base_screen.dart';
import 'package:map_my_walk/screens/challenge_detail/challenge_detail.dart';
import 'package:map_my_walk/screens/challenges/challenges.dart';
import 'package:map_my_walk/screens/create_challenge/create_challenge.dart';
import 'package:map_my_walk/screens/dashboard/dashboard.dart';
import 'package:map_my_walk/screens/fitness_tip/fitness_tip.dart';
import 'package:map_my_walk/screens/home/home.dart';
import 'package:map_my_walk/screens/leader_board/leader_board.dart';
import 'package:map_my_walk/screens/login/login.dart';
import 'package:map_my_walk/screens/register/register.dart';
import 'package:map_my_walk/screens/splash/splash.dart';
import 'package:map_my_walk/screens/track_completed/track_completed.dart';
import 'package:map_my_walk/screens/tracking/tracking.dart';
import 'package:provider/provider.dart';
import 'app_routes.dart';
import 'configs/core_theme.dart' as theme;
import 'cubits/auth/cubit.dart';
import 'cubits/challenge/cubit.dart';
import 'cubits/diet/cubit.dart';
import 'cubits/domain/cubit.dart';
import 'cubits/user_stats/cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => DietCubit()),
        BlocProvider(create: (_) => DomainCubit()),
        BlocProvider(create: (_) => ChallengeCubit()),
        BlocProvider(create: (context) => UserStatsCubit()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => UserLocationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Map My Walk',
        theme: theme.themeLight,
        initialRoute: AppRoutes.splash,
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        routes: {
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.tracking: (context) => const TrackingScreen(),
          AppRoutes.dashboard: (context) => const DashboardScreen(),
          AppRoutes.trackCompleted: (context) => const TrackCompletedScreen(),
          AppRoutes.leaderBoard: (context) => const LeaderBoardScreen(),
          AppRoutes.baseScreen: (context) => const BaseScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.challenges: (context) => const ChallengesScreen(),
          AppRoutes.fitnessTip: (context) => const FitnessTipScreen(),
          AppRoutes.createChallenge: (context) => const CreateChallengeScreen(),
          AppRoutes.challengeDetail: (context) => const ChallengeDetailScreen(),
        },
      ),
    );
  }
}
