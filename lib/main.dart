import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slicingdesign/model/item_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> items = ItemModel.sampleData;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: _profileSection()),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: _searchSection()),
            Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: _catalogueSection()),
            _itemSection(items),

            



          ],
          ),
        )
      ),
    );
  }

  Widget _profileSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, Welcome 👋',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500
              ),
            ),
            Text('Albert Stefano',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            'assets/images/portrait-white-man-isolated.png',
            fit: BoxFit.cover,
          ),
        )

      ],
    );
  }
  Widget _searchSection(){
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Expanded(
            flex: 12,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Clothes',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: FaIcon(FontAwesomeIcons.sliders, color: Colors.white,)),
            ),
          ),
        ],
      ),
    );
  }
  Widget _catalogueSection(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 20,
        children: [
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Wrap(
              spacing: 4,
              children: [
                SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/svg/grid-4-1-svgrepo-com.svg')
                ),
                const Text('All Items',
                  style: TextStyle(
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Wrap(
              spacing: 4,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset('assets/svg/dress-svgrepo-com.svg'),
                ),
                const Text('Dress',
                  style: TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Wrap(
              spacing: 4,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset('assets/svg/shirt-svgrepo-com.svg'),
                ),
                const Text('T-Shirt',
                  style: TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
          ),

          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Wrap(
              spacing: 4,
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset('assets/svg/jeans-boy-svgrepo-com.svg'),
                ),
                const Text('Pants',
                  style: TextStyle(
                      color: Colors.black
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _itemSection(List<ItemModel> items){
    List<ItemModel> evenItems = items.where((item) => item.id % 2 == 0).toList();
    List<ItemModel> oddItems = items.where((item) => item.id % 2 != 0).toList();

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: evenItems.map((item) =>
                  Container(
                    width: 180,
                    height: 298,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                  item.imageLocation,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity
                              ),
                            ),
                            Positioned(
                              top: 8,   // jarak dari atas
                              right: 8, // jarak dari kanan
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(
                                  color: Colors.black, // biar background terlihat
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height:8),

                        Text(item.itemName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height:4),

                        Text(item.category,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                          ),
                        ),
                        const SizedBox(height:10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${item.price}'),
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.star, color: Colors.yellow, size: 16,),
                                Text(item.rating.toString())
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
              ).toList(),
            ),


            Column(
              children: oddItems.map((item) =>
                  Container(
                    width: 180,
                    height: 332,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 240,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                  item.imageLocation,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity
                              ),
                            ),
                            Positioned(
                              top: 8,   // jarak dari atas
                              right: 8, // jarak dari kanan
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(
                                  color: Colors.black, // biar background terlihat
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.heart,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height:8),

                        Text(item.itemName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height:4),

                        Text(item.category,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14
                          ),
                        ),
                        const SizedBox(height:10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${item.price}'),
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.star, color: Colors.yellow, size: 16,),
                                Text(item.rating.toString())
                              ],
                            )
                          ],
                        )
                      ],
                    ),

                  )
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

