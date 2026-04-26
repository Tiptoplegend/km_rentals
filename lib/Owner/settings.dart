import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_rent_app/authservices.dart';
import 'package:car_rent_app/auth_wrapper.dart';
import 'package:car_rent_app/Owner/owner_theme_colors.dart';
import 'package:car_rent_app/Owner/fleet.dart';

class OwnerSettings extends StatefulWidget {
  const OwnerSettings({super.key});

  @override
  State<OwnerSettings> createState() => _OwnerSettingsState();
}

class _OwnerSettingsState extends State<OwnerSettings> {
  static const _headerColor = Color(0xFF1E1E1E);
  static const _shellColor = Color(0xFFF7F7F9);
  static const _accent = Color(0xFFF5B754);

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8, top: 16),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFFAEAEB2),
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    String? subtitle,
    bool showDivider = true,
    Color iconColor = const Color(0xFF1E1E1E),
    Color textColor = const Color(0xFF1E1E1E),
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          subtitle: subtitle != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF8E8E93),
                    ),
                  ),
                )
              : null,
          trailing:
              trailing ??
              Icon(
                Icons.chevron_right_rounded,
                color: const Color(0xFFC7C7CC),
                size: 20,
              ),
          onTap: onTap ?? () {},
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            indent: 52,
            endIndent: 16,
            color: Color(0xFFF2F2F7),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.viewPaddingOf(context).top;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Dark Header Component
          Container(
            color: _headerColor,
            child: Column(
              children: [
                SizedBox(height: topInset),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _accent.withOpacity(0.45),
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFF3A3A3A),
                          child: Text(
                            'J',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Jerry Opoku',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified_rounded,
                                  color: _accent,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Pro Host',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: _accent,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Since 2024',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // White Operational Body
          Container(
            color: _shellColor,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Switch Context Action
                Container(
                  decoration: BoxDecoration(
                    color: _headerColor.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _headerColor.withOpacity(0.08)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _headerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.swap_horiz_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    title: const Text(
                      'Switch to Renter Mode',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: _headerColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right_rounded,
                      color: _headerColor,
                      size: 20,
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 16),

                // Business & Financial Group
                _buildSectionHeader('Business & Finances'),
                _buildSettingsGroup([
                  _buildTile(
                    icon: Icons.account_balance_wallet_rounded,
                    title: 'Payout Accounts',
                    subtitle: 'Manage direct deposits',
                    showDivider: false,
                  ),
                ]),

                // Fleet Settings Group (As Requested)
                _buildSectionHeader('Fleet Management'),
                _buildSettingsGroup([
                  _buildTile(
                    icon: Icons.directions_car_rounded,
                    iconColor: _accent,
                    title: 'My Fleets',
                    subtitle: 'Manage and track your vehicles',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OwnerFleetScreen(),
                        ),
                      );
                    },
                  ),
                  _buildTile(
                    icon: Icons.sensors_rounded,
                    iconColor: _accent,
                    title: 'Fleet Telematics',
                    subtitle: 'GPS and remote unlock sync',
                  ),
                  _buildTile(
                    icon: Icons.history_edu_rounded,
                    title: 'Cancellation Policies',
                    showDivider: false,
                  ),
                ]),

                // Account Operations
                _buildSectionHeader('App Settings'),
                _buildSettingsGroup([
                  _buildTile(
                    icon: Icons.notifications_rounded,
                    title: 'Push Notifications',
                  ),
                  _buildTile(
                    icon: Icons.security_rounded,
                    title: 'Sign-in & Security',
                  ),
                  _buildTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Help & Support',
                  ),
                  _buildTile(
                    icon: Icons.logout_rounded,
                    iconColor: const Color(0xFFD32F2F),
                    textColor: const Color(0xFFD32F2F),
                    title: 'Log Out',
                    showDivider: false,
                    trailing: const SizedBox.shrink(), // No chevron for logout
                    onTap: () async {
                      await authservice.value.signOut();
                      if (!context.mounted) return;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const AuthWrapper()),
                        (route) => false,
                      );
                    },
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
