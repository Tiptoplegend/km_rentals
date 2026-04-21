import 'package:flutter/material.dart';

class OwnerFleetScreen extends StatefulWidget {
  const OwnerFleetScreen({super.key});

  @override
  State<OwnerFleetScreen> createState() => _OwnerFleetScreenState();
}

class _OwnerFleetScreenState extends State<OwnerFleetScreen> {
  static const _headerColor = Color(0xFF1E1E1E);
  static const _shellColor = Color(0xFFF7F7F9);
  static const _accent = Color(0xFFF5B754);

  int _selectedFilterIndex = 0;
  final List<String> _filters = ['All (4)', 'Available (2)', 'Rented (2)', 'Maintenance (0)'];

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = _selectedFilterIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilterIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? _accent : _headerColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? _accent : Colors.white.withOpacity(0.1),
                ),
              ),
              child: Text(
                _filters[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? _headerColor : Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildVehicleCard({
    required String name,
    required String licensePlate,
    required String status,
    required String totalEarnings,
    required int trips,
  }) {
    final bool isAvailable = status == 'Available';
    final Color badgeBg = isAvailable ? const Color(0xFFE8F5E9) : _accent.withOpacity(0.15);
    final Color badgeText = isAvailable ? const Color(0xFF2E7D32) : _accent;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image / Top Area
          Stack(
            children: [
              Container(
                height: 160,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5E5EA),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Center(
                  child: Icon(Icons.directions_car_filled_rounded, size: 80, color: Colors.white.withOpacity(0.5)),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: badgeText,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Details Area
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: _headerColor,
                              letterSpacing: -0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F2F7),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              licensePlate,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8E8E93),
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert_rounded, color: Color(0xFFC7C7CC)),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(height: 1, thickness: 1, color: Color(0xFFF2F2F7)),
                const SizedBox(height: 20),
                
                // Metrics
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMetricItem(
                      icon: Icons.account_balance_wallet_rounded,
                      label: 'Total Earned',
                      value: totalEarnings,
                      valueColor: _headerColor,
                    ),
                    _buildMetricItem(
                      icon: Icons.route_rounded,
                      label: 'Total Trips',
                      value: '$trips',
                    ),
                    _buildMetricItem(
                      icon: Icons.star_rounded,
                      label: 'Rating',
                      value: '4.9',
                      iconColor: _accent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem({
    required IconData icon,
    required String label,
    required String value,
    Color iconColor = Colors.grey,
    Color valueColor = const Color(0xFF1E1E1E),
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: iconColor),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8E8E93),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: valueColor,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.viewPaddingOf(context).top;

    return Scaffold(
      backgroundColor: _shellColor,
      body: Column(
        children: [
          // Dark Custom Header
          Container(
            color: _headerColor,
            padding: EdgeInsets.only(top: topInset),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 20, 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 4),
                      const Expanded(
                        child: Text(
                          'My Fleet',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.search_rounded, color: Colors.white, size: 20),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                _buildFilterChips(),
                const SizedBox(height: 24),
              ],
            ),
          ),

          // Body Fleet List
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 120),
              children: [
                _buildVehicleCard(
                  name: 'Mercedes G63 AMG',
                  licensePlate: 'GW-2023-24',
                  status: 'Rented',
                  totalEarnings: 'GHC 14,200',
                  trips: 12,
                ),
                _buildVehicleCard(
                  name: 'Range Rover Sport',
                  licensePlate: 'GT-405-23',
                  status: 'Available',
                  totalEarnings: 'GHC 28,500',
                  trips: 34,
                ),
                _buildVehicleCard(
                  name: 'Toyota Land Cruiser',
                  licensePlate: 'GR-100-24',
                  status: 'Rented',
                  totalEarnings: 'GHC 8,400',
                  trips: 6,
                ),
                 _buildVehicleCard(
                  name: 'Honda Civic FWD',
                  licensePlate: 'GW-543-22',
                  status: 'Available',
                  totalEarnings: 'GHC 4,100',
                  trips: 18,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: _headerColor,
        elevation: 4,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text(
          'Add Vehicle',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
