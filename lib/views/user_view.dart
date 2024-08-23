import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import '../consts/styles.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Box(
          style: baseStyle,
          child: Box(
            //style: baseStyle,
            child: VBox(
              style: Style(
                $flex.gap(16),
              ),
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Box(
                        style: listItemStyle,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            child: StyledText(
                              'H',
                              style: Style($text.style.color(Colors.white)),
                            ),
                          ),
                          title: StyledText(
                            "Haddi",
                            style: baseStyle, // Reuse base style for text
                          ),
                          subtitle: StyledText(
                            'Online',
                            style: Style(
                              $text.style.color(Colors.green), // Default color
                              $on.dark($text.style.color(
                                  Colors.lightGreenAccent)), // Dark mode color
                            ),
                          ),
                          trailing: StyledIcon(
                            Icons.arrow_forward_ios,
                            style:
                                iconStyle, // Apply icon style with dark mode support
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
