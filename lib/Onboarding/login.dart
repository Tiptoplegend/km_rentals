import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:ui';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLogin = true;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5B754),
      body: Stack(
        children: [
          // The Premium Grid Pattern
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(-0.5, -0.6),
                  radius: 1.5,
                  colors: [
                    Color(0xFFFFD181), // Lighter gold highlight
                    Color(0xFFF5B754), // Base gold
                  ],
                ),
              ),
              child: Stack(
                children: [
                  CustomPaint(painter: _PatternPainter(), size: Size.infinite),
                  // The Fade Mask (Bottom-Left to Top-Right)
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: const [0.1, 0.9],
                        colors: [
                          const Color(0xFFF5B754).withOpacity(0.9), // Mask
                          const Color(
                            0xFFF5B754,
                          ).withOpacity(0.0), // Transparent
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _upperSection(),
                const SizedBox(height: 30),
                Expanded(child: _mainSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _upperSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black.withOpacity(0.05),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            _isLogin ? 'Welcome Back' : 'Join Us',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            _isLogin
                ? 'Login to your account'
                : 'Choose how you want to get started',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainSection() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Column(
          children: [
            _toggleSwitch(),
            const SizedBox(height: 40),
            // Pass registration/login form components here based on _isLogin
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _toggleSwitch() {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: _isLogin ? Alignment.centerLeft : Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _isLogin = true),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: _isLogin
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: _isLogin ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _isLogin = false),
                  child: Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: !_isLogin
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: !_isLogin ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    // Basic placeholder for now
    return Column(
      children: [
        // We can add text fields here later
        _isLogin ? _buildloginform() : _buildSignUpSelection(),
      ],
    );
  }

  Widget _buildSignUpSelection() {
    return Column(
      children: [
        _buildImageRoleCard(
          title: 'Sign up as a Renter',
          subtitle: 'Find and book the perfect car.',
          imageUrl: 'assets/images/renter_card.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignUp(role: 'renter')),
            );
          },
        ),
        const SizedBox(height: 20),
        _buildImageRoleCard(
          title: 'Sign up as an Owner',
          subtitle: 'List your car and start earning.',
          imageUrl: 'assets/images/owner_card.png',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SignUp(role: 'owner')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImageRoleCard({
    required String title,
    required String subtitle,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // 1. The Full-Bleed Background Image
              Image.asset(imageUrl, fit: BoxFit.cover),

              // 2. The Classic Dark Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  ),
                ),
              ),

              // 3. The Content
              Positioned(
                left: 24,
                right: 24,
                bottom: 24,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 22, // Bigger title for this style
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: 0.2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            subtitle,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E1E1E), // Solid dark grey/black
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: isPassword ? _obscurePassword : false,
          cursorColor: const Color(0xFFF5B754),
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFAFAFA), // Lighter, cleaner grey
            hintText: hint,
            hintStyle: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              color: Colors.black.withOpacity(0.3),
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.black.withOpacity(0.4),
              size: 22,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black.withOpacity(0.4),
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.05),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Color(0xFFF5B754), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildloginform() {
    return Column(
      children: [
        _buildInputField(
          label: 'Email Address',
          hint: 'hello@example.com',
          prefixIcon: Icons.email_outlined,
        ),
        const SizedBox(height: 24),
        _buildInputField(
          label: 'Password',
          hint: '••••••••••••',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
        ),
        const SizedBox(height: 7),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot password',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF5B754),
            ),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Implement login logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E1E1E), // Premium dark button
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              'Login',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        _buildsigninoptions(),
      ],
    );
  }
}

// ─── Premium Pattern Painter ────────────────────────────────────────────────

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    const double squareSize = 45;

    for (double i = 0; i < size.width; i += squareSize) {
      for (double j = 0; j < size.height; j += squareSize) {
        // Create a subtle "shimmer" effect with varying opacities
        final double opacity = ((i + j) % (squareSize * 3) == 0) ? 0.06 : 0.02;
        paint.color = Colors.black.withOpacity(opacity);

        canvas.drawRect(
          Rect.fromLTWH(i + 2, j + 2, squareSize - 4, squareSize - 4),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Widget _buildsigninoptions() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Or continue with",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(0.5), // Light black
              ),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.black.withOpacity(0.1), thickness: 1),
          ),
        ],
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialButton(assetPath: 'assets/google.png'),
          const SizedBox(width: 20),
          _buildSocialButton(
            icon: FontAwesomeIcons.facebookF,
            color: const Color(0xFF1877F2),
          ),
          const SizedBox(width: 20),
          _buildSocialButton(icon: FontAwesomeIcons.apple, color: Colors.black),
        ],
      ),
    ],
  );
}

Widget _buildSocialButton({IconData? icon, Color? color, String? assetPath}) {
  return Container(
    height: 56,
    width: 56,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.black.withOpacity(0.05), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Center(
      child: assetPath != null
          ? Image.asset(assetPath, height: 26, width: 26)
          : (icon != null
                ? FaIcon(icon, color: color, size: 24)
                : const SizedBox()),
    ),
  );
}
