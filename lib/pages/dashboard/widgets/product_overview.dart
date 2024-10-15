import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../../../shared/constants/defaults.dart';
import '../../../shared/constants/ghaps.dart';
import '../../../shared/models/product_view_model.dart';
import '../../../shared/widgets/section_title.dart';
import '../../../theme/app_colors.dart';

List<ProductViewModel> productViewDummyData = [
  const ProductViewModel(x: 22, y: 27, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(x: 23, y: 21, barColor: AppColors.secondaryPeach),
  const ProductViewModel(x: 24, y: 30, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(x: 25, y: 19, barColor: AppColors.secondaryPeach),
  const ProductViewModel(x: 26, y: 27, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(x: 27, y: 15, barColor: AppColors.secondaryPeach),
  const ProductViewModel(x: 28, y: 23, barColor: AppColors.secondaryMintGreen),
];

class DashboardProductOverviews extends StatelessWidget {
  const DashboardProductOverviews({super.key});

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
                title: "Product views",
                color: AppColors.secondaryLavender,
              ),
              const Spacer(),
              DropdownMenu(
                controller: TextEditingController(text: "Last 7 days"),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "Last 7 days", label: "Last 7 days"),
                  DropdownMenuEntry(value: "All time", label: "All time"),
                ],
              ),
            ],
          ),
          gapH24,
          const BarChartSample8(),
        ],
      ),
    );
  }
}

class BarChartSample8 extends StatefulWidget {
  const BarChartSample8({super.key});

  final Color barBackgroundColor = AppColors.bgSecondayLight;
  final Color barColor = AppColors.secondaryMintGreen;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample8> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: BarChart(
              randomData(),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
    Color color, {
    bool isTouched = false,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isTouched ? AppColors.primary : color,
          borderRadius: BorderRadius.circular(2),
          width: Responsive.isMobile(context) ? 20 : 40,
          borderSide: BorderSide(
            color: isTouched ? AppColors.primary : color,
            width: 2.0,
          ),
        ),
      ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      // color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    Widget text = Text(
      days[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      maxY: 30.0,
      barTouchData: BarTouchData(
        enabled: true,
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
        touchTooltipData: BarTouchTooltipData(
          //tooltipBgColor: Colors.blueAccent,
          direction: TooltipDirection.auto,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              rod.toY.toString(),
              const TextStyle(color: Colors.white),
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // getTitlesWidget: getTitles,
            getTitlesWidget: (value, meta) => SideTitleWidget(
              axisSide: AxisSide.bottom,
              child: Text(value.toString()),
            ),
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 38,
            showTitles: true,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
          productViewDummyData.length,
          (index) => makeGroupData(
              productViewDummyData[index].x,
              productViewDummyData[index].y,
              productViewDummyData[index].barColor,
              isTouched: touchedIndex == index)),
      gridData: const FlGridData(show: true, drawVerticalLine: false),
    );
  }
}
