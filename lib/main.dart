import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryInfoScreen(),
    );
  }
}

class CountryInfoScreen extends StatefulWidget {
  @override
  _CountryInfoScreenState createState() => _CountryInfoScreenState();
}

class _CountryInfoScreenState extends State<CountryInfoScreen> {
  final CountryApi countryApi = CountryApi();
  Map<String, dynamic>? countryInfo;

  @override
  void initState() {
    super.initState();
    fetchCountryInfo('your_country_name');
  }

  Future<void> fetchCountryInfo(String countryName) async {
    try {
      final Map<String, dynamic> data = await countryApi.getCountryInfo(countryName);
      setState(() {
        countryInfo = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Information'),
      ),
      body: Center(
        child: countryInfo == null
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Country: ${countryInfo!['name']}',style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text('\nCapital: ${countryInfo!['capital']}',style: TextStyle(fontSize: 25)),
            SizedBox(height: 10,),
            Text('Population: ${countryInfo!['population']}',style: TextStyle(fontSize: 25)),
            SizedBox(height: 10,),
            Text('Languages: ${countryInfo!['languages'].values.join(', ')}',style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
