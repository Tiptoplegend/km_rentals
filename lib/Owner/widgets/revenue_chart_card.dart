import 'package:car_rent_app/Owner/owner_theme_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Period for revenue chart + hero total (dummy data).
enum RevenuePeriod { week, month, year, allTime }

class RevenueChartCard extends StatefulWidget {
  const RevenueChartCard({super.key});

  @override
  State<RevenueChartCard> createState() => _RevenueChartCardState();
}

class _RevenueChartCardState extends State<RevenueChartCard> {
  RevenuePeriod _period = RevenuePeriod.week;

  static const _surfaceCard = Color(0xFFFAFAFB); // Match app theme

  static final _money = NumberFormat('#,##0.00', 'en_US');

  List<String> get _labels {
    switch (_period) {
      case RevenuePeriod.week:
        return const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      case RevenuePeriod.month:
        return const ['W1', 'W2', 'W3', 'W4'];
      case RevenuePeriod.year:
        return const [
          'J',
          'F',
          'M',
          'A',
          'M',
          'J',
          'J',
          'A',
          'S',
          'O',
          'N',
          'D',
        ];
      case RevenuePeriod.allTime:
        return const ['Q1', 'Q2', 'Q3', 'Q4'];
    }
  }

  // Define two sets of values for dashed and solid lines
  List<double> get _valuesSolid {
    switch (_period) {
      case RevenuePeriod.week:
        return const [3.5, 4.8, 3.2, 5.5, 6.2, 4.0, 5.8];
      case RevenuePeriod.month:
        return const [4.2, 5.1, 4.8, 6.2];
      case RevenuePeriod.year:
        return const [8, 10, 12, 11, 14, 16, 15, 17, 18, 16, 19, 21];
      case RevenuePeriod.allTime:
        return const [42, 58, 51, 67];
    }
  }

  List<double> get _valuesDashed {
    switch (_period) {
      case RevenuePeriod.week:
        return const [2.0, 3.2, 2.5, 3.8, 3.0, 2.8, 3.2];
      case RevenuePeriod.month:
        return const [3.0, 4.0, 3.5, 4.5];
      case RevenuePeriod.year:
        return const [6, 8, 9, 8, 10, 12, 11, 13, 14, 12, 15, 18];
      case RevenuePeriod.allTime:
        return const [35, 48, 42, 55];
    }
  }

  /// Dummy total (GHC) — swap with API.
  double get _totalGhc {
    switch (_period) {
      case RevenuePeriod.week:
        return 90698.00;
      case RevenuePeriod.month:
        return 284120.50;
      case RevenuePeriod.year:
        return 1840920.00;
      case RevenuePeriod.allTime:
        return 4125680.75;
    }
  }

  String get _subtitle {
    switch (_period) {
      case RevenuePeriod.week:
        return 'Total revenue of this week';
      case RevenuePeriod.month:
        return 'Total revenue of this month';
      case RevenuePeriod.year:
        return 'Total revenue of this year';
      case RevenuePeriod.allTime:
        return 'Total revenue of all time';
    }
  }

  double get _maxY {
    final m = _valuesSolid.reduce((a, b) => a > b ? a : b);
    return (m * 1.3).ceilToDouble().clamp(4, double.infinity);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valuesSolid = _valuesSolid;
    final valuesDashed = _valuesDashed;
    final labels = _labels;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: _surfaceCard,
        border: Border.all(color: OwnerThemeColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 40,
            offset: const Offset(0, 18),
            spreadRadius: -12,
          ),
          BoxShadow(
            color: OwnerThemeColors.accent.withValues(alpha: 0.06),
            blurRadius: 48,
            offset: const Offset(0, 20),
            spreadRadius: -20,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header padded
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
            child: Row(
              children: [
                Text(
                  'Analytics',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: OwnerThemeColors.dark,
                  ),
                ),
                const Spacer(),
                _PeriodDropdown(
                  period: _period,
                  onChanged: (p) => setState(() => _period = p),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Big Numbers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GHC ${_money.format(_totalGhc)}',
                    textAlign: TextAlign.left,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: OwnerThemeColors.dark,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _subtitle,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: OwnerThemeColors.muted,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Line Chart extending wall to wall
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 140,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: (labels.length - 1).toDouble(),
                  minY: 0,
                  maxY: _maxY,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    show:
                        false, // Turn off FlChart built-in titles entirely to fix the spill
                  ),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: true,
                    getTouchedSpotIndicator: (barData, spotIndexes) {
                      return spotIndexes.map((index) {
                        return TouchedSpotIndicatorData(
                          const FlLine(
                            color: Color(0xFF111827),
                            strokeWidth: 1.5,
                          ),
                          FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 5,
                                color: const Color(0xFF111827),
                                strokeColor: Colors.white,
                                strokeWidth: 2.5,
                              );
                            },
                          ),
                        );
                      }).toList();
                    },
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => const Color(0xFF1F2937),
                      tooltipRoundedRadius: 16,
                      tooltipPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      fitInsideHorizontally: true,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          if (spot.barIndex == 0) return null; // skip dashed
                          return LineTooltipItem(
                            'GHC ${(spot.y * 1000).toStringAsFixed(2)}',
                            theme.textTheme.labelLarge?.copyWith(
                                  color: OwnerThemeColors.accent,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ) ??
                                const TextStyle(),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    // 1) Dashed line (Bottom/Background line)
                    LineChartBarData(
                      spots: List.generate(
                        valuesDashed.length,
                        (i) => FlSpot(i.toDouble(), valuesDashed[i]),
                      ),
                      isCurved: true,
                      color: const Color(0xFF374151).withValues(alpha: 0.8),
                      barWidth: 1.8,
                      dashArray: [6, 6],
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    // 2) Solid line (Main line)
                    LineChartBarData(
                      spots: List.generate(
                        valuesSolid.length,
                        (i) => FlSpot(i.toDouble(), valuesSolid[i]),
                      ),
                      isCurved: true,
                      color: OwnerThemeColors.accent,
                      barWidth: 3.5,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            OwnerThemeColors.accent.withValues(alpha: 0.25),
                            OwnerThemeColors.accent.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Custom spaced label row to prevent edge-spill
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(labels.length, (i) {
                final isSelected = i == (labels.length ~/ 2);
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? OwnerThemeColors.borderSubtle
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    labels[i],
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: isSelected
                          ? const Color(0xFF111827)
                          : const Color(0xFF9CA3AF),
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w600,
                      fontSize: 11,
                      letterSpacing: 0.2,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _PeriodDropdown extends StatelessWidget {
  const _PeriodDropdown({required this.period, required this.onChanged});

  final RevenuePeriod period;
  final ValueChanged<RevenuePeriod> onChanged;

  static String _label(RevenuePeriod p) {
    switch (p) {
      case RevenuePeriod.week:
        return 'Week';
      case RevenuePeriod.month:
        return 'Month';
      case RevenuePeriod.year:
        return 'Year';
      case RevenuePeriod.allTime:
        return 'All time';
    }
  }

  void _showPeriodPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Filter timeline',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: OwnerThemeColors.dark,
                            ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ...RevenuePeriod.values.map((p) {
                  final isSelected = p == period;
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    title: Text(
                      _label(p),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: OwnerThemeColors.dark,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(
                            Icons.check_circle_rounded,
                            color: OwnerThemeColors.accent,
                          )
                        : null,
                    onTap: () {
                      onChanged(p);
                      Navigator.pop(ctx);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showPeriodPicker(context),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: OwnerThemeColors.borderSubtle),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _label(period),
                style: theme.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFF6B7280),
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
