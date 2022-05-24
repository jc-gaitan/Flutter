/// Package import
import 'package:flutter/material.dart';

///datepicker import
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Widget calendar() {
  final Color monthCellBackground = const Color(0xfff7f4ff);
  final Color indicatorColor = const Color(0xFF1AC4C7);
  final Color highlightColor = Colors.deepPurpleAccent;
  final Color cellTextColor = const Color(0xFF130438);

  List<DateTime> _getSpecialDates() {
    DateTime date2 = DateTime.parse("2021-07-19");
    DateTime date = DateTime.parse("2021-07-10");
    DateTime date3 = DateTime.parse("2021-07-05");
    DateTime date4 = DateTime.parse("2021-07-01");
    DateTime date5 = DateTime.parse("2021-07-26");

    final List<DateTime> dates = <DateTime>[];

    dates.add(date2);
    dates.add(date);
    dates.add(date3);
    dates.add(date4);
    dates.add(date5);

    //print(dates);
    return dates;
  }

  //List<DateTime> _specialDates = _getSpecialDates();

  return SfDateRangePicker(
    selectionShape: DateRangePickerSelectionShape.rectangle,
    selectionColor: highlightColor,
    selectionTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    //primer fecha del calendario -> poner la primer fecha de asistencia
    minDate: DateTime.now().add(const Duration(days: -100)),
    //maxima fecha del calendario
    maxDate: DateTime.now(),
    headerStyle: DateRangePickerHeaderStyle(
      textAlign: TextAlign.center,
      textStyle: TextStyle(
        fontSize: 18,
        color: cellTextColor,
      ),
    ),
    monthCellStyle: DateRangePickerMonthCellStyle(
      cellDecoration: _MonthCellDecoration(
        borderColor: null,
        backgroundColor: monthCellBackground,
        showIndicator: false,
        indicatorColor: indicatorColor,
      ),
      todayCellDecoration: _MonthCellDecoration(
        borderColor: highlightColor,
        backgroundColor: monthCellBackground,
        showIndicator: false,
        indicatorColor: indicatorColor,
      ),
      specialDatesDecoration: _MonthCellDecoration(
        borderColor: null,
        backgroundColor: Color.fromRGBO(136, 255, 150, 1.0),
        showIndicator: false,
        indicatorColor: indicatorColor,
      ),
      disabledDatesTextStyle: TextStyle(
        color: const Color(0xffe2d7fe),
      ),
      weekendTextStyle: TextStyle(
        color: highlightColor,
      ),
      textStyle: TextStyle(color: cellTextColor, fontSize: 14),
      specialDatesTextStyle: TextStyle(color: cellTextColor, fontSize: 14),
      todayTextStyle: TextStyle(color: highlightColor, fontSize: 14),
    ),
    yearCellStyle: DateRangePickerYearCellStyle(
      todayTextStyle: TextStyle(color: highlightColor, fontSize: 14),
      textStyle: TextStyle(color: cellTextColor, fontSize: 14),
      disabledDatesTextStyle: TextStyle(
        color: const Color(0xffe2d7fe),
      ),
      leadingDatesTextStyle:
          TextStyle(color: cellTextColor.withOpacity(0.5), fontSize: 14),
    ),
    showNavigationArrow: true,
    todayHighlightColor: highlightColor,
    monthViewSettings: DateRangePickerMonthViewSettings(
      firstDayOfWeek: 1,
      viewHeaderStyle: DateRangePickerViewHeaderStyle(
        textStyle: TextStyle(
          fontSize: 10,
          color: cellTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      dayFormat: 'EEE',
      showTrailingAndLeadingDates: false,
      specialDates: _getSpecialDates(),
    ),
  );
}

class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
      borderColor: borderColor,
      backgroundColor: backgroundColor,
      showIndicator: showIndicator,
      indicatorColor: indicatorColor,
    );
  }
}

class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    canvas.drawRRect(
        RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    if (borderColor != null) {
      paint.color = borderColor!;
      canvas.drawRRect(
          RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    }

    if (showIndicator) {
      paint.color = indicatorColor!;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(bounds.right - 6, bounds.top + 6), 2.5, paint);
    }
  }
}
