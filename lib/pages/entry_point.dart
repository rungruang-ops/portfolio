import 'customers/customer_list.dart';
import 'promote/promote_page.dart';

import 'customers/customers_page.dart';
import 'products/widgets/add_product.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
import '../shared/constants/defaults.dart';
import '../shared/widgets/header.dart';
import '../shared/widgets/not_found.dart';
import '../shared/widgets/sidemenu/sidebar.dart';
import '../shared/widgets/sidemenu/tab_sidebar.dart';
import 'dashboard/dashboard_page.dart';
import 'products/products_page.dart';
import 'products/widgets/draft_products.dart';

final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: Responsive.isMobile(context)
          ? Sidebar(
              selectedIndex: _selectedIndex,
              onChanged: (i) => setState(() => _selectedIndex = i),
            )
          : null,
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            Sidebar(
              selectedIndex: _selectedIndex,
              onChanged: (i) => setState(() => _selectedIndex = i),
            ),
          if (Responsive.isTablet(context))
            TabSidebar(
              selectedIndex: _selectedIndex,
              onChanged: (i) => setState(() => _selectedIndex = i),
            ),
          Expanded(
            child: Column(
              children: [
                Header(drawerKey: _drawerKey),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding *
                                (Responsive.isMobile(context) ? 1 : 1.5),
                          ),
                          child: SafeArea(
                            child: _selectedIndex == 0
                                ? const DashboardPage()
                                : _selectedIndex == 1
                                    ? const ProductsPage()
                                    : _selectedIndex == 2
                                        ? const DraftProductsPage()
                                        : _selectedIndex == 3
                                            ? const AddProductPage()
                                            : _selectedIndex == 4
                                                ? const CustomersPage()
                                                : _selectedIndex == 5
                                                    ? const CustomerList()
                                                    : _selectedIndex == 11
                                                        ? const PromotePage()
                                                        : const NotFound(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
