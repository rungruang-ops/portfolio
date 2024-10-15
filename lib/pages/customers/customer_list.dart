import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/constants/defaults.dart';
import '../../../shared/widgets/section_title.dart';
import '../../../theme/app_colors.dart';
import '../../responsive.dart';
import '../../shared/constants/ghaps.dart';
import '../../shared/models/customer_model.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) gapH24,
        Text(
          "Customer list",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        gapH16,
        const _List(),
      ],
    );
  }
}

List<CustomerModel> customerDummyData = [
  CustomerModel(
      'Alice', 'alice@theflutterway.com', '4', '\$384', '12.8%', '8', '16'),
  CustomerModel(
      'Bob', 'bob@theflutterway.com', '7', '\$287', '17.1%', '5', '11'),
  CustomerModel(
      'Charlie', 'charlie@theflutterway.com', '3', '\$184', '9.2%', '3', '7'),
  CustomerModel(
      'David', 'david@theflutterway.com', '5', '\$384', '12.8%', '8', '16'),
  CustomerModel(
      'Eve', 'eve@theflutterway.com', '2', '\$287', '17.1%', '5', '11'),
  CustomerModel(
      'Frank', 'frank@theflutterway.com', '6', '\$184', '9.2%', '3', '7'),
  CustomerModel(
      'Alice', 'alice@theflutterway.com', '4', '\$384', '12.8%', '8', '16'),
  CustomerModel(
      'Bob', 'bob@theflutterway.com', '7', '\$287', '17.1%', '5', '11'),
  CustomerModel(
      'Charlie', 'charlie@theflutterway.com', '3', '\$184', '9.2%', '3', '7'),
  CustomerModel(
      'David', 'david@theflutterway.com', '5', '\$384', '12.8%', '8', '16'),
  CustomerModel(
      'Eve', 'eve@theflutterway.com', '2', '\$287', '17.1%', '5', '11'),
  CustomerModel(
      'Frank', 'frank@theflutterway.com', '6', '\$184', '9.2%', '3', '7'),
  CustomerModel(
      'Alice', 'alice@theflutterway.com', '4', '\$384', '12.8%', '8', '16'),
  CustomerModel(
      'Bob', 'bob@theflutterway.com', '7', '\$287', '17.1%', '5', '11'),
  CustomerModel(
      'Charlie', 'charlie@theflutterway.com', '3', '\$184', '9.2%', '3', '7'),
  CustomerModel(
      'David', 'david@theflutterway.com', '5', '\$384', '12.8%', '8', '16'),
  CustomerModel(
      'Eve', 'eve@theflutterway.com', '2', '\$287', '17.1%', '5', '11'),
  CustomerModel(
      'Frank', 'frank@theflutterway.com', '6', '\$184', '9.2%', '3', '7'),
];

class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius:
            BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SectionTitle(
                title: "Customers",
                color: AppColors.secondaryLavender,
              ),
              if (!Responsive.isMobile(context)) gapW16,
              if (!Responsive.isMobile(context))
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          // style: Theme.of(context).textTheme.labelLarge,
                          decoration: InputDecoration(
                            hintText: "Search by name or email...",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: AppDefaults.padding,
                                  right: AppDefaults.padding / 2),
                              child: SvgPicture.asset(
                                  "assets/icons/search_light.svg"),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            border: AppDefaults.outlineInputBorder,
                            focusedBorder:
                                AppDefaults.focusedOutlineInputBorder,
                          ),
                        ),
                      ),
                      gapW16,
                      const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ),
              if (!Responsive.isMobile(context)) ...[
                gapW8,
                Chip(
                  label: const Text('Active'),
                  backgroundColor: AppColors.textGrey.withOpacity(0.5),
                  side: BorderSide.none,
                ),
                gapW8,
                const Chip(
                  label: Text('New'),
                  backgroundColor: AppColors.bgLight,
                  side: BorderSide.none,
                ),
              ],
            ],
          ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            TextFormField(
              decoration: InputDecoration(
                hintText: "Search by name or email...",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                      left: AppDefaults.padding,
                      right: AppDefaults.padding / 2),
                  child: SvgPicture.asset("assets/icons/search_light.svg"),
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: AppDefaults.outlineInputBorder,
                focusedBorder: AppDefaults.focusedOutlineInputBorder,
              ),
            ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            DropdownMenu(
              controller: TextEditingController(text: "Active"),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "Active", label: "Active"),
                DropdownMenuEntry(value: "New", label: "New")
              ],
            ),
          gapH24,
          Responsive.isMobile(context)
              ? const _MobileTable()
              : const _DesktopTable(),
        ],
      ),
    );
  }
}

class _MobileTable extends StatelessWidget {
  const _MobileTable();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: customerDummyData.length,
      itemBuilder: (context, index) {
        final customer = customerDummyData[index];
        return Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDefaults.inputFieldRadius),
                  child: Image.asset(
                    "assets/images/illustration/dummy-customer.png",
                    width: 85,
                    height: 85,
                  ),
                ),
                gapW16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      gapH4,
                      Text(
                        customer.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: AppColors.textGrey,
                                ),
                      ),
                    ],
                  ),
                ),
                gapW8,
                Column(
                  children: [
                    Chip(
                      side: BorderSide.none,
                      backgroundColor: AppColors.textGrey.withOpacity(0.2),
                      label: Text(customer.price),
                      padding: EdgeInsets.zero,
                    ),
                    gapW8,
                    const Icon(
                      Icons.arrow_upward,
                      size: 18,
                      color: AppColors.success,
                    ),
                    Text(
                      customer.sales,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            gapH8,
            const Divider(),
            gapH16,
          ],
        );
      },
    );
  }
}

class _DesktopTable extends StatelessWidget {
  const _DesktopTable();

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: AppColors.bgLight,
          width: 1,
        ),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(5),
        2: FlexColumnWidth(4),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(3),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Checkbox(value: false, onChanged: (v) {}),
            ),
            TableCell(
              child: Text(
                'Name',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Email',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Purchase',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Lifetime',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Comments',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Likes',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        for (var customer in customerDummyData)
          TableRow(
            children: [
              TableCell(child: Checkbox(value: false, onChanged: (v) {})),
              TableCell(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppDefaults.inputFieldRadius),
                      child: Image.asset(
                        "assets/images/illustration/dummy-customer.png",
                        width: 85,
                        height: 85,
                      ),
                    ),
                    gapW16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customer.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          gapH4,
                          Text(
                            '@username',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.textGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Text(
                  customer.email,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              TableCell(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Chip(
                    side: BorderSide.none,
                    backgroundColor: AppColors.success.withOpacity(0.3),
                    label: Text(
                      customer.purchase,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Row(
                  children: [
                    Chip(
                      side: BorderSide.none,
                      backgroundColor: AppColors.textGrey.withOpacity(0.3),
                      label: Text(
                        customer.price,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    gapW8,
                    const Icon(
                      Icons.arrow_upward,
                      size: 18,
                      color: AppColors.success,
                    ),
                    Text(
                      customer.sales,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Text(
                  customer.comments,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              TableCell(
                child: Text(
                  customer.likes,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
