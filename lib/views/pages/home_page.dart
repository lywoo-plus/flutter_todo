import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Framework { flutter, nuxt, next }

class _HomePageState extends State<HomePage> {
  String inputValue = '';
  bool? isChecked;
  bool isSwitched = false;
  double sliderValue = 0;

  Framework? dropdownValue = Framework.flutter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: .all(24),
        child: Column(
          spacing: 16,
          mainAxisAlignment: .center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Name', border: OutlineInputBorder()),
              onChanged: (value) => inputValue = value,
              onEditingComplete: () => setState(() => print(inputValue)),
            ),
            Text(inputValue),

            CheckboxListTile(
              tristate: true,
              value: isChecked,
              onChanged: (value) => {
                setState(() {
                  isChecked = value;
                }),
              },
              title: Text(isChecked.toString()),
            ),

            SwitchListTile.adaptive(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              title: Text(isSwitched.toString()),
            ),

            Text('Slider value: ' + sliderValue.toString()),
            Slider(
              value: sliderValue,
              onChanged: (value) => setState(() => sliderValue = value),
              min: 0,
              max: 100,
              divisions: 10,
            ),

            DropdownButton(
              value: dropdownValue,
              items: [
                DropdownMenuItem(value: Framework.flutter, child: Text('Flutter')),
                DropdownMenuItem(value: Framework.nuxt, child: Text('Nuxt')),
                DropdownMenuItem(value: Framework.next, child: Text('Next')),
              ],
              onChanged: (value) {
                print(value?.name);
                setState(() {
                  dropdownValue = value;
                });
              },
            ),

            Material(
              color: Colors.white,
              child: InkWell(
                splashColor: Colors.pink,
                child: Container(
                  padding: .all(16),
                  decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
                  child: Image.asset('assets/images/nuxt.png'),
                ),
                onTap: () {
                  print('InkWell');
                },
              ),
            ),
            GestureDetector(
              child: Image.asset('assets/images/nuxt.png'),
              onTap: () {
                print('GestureDetector');
              },
            ),
            InkResponse(onTap: () {}, child: Icon(Icons.favorite)),
          ],
        ),
      ),
    );
  }
}
