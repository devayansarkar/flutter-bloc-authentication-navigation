import 'package:flutter_mobile_application/common/constants/theme_colors.dart';
import 'package:flutter_mobile_application/common/styles/size_config.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;

  const ActionCard({
    Key key,
    @required this.icon,
    @required this.title,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: ThemeColors.secondaryColor,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        trailing: IconButton(
          icon: Icon(icon),
          onPressed: function,
          color: Colors.white,
        ),
        onTap: function,
      ),
    );
  }
}
