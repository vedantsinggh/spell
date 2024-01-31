import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spell_checker/colors.dart';

class ResultScreen extends StatefulWidget {
  final String text;
  const ResultScreen({super.key, required this.text});
  @override
  State<ResultScreen> createState() {
    return _ResultScreenState(text);
  }
}

class _ResultScreenState extends State<ResultScreen> {
  String text = "";
  _ResultScreenState(this.text);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = text;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: themeColorDark,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: const Hero(
                  tag: "icon",
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: themeColorLight,
                    child: Icon(
                      CupertinoIcons.pencil_outline,
                      size: 50,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(70),
                child: Hero(
                  tag: "text",
                  child: CupertinoTextField(
                    decoration: const BoxDecoration(color: textColor),
                    readOnly: true,
                    controller: _controller,
                    style: const TextStyle(color: themeColorDark),
                    autocorrect: false,
                    cursorColor: themeColorLight,
                    maxLines: 12,
                    minLines: 5,
                  ),
                ),
              ),
              CupertinoButton(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: themeColorDark,
                disabledColor: themeColorDark,
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  Navigator.pop(context);
                },
                child: const Icon(
                  CupertinoIcons.reply,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
