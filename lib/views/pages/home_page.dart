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
            Hero(
              tag: 'logo',
              child: AspectRatio(
                aspectRatio: 1,
                child: Material(
                  color: Colors.pink.shade100,
                  borderRadius: .circular(16),
                  clipBehavior: Clip.antiAlias, // 🔑 single clip source
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Tapped!'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                          behavior: .floating,
                          shape: RoundedRectangleBorder(borderRadius: .circular(12)),
                        ),
                      );
                    },
                    splashColor: Colors.pink,
                    child: Padding(
                      padding: .all(16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: .all(color: Colors.green, width: 4),
                          borderRadius: .circular(16),
                        ),
                        child: Padding(
                          padding: .all(4),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: .circular(12),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/nuxt.png'),
                                fit: BoxFit.cover,
                                colorFilter: .mode(Colors.blue, .multiply),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Divider(color: Colors.green, indent: 50, endIndent: 50),
            InkResponse(
              splashColor: Colors.green,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Title'),
                    content: Text('Content'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Close'))],
                  ),
                );
              },
              child: Icon(Icons.favorite),
            ),
            SizedBox(height: 24, child: VerticalDivider(color: Colors.green)),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias, // important for children
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Styled Card',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),

            TextField(
              decoration: InputDecoration(hintText: 'Name', border: OutlineInputBorder()),
              onChanged: (value) => inputValue = value,
              onEditingComplete: () => setState(() => print(inputValue)),
            ),
            Text('Input value: ' + inputValue),

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

            GestureDetector(
              child: Image.asset('assets/images/nuxt.png'),
              onTap: () {
                print('GestureDetector');
              },
            ),
          ],
        ),
      ),
    );
  }
}
