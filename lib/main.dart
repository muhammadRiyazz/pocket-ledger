import 'package:expence_app/application/bloc/expence_bloc.dart';
import 'package:expence_app/domain/expence_model.dart';
import 'package:expence_app/interface/notification.dart';
import 'package:expence_app/presendation/screen%20home/screen_home.dart';
import 'package:expence_app/presendation/screen%20splash/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
 WidgetsFlutterBinding.ensureInitialized();

  // Create an instance of NotificationService and initialize it
  final notificationService = NotificationService();
  await notificationService.init();

  // Schedule the notification for 6 PM
  await notificationService.scheduleDailyNotification(
    id: 0,
    title: 'Scheduled Notification',
    body: 'This is the body of the notification',
  );


  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ExpModelAdapter().typeId)) {
      Hive.registerAdapter(ExpModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExpenceBloc(),
        ),
      
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
         debugShowCheckedModeBanner: false,
            theme: ThemeData(        useMaterial3: false,
      
              textTheme: GoogleFonts.montserratTextTheme(
                (Theme.of(context).textTheme),
              ),
             // primarySwatch: Colors.teal,
            ),
        
        home: const ScreenSplash(),
      ),
    );
      
}
}


