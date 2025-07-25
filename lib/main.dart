import 'package:application/barrelView/barrlView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBsTaEH_gZE1MzUbVh6EUQmU26gGRhIuQ4',
    appId: '1:1095405167345:android:61b52a4da393b0bd28ff50',
    messagingSenderId: '1095405167345',
    projectId: 'test-e842d',
    storageBucket: 'test-e842d.firebasestorage.app',
  ));
  runApp(
    MultiProvider(
      providers: InitializeProvider.createChangeNotifierProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.loginScreen,
      routes: AppPages.getRoutes(),
      home: const Loginscreen(),
    );
  }
}
