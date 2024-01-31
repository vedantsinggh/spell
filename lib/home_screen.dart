import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spell_checker/colors.dart';
import 'package:spell_checker/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isNextClickable = false;

  @override
  Widget build(BuildContext context) {
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
                onTap: () {
                  _controller.clear();
                  setState(() {
                    isNextClickable = false;
                  });
                },
                child: const Hero(
                  tag: "icon",
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: themeColorLight,
                    child: Icon(
                      CupertinoIcons.pencil_outline,
                      size: 50,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 50, 70, 90),
                child: Hero(
                  tag: "text",
                  child: CupertinoTextField(
                    decoration: const BoxDecoration(color: textColor),
                    style: const TextStyle(color: themeColorDark),
                    placeholder: "Enter Text To Spell Check!",
                    placeholderStyle: const TextStyle(color: themeColorDark),
                    autocorrect: false,
                    cursorColor: themeColorLight,
                    onChanged: (value) {
                      setState(() {
                        isNextClickable = value.isNotEmpty;
                      });
                    },
                    maxLines: 4,
                    minLines: 1,
                    controller: _controller,
                  ),
                ),
              ),
              CupertinoButton(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: themeColorLight,
                disabledColor: themeColorDark,
                onPressed: isNextClickable
                    ? () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ResultScreen(
                                    text: _controller.text,
                                  )),
                        );
                      }
                    : null,
                child: isNextClickable
                    ? const Icon(CupertinoIcons.bandage_fill, color: textColor)
                    : const Icon(CupertinoIcons.bandage, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
