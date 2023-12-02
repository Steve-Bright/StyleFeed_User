import 'package:flutter/material.dart';
import 'package:style_feed/Navigation/SavedPage/favouritePage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

import 'package:style_feed/Controller/cartController.dart';
import 'package:style_feed/Controller/favouriteController.dart';
import 'package:style_feed/Controller/searchController.dart';
import 'package:style_feed/Controller/categorySearchController.dart';

import 'package:style_feed/Navigation/HomePage/home.dart';
import 'package:style_feed/Navigation/UserChatBox/chatHome.dart';
import 'package:style_feed/Navigation/CartPage/cartPage.dart';
import 'package:style_feed/splashScreen.dart';
import 'package:style_feed/LoginPage/forgotPassword.dart';
import 'package:style_feed/UserProfile/pointSystem.dart';
import 'package:style_feed/Navigation/UserChatBox/chatPage.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/checkoutDetailPage/checkout_detail.dart';
import 'package:style_feed/UserProfile/profile_screen/profile_screen.dart';
import 'package:style_feed/UserProfile/profile_screen/edit_profile_screen.dart';
import 'package:style_feed/LoginPage/signInScreen.dart';
import 'package:style_feed/LoginPage/signUpScreen.dart';
import 'package:style_feed/LoginPage/reset_password.dart';
import 'package:style_feed/Navigation/HomePage/SearchPage/searchResultsPage.dart';
import 'package:style_feed/Navigation/HomePage/CategorySearch/categorySearchPage.dart';
import 'package:style_feed/Navigation/CartPage/orderSuccess/address_controller.dart';
import 'package:style_feed/Controller/pointController.dart';


Future<void> main() async{
  Get.put(CartController());
  Get.put(PointController());
  Get.put(FavouriteController());
  Get.put(SearchingController());
  Get.put(CategorySearchController());
  Get.put(AddressController());
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://hgffmysoarchwlcibjre.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhnZmZteXNvYXJjaHdsY2lianJlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc0Nzk1NjcsImV4cCI6MjAxMzA1NTU2N30.1565G9rSqemAw3UV4tgBdYp9zWqIP7yrGrG2NWKyaKc',
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signIn',
      routes: {
        '/splashScreen': (context) => const SplashScreen(),
        '/signIn': (context)=> const SignInScreen(),
        '/signUp': (context)=> const SignUpScreen(isRegistering: false),
        '/resetPassword': (context)=> const ResetPassword(),
        '/favouritePage': (context) => const FavouritePage(),
        '/cart': (context) => CartPage(),
        '/userHome': (context) => Myhome(),
        '/chatHome': (context) => ChatHome(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/searchResults': (context) => SearchResultsPage(),
        '/pointSystem': (context) => PointSystem(),
        '/chatHome': (context) => ChatHome(),
        '/chatPage': (context) => ChatPage(),
        '/checkoutDetail': (context) => CheckoutDetail(),
        '/profile': (context) => ProfileScreen(),
        '/editProfile': (context) => EditProfileScreen(),
        '/checkoutDetail': (context) => CheckoutDetail(),
        '/categorySearchPage': (context) => CategorySearchPage(),
      },
    ),
  );
}





