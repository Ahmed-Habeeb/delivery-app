import 'package:delivery_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String status;
  final String totalPrice;
  final String date;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.status,
    required this.totalPrice,
    required this.date,
  });

  Color getStatusColor() {
    switch (status.toLowerCase()) {
      case 'new':
        return Colors.green;
      case 'delivering':
        return const Color(0xFF003C51); // Dark teal
      case 'returned':
        return Colors.red;
      case 'delivered':
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#$orderId', style: TextStyles.font12MediumGrey),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildColumn(
                        'Status',
                        status,
                        TextStyles.font16SemiBoldMainColor.copyWith(
                          color: statusColor,
                        ),
                      ),
                      // vertical divider
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey,
                  ),

                      _buildColumn(
                        'Total price',
                        totalPrice,
                        TextStyles.font16SemiBoldMainColor,
                      ),
                      // vertical divider
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.grey,
                  ),
                      _buildColumn(
                        'Date',
                        date,
                        TextStyles.font16SemiBoldMainColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 45,
            height: 110,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Container(
                    constraints:  BoxConstraints(maxWidth: 30.w),
                    child: Text(
                      'Order Details',
                      style: TextStyles.font8Regular
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(String label, String value, TextStyle valueStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // make first letter of the label capital
        Text(label, style: TextStyles.font10MediumGrey),
        const SizedBox(height: 4),
        Text(value [0].toUpperCase() + value.substring(1), // Capitalize first letter
            style: valueStyle),
      ],
    );
  }
}
