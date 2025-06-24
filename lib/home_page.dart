import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'All_Provider/category_provider.dart';
import 'All_Provider/profile_list_provider.dart';
import 'All_Provider/service_provider.dart';
import 'All_Provider/slider_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ServiceProvider>(context, listen: false).fetchFeaturedServices());
    Future.microtask(() =>
        Provider.of<SliderProvider>(context, listen: false).fetchSliders());
    Future.microtask(() =>
        Provider.of<CategoryProvider>(context, listen: false).fetchCategories());
    Future.microtask(() =>
        Provider.of<ProviderListProvider>(context, listen: false).fetchProviders());
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
          SizedBox(height: 10),
              _buildCategoryList(),
              _buildDivider(),
              _buildCart(),
              _buildDivider(),
              _buildSlide(),
              _buildDivider(),
              _buildProfile(),
              _buildDivider(),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[700]),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
            Icon(Icons.home, color: Colors.white, size: 30),
              SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Home ", style: TextStyle(color: Colors.white, fontSize: 16)),
                        Text("284 Boncycle, FL 32328", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.notifications, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.white24,
                          child: Icon(Icons.shopping_cart, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    final List<String> images = [
      "assets/images/Cleaning.png",
      "assets/images/Plumbing.png",
      "assets/images/Laundry.png",
      "assets/images/Truck.png",
      "assets/images/Vector.png",
      "assets/images/Cleaning.png",
      "assets/images/Plumbing.png",
      "assets/images/Laundry.png",
      "assets/images/Truck.png",
      "assets/images/Vector.png",
    ];

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: images.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _buildServiceItem(images[index]);
        },
      ),
    );
  }

  Widget _buildServiceItem(String image) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(.04), blurRadius: 4),
        ],
        border: Border.all(color: Colors.blue.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(image),
      ),
    );
  }

  Widget _buildCart() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            _buildServiceCard(
              image: 'assets/images/Rectangle.png',
              rating: '4.5 · 1 hr · Painting',
              title: 'Home Cleaning Services at Miami, FL',
              price: '\$199',
              oldPrice: '\$248',
              person: 'Robert Fox',
            ),
          SizedBox(width: 20),
            _buildServiceCard(
              image: 'assets/images/HardWork.png',
              rating: '4.5 · 1 hr · Painting',
              title: 'Reliable Plumbing Quick And Efficient...',
              price: '\$250',
              oldPrice: '\$288',
              person: 'Md Mahabur Rahman',
            ),
             SizedBox(width: 20,),
            _buildServiceCard(
              image: 'assets/images/Rectangle.png',
              rating: '4.5 · 1 hr · Painting',
              title: 'Home Cleaning Services at Miami, FL',
              price: '\$199',
              oldPrice: '\$248',
              person: 'Robert Fox',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String image,
    required String rating,
    required String title,
    required String price,
    required String oldPrice,
    required String person,
  }) {
    return Container(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey, width: 0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(image, height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child:Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Icon(Icons.star, size: 14, color: Colors.orange),
                  SizedBox(width: 4),
                  Text(rating, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style:TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                  ),
                  SizedBox(width: 8),
                  Text(
                    oldPrice,
                    style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 14, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text(person, style: TextStyle(fontSize: 13, color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 5,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.withOpacity(0.2),
      ),
    );
  }

  Widget _buildSlide(){
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            height: 130,
            viewportFraction: 0.8,
            enlargeCenterPage: true
          ),
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
              Container(
                child: Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Expanded(
                            flex: 1,
                            child: Image.asset("assets/images/Worker.png",
                            fit: BoxFit.cover,
                            )),
                      ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 15),
                            child: Text("Get your roofs cleaned",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Don't let your mind stick to the ugly roofs",style: TextStyle(fontSize: 14.0,color: Colors.white.withOpacity(0.5)),),
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                              ),
                              height: 35,
                              width: 120,
                              child: Center(child: Text("Get Started",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.blueAccent),)),
                            ),
                          )
                        ],
                       ))
                    ],
                  ),
                )
              ),
        )
      ],
    );
  }

  Widget _buildProfile(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Image.asset("assets/images/Kamrul_vaia.png"),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text("4.5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 10),
                  Text("Kamrul Ibn Zaman "),
                  Text("Project Manager"),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Image.asset("assets/images/Mahabur.png"),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text("4.5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Mahabur Rahman"),
                  Text("Junior Flutter De.",),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Image.asset("assets/images/Abir_vaia.png"),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text("4.5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Abir Hasan Utsho"),
                  Text("Project Manager"),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Image.asset("assets/images/Kamrul_vaia.png"),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text("4.5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Kamrul Ibn Zaman "),
                  Text("Project Manager"),
                ],
              ),
            ),
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Image.asset("assets/images/Mahabur.png"),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text("4.5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Mahabur Rahman"),
                  Text("Junior Flutter De.",),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              height: 150,
              width: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        child: Image.asset("assets/images/Abir_vaia.png"),
                      ),
                      Positioned(
                        bottom: -6,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 14, color: Colors.white),
                              const SizedBox(width: 2),
                              Text("4.5"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Abir Hasan Utsho"),
                  Text("Project Manager"),
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }

  Widget _buildFooter(){
     return Column(
         children: [
           Center(child: Image.asset("assets/images/image1.png")),
           SizedBox(height: 20),
           Text(
             "Post a Job",
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
           ),
           SizedBox(height: 8),
           Text(
             "Didn't find what you're looking for?",
             textAlign: TextAlign.center,
             style: TextStyle(fontSize: 14, color: Colors.grey),
           ),
           SizedBox(height: 20),
           Padding(
             padding: const EdgeInsets.only(left: 20, right: 20),
             child: Container(
               height: 50,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 color: Colors.blue[700],
                 borderRadius: BorderRadius.circular(12),
               ),
               child: Center(
                 child: Text(
                   "Post a job",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                       color: Colors.white
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: 20,)
         ],
     );
  }
}