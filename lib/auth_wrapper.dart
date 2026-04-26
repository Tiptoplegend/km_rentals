import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_rent_app/authservices.dart';
import 'package:car_rent_app/Owner/owner_navigation.dart';
import 'package:car_rent_app/Renter/Navigation.dart';
import 'package:car_rent_app/Onboarding/onboarding.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the stream is still initializing
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFFF5B754)),
            ),
          );
        }

        // If user is logged in, check their role to show the right dashboard
        if (snapshot.hasData && snapshot.data != null) {
          return FutureBuilder<String?>(
            future: authservice.value.getUserRole(),
            builder: (context, roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(color: Color(0xFFF5B754)),
                  ),
                );
              }

              if (roleSnapshot.data == 'owner') {
                return const OwnerNavigation();
              } else {
                return const Navigation(); // Renter navigation
              }
            },
          );
        }

        // User is not logged in, show Onboarding
        return const Onboarding();
      },
    );
  }
}
