import 'package:car_rent_app/Owner/owner_theme_colors.dart';
import 'package:car_rent_app/Owner/widgets/revenue_chart_card.dart';
import 'package:flutter/material.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OwnerThemeColors.shell,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color(0xFF1E1E1E), // App dark header standard
              padding: EdgeInsets.fromLTRB(20, MediaQuery.viewPaddingOf(context).top + 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Earnings',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Track your financial flow and payouts',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAEAEB2),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 140),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _balancePromoCard(context),
                  const SizedBox(height: 24),
                  const RevenueChartCard(),
                  const SizedBox(height: 36),
                  _buildTopVehicles(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _balancePromoCard(BuildContext context) {
  final theme = Theme.of(context);
  final labelMuted = theme.textTheme.bodySmall?.copyWith(
    color: OwnerThemeColors.muted,
    fontWeight: FontWeight.w400,
  );
  final detailLink = theme.textTheme.bodySmall?.copyWith(
    color: OwnerThemeColors.accent,
    fontWeight: FontWeight.w600,
  );

  final pillBg = OwnerThemeColors.accent.withOpacity(0.18);
  const pillFg = OwnerThemeColors.dark;

  return DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 24,
          offset: const Offset(0, 10),
        ),
        BoxShadow(
          color: OwnerThemeColors.accent.withOpacity(0.12),
          blurRadius: 20,
          offset: const Offset(0, 6),
          spreadRadius: -4,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: OwnerThemeColors.cardSurface,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('My Balance', style: labelMuted),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Account details', style: detailLink),
                            const SizedBox(width: 2),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: detailLink?.color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      r'$852.01',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: OwnerThemeColors.dark,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: pillBg,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        '4.00%',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: pillFg,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          backgroundColor: OwnerThemeColors.accent,
                          foregroundColor: OwnerThemeColors.dark,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'History',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: OwnerThemeColors.dark,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: OwnerThemeColors.dark,
                          side: const BorderSide(
                            color: OwnerThemeColors.dark,
                            width: 1.5,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          'Withdraw',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: OwnerThemeColors.dark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Material(
            color: OwnerThemeColors.dark,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 16, 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From your active car listings',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Withdraw rental income to your bank',
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: OwnerThemeColors.accent,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: OwnerThemeColors.accent.withOpacity(0.95),
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTopVehicles(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Top Earning Vehicles',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: OwnerThemeColors.dark,
              letterSpacing: -0.3,
            ),
      ),
      const SizedBox(height: 16),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            _vehicleEarningRow(
              context,
              name: 'Mercedes G63 AMG',
              license: 'GW-2023-24',
              earnings: 'GHC 40,500',
              percentage: '+12%',
              isUp: true,
              isLast: false,
            ),
            _vehicleEarningRow(
              context,
              name: 'Range Rover Sport',
              license: 'GT-405-23',
              earnings: 'GHC 28,200',
              percentage: '+8%',
              isUp: true,
              isLast: false,
            ),
            _vehicleEarningRow(
              context,
              name: 'Toyota Land Cruiser',
              license: 'GR-100-24',
              earnings: 'GHC 14,800',
              percentage: '-3%',
              isUp: false,
              isLast: true,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _vehicleEarningRow(
  BuildContext context, {
  required String name,
  required String license,
  required String earnings,
  required String percentage,
  required bool isUp,
  required bool isLast,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E5EA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.directions_car_rounded, color: Colors.grey),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: OwnerThemeColors.dark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    license,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: OwnerThemeColors.muted,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  earnings,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: OwnerThemeColors.dark,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      isUp ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
                      size: 14,
                      color: isUp ? const Color(0xFF2E7D32) : const Color(0xFFD32F2F),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      percentage,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isUp ? const Color(0xFF2E7D32) : const Color(0xFFD32F2F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      if (!isLast) const Divider(height: 1, thickness: 1, indent: 76, color: Color(0xFFF2F2F7)),
    ],
  );
}
