import 'widgets/new_customers.dart';
import 'widgets/top_country.dart';
import 'widgets/top_devices.dart';
import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../shared/constants/ghaps.dart';
import 'widgets/active_customers.dart';
import 'widgets/customer_overview.dart';
import 'widgets/messages.dart';
import 'widgets/refund_requests.dart';
import 'widgets/share_products.dart';
import 'widgets/traffic_channel.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isMobile(context)) gapH24,
              Text(
                "Customers",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              gapH16,
              const CustomersOverview(),
              gapH16,
              const TrafficChannel(),
              gapH16,
              const ActiveCustomers(),
              gapH16,
              const ShareProducts(),
              if (Responsive.isMobile(context)) ...[
                gapH16,
                const RefundRequests(),
                gapH16,
                const TopDevices(),
                gapH16,
                const TopCountry(),
                gapH16,
                const CustomerMessages(),
                gapH16,
                const NewCustomers(),
              ]
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) gapW16,
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 3,
            child: Column(
              children: [
                if (!Responsive.isMobile(context)) gapH24,
                Text(
                  " ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                gapH16,
                const RefundRequests(),
                gapH16,
                const TopDevices(),
                gapH16,
                const TopCountry(),
                gapH16,
                const CustomerMessages(),
                gapH16,
                const NewCustomers(),
              ],
            ),
          ),
      ],
    );
  }
}
