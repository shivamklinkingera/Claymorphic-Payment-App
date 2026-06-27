import 'package:flutter/material.dart';
import '../../../../core/theme/clay_theme.dart';
import '../../../../core/widgets/clay_container.dart';

class SpendingInsightsPage extends StatelessWidget {
  const SpendingInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spending Insights'), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClayContainer(
              height: 250,
              width: double.infinity,
              child: CustomPaint(painter: _SimpleChartPainter()),
            ),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Top Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16),
            _CategorySpend(icon: Icons.shopping_bag, label: 'Shopping', amount: 4500, color: Colors.blue),
            _CategorySpend(icon: Icons.restaurant, label: 'Food & Drinks', amount: 3200, color: Colors.orange),
            _CategorySpend(icon: Icons.electric_bolt, label: 'Bills', amount: 2400, color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class _CategorySpend extends StatelessWidget {
  final IconData icon;
  final String label;
  final double amount;
  final Color color;
  const _CategorySpend({required this.icon, required this.label, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ClayContainer(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(width: 40, height: 40, decoration: BoxDecoration(color: color.withValues(alpha: 0.1), shape: BoxShape.circle), child: Icon(icon, color: color)),
            const SizedBox(width: 16),
            Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
            Text('₹$amount', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class _SimpleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ClayColors.primary.withValues(alpha: 0.6)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.4, size.width * 0.4, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.6, size.height * 0.9, size.width * 0.8, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.5);

    canvas.drawPath(path, paint);

    final dotPaint = Paint()..color = ClayColors.primary..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.3), 6, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
