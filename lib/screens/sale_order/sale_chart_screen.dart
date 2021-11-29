import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trado_app_uit/components/card_shadow.dart';
import 'package:trado_app_uit/components/custom_icon.dart';
import 'package:trado_app_uit/components/custom_text.dart';
import '/constants/sizes.dart';
import '/constants/constants.dart';
import '/constants/dimen.dart';
import '/widgets/appbar_widget.dart';
import '/components/custom_refresh_page.dart';

class SaleChartScreen extends StatefulWidget {
  const SaleChartScreen({Key? key}) : super(key: key);

  @override
  State<SaleChartScreen> createState() => _SaleChartScreenState();
}

class _SaleChartScreenState extends State<SaleChartScreen> {
  final List<String> items = ['2021', '2020'];
  String? value;
  late List<Color> gradientColors = [
    kColorItemGrey,
    kBackgroundColorWhite,
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      value = items[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshPage(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Doanh thu',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppDimen.verticalSpacing_10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildListYears(),
                  ],
                ),
                _buildLineChart(),
                _buildAmountCategories(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListYears() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimen.verticalSpacing_5),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimen.horizontalSpacing_10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimen.radiusNormal),
        border: Border.all(
          color: kTextColorGrey,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: this.value,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: CustomText(
                value,
                color: kTextDark,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
          elevation: 0,
          icon: CustomIcon(Icons.keyboard_arrow_down_rounded),
        ),
      ),
    );
  }

  Widget _buildAmountCategories() {
    return Row(
      children: [
        Expanded(
          child: CardShadow(
            margin: const EdgeInsets.symmetric(vertical: AppDimen.spacing_2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Số lượng sản phẩm đã bán: ',
                        maxLines: 1,
                        fontSize: FontSize.SMALL + 1,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        '100',
                        fontSize: FontSize.BIG_1,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        'Tổng giá trị: ',
                        maxLines: 1,
                        fontSize: FontSize.SMALL + 1,
                      ),
                      const SizedBox(height: 10),
                      CustomText(
                        '100.000.000 đ',
                        fontSize: FontSize.BIG_1,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLineChart() {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Color(0xFF30336B),
        borderRadius: BorderRadius.circular(AppDimen.radiusBig),
      ),
      padding:
          const EdgeInsets.symmetric(horizontal: AppDimen.horizontalSpacing_10),
      child: LineChart(
        LineChartData(
          maxX: 12,
          maxY: 6,
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: kTextColorGrey,
              ),
            ),
          ),
          titlesData: _buildTitlesData(),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(5, 5),
                FlSpot(6, 1),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 20,
        interval: 1,
        getTextStyles: (context, value) => TextStyle(
          color: kTextLight.withOpacity(.7),
          fontSize: FontSize.MEDIUM - 1,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'Th2';
            case 4:
              return 'Th4';
            case 6:
              return 'Th6';
            case 8:
              return 'Th8';
            case 10:
              return 'Th10';
            case 12:
              return 'Th12';
            default:
              return '';
          }
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => TextStyle(
          color: kTextLight.withOpacity(.7),
          fontWeight: FontWeight.bold,
          fontSize: FontSize.MEDIUM,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 25,
      ),
    );
  }
}
