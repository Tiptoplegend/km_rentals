import 'package:car_rent_app/Owner/home.dart';
import 'package:car_rent_app/Owner/earnings.dart';
import 'package:car_rent_app/Owner/orders.dart';
import 'package:car_rent_app/Owner/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class OwnerNavigation extends StatefulWidget {
  const OwnerNavigation({super.key});

  @override
  State<OwnerNavigation> createState() => _OwnerNavigationState();
}

class _OwnerNavigationState extends State<OwnerNavigation> {
  int _selectedIndex = 0;

  static const _shellColor = Color(0xFFF7F7F9);
  static const _headerColor = Color(0xFF1E1E1E);

  final List<Widget> _pages = const [
    Home(),
    OwnerOrdersScreen(),
    EarningsScreen(),
    OwnerSettings(),
  ];

  void _setStatusBarForTab(int index) {
    SystemChrome.setSystemUIOverlayStyle(
      index == 0
          ? SystemUiOverlayStyle.dark.copyWith(
              systemNavigationBarColor: _shellColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            )
          : SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarColor: _shellColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setStatusBarForTab(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Outer scaffold paints behind the status bar; keep it dark on Home so the top is not a light strip.
      backgroundColor: _selectedIndex == 0 ? _headerColor : _shellColor,
      body: _pages[_selectedIndex],
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 28),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: const Color(0xFFF5B754).withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
              spreadRadius: -4,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: GNav(
            gap: 6,
            activeColor: const Color(0xFFF5B754),
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            duration: const Duration(milliseconds: 300),
            tabBackgroundColor: const Color(0xFFF5B754).withOpacity(0.15),
            color: const Color(0xFF8E8E93),
            tabBorderRadius: 20,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() => _selectedIndex = index);
              _setStatusBarForTab(index);
            },
            textStyle: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF5B754),
            ),
            tabs: const [
              GButton(icon: Icons.home_rounded, text: 'Home'),
              GButton(icon: Icons.list_rounded, text: 'Orders'),
              GButton(icon: Icons.monetization_on_rounded, text: 'Earnings'),
              GButton(icon: Icons.settings_rounded, text: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
