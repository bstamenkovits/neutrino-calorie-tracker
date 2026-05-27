import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:neutrino_calorie_tracker/pages/auth_page.dart';
import 'package:neutrino_calorie_tracker/pages/home_page.dart';
import 'package:neutrino_calorie_tracker/pages/test_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: "env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neutrino Calorie Tracker',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const AuthWrapper(),
    );
  }
}



/// A widget that manages the application's root navigation state based on authentication.
///
/// It listens to the Supabase authentication state changes and determines whether
/// to display the [HomePage] (if the user is authenticated) or the [AuthPage]
/// (if the user is not authenticated). It also handles the initial loading state.
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      
        // extract session if it exists
        final session = snapshot.hasData ? snapshot.data!.session : null;
        
        // route user based on supabase session
        if (session != null) {
          // return const HomePage();
          return const TestPage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
