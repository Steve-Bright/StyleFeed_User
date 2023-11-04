import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'Navigation/SavedPage/saveCard.dart';
import 'Navigation/HomePage/home.dart';
import 'Navigation/UserChatBox/chatHome.dart';
import 'Navigation/CartPage/cartPage.dart';
import 'splashScreen.dart';
import 'LoginPage/forgotPassword.dart';
import 'Navigation/HomePage/SearchPage/searchResults.dart';
import 'Navigation/HomePage/DetailScreen.dart';
import 'UserProfile/pointSystem.dart';
import 'Navigation/UserChatBox/chatPage.dart';
import 'Navigation/UserChatBox/chatHome.dart';
import 'Navigation/UserChatBox/utils/constants.dart';
import 'Navigation/CartPage/orderSuccess/checkout_detail.dart';
import 'UserProfile/profile_screen/profile_screen.dart';
import 'UserProfile/profile_screen/edit_profile_screen.dart';
import 'LoginPage/signInScreen.dart';
import 'LoginPage/signUpScreen.dart';
import 'LoginPage/reset_password.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/splashScreen',
//       routes: {
//         '/splashScreen': (context) => const SplashScreen(),
//         '/signIn': (context) => const SigningInPage(),
//         '/signUp': (context) => const SigningUpPage(),
//         '/savedCard': (context) => const SavedPage(),
//         '/cart': (context) => Cart_Items(newQty: 1),
//         '/userHome': (context) => const Myhome(),
//         '/chatHome': (context) => ChatHome(),
//         '/forgotPassword': (context) => ForgotPassword(),
//         '/searchResults': (context) => searchResults(),
//         '/itemDetail': (context) => DetailScreen(),
//         '/pointSystem': (context) => PointSystem(),
//         '/chatHome': (context) => ChatHome(),
//         '/chatPage': (context) => ChatPage()
//       },
//     ),
//   );
// }
// void main() => runApp(MaterialApp(
//   home: CheckoutDetail(),
// ));


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://hgffmysoarchwlcibjre.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhnZmZteXNvYXJjaHdsY2lianJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc0Nzk1NjcsImV4cCI6MjAxMzA1NTU2N30.1565G9rSqemAw3UV4tgBdYp9zWqIP7yrGrG2NWKyaKc',
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signIn',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        // '/signIn': (context) => const SigningInPage(),
        // '/signUp': (context) => const SigningUpPage(isRegistering: false),
        '/signIn': (context)=> const SignInScreen(),
        '/signUp': (context)=> const SignUpScreen(isRegistering: false),
        '/resetPassword': (context)=> const ResetPassword(),
        '/savedCard': (context) => const SavedPage(),
        '/cart': (context) => Cart_Items(newQty: 1),
        '/userHome': (context) => const Myhome(),
        '/chatHome': (context) => ChatHome(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/searchResults': (context) => searchResults(),
        // '/itemDetail': (context) => DetailScreen(),
        '/pointSystem': (context) => PointSystem(),
        '/chatHome': (context) => ChatHome(),
        '/chatPage': (context) => ChatPage(),
        '/checkoutDetail': (context) => CheckoutDetail(),
        '/profile': (context) => ProfileScreen(),
        '/editProfile': (context) => EditProfileScreen()
      },
    ),
  );
}





