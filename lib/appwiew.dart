import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DestinationCarrousel extends StatefulWidget {
  const DestinationCarrousel({super.key});

  @override
  State<DestinationCarrousel> createState() => _DestinationCarrouselState();
}

final List<String> images = [
  'assets/images/a1.png',
  'assets/images/a2.png',
  'assets/images/a3.png',
  'assets/images/a4.png',
];

final List<String> categories = [
  'Telefon',
  'Bilgisayar',
  'Playstation',
  'Aksesuar',
];


final Map<String, List<Map<String, dynamic>>> categoryProducts = {
  'Telefon': [
    {
      'name': 'OPPO',
      'price': '19999.99 TL',
      'image': 'assets/images/oppo.png',
    },
    {
      'name': 'POCO',
      'price': '27999.99 TL',
      'image': 'assets/images/poco.png',
    },
    {
      'name': 'SAMSUNG',
      'price': '25999.99 TL',
      'image': 'assets/images/samsung.png',
    },
    {
      'name': 'Iphone',
      'price': '35999.99 TL',
      'image': 'assets/images/iphone.jpg',
    },
  ],
  'Bilgisayar': [
    {
      'name': 'Asus Tuf',
      'price': '14999.99 TL',
      'image': 'assets/images/asustuf.jpeg',
    },
    {
      'name': 'Asus Zen',
      'price': '19999.99 TL',
      'image': 'assets/images/asuszen.png',
    },
    {
      'name': 'Macbook Apple',
      'price': '24999.99 TL',
      'image': 'assets/images/macbook.jpeg',
    },
    {
      'name': 'HP VİCTUS',
      'price': '35999.99 TL',
      'image': 'assets/images/victus.jpg',
    },
  ],
  'Playstation': [
    {
      'name': 'PS5 Konsol',
      'price': '25999.99 TL',
      'image': 'assets/images/ps5.jpeg',
    },
    {
      'name': 'PS4 Konsol',
      'price': '12999.99 TL',
      'image': 'assets/images/ps4.jpg',
    },
    {
      'name': 'PS4 Pro Konsol',
      'price': '12999.99 TL',
      'image': 'assets/images/ps4.jpg',
    },
    {
      'name': 'Ea Fc 25',
      'price': '1999.99 TL',
      'image': 'assets/images/eafc25.jpeg',
    },
    {
      'name': 'Call of Duty Modern Warfare 2',
      'price': '1999.99 TL',
      'image': 'assets/images/mw2.jpg',
    },
  ],
  'Aksesuar': [
    {
      'name': 'Kulaklik',
      'price': '999.99 TL',
      'image': 'assets/images/havitkulaklik.jpeg',
    },
    {
      'name': 'Mouse',
      'price': '499.99 TL',
      'image': 'assets/images/mouse.jpg',
    },
    {
      'name': 'Klavye',
      'price': '799.99 TL',
      'image': 'assets/images/klavye.png',
    },
  ],
};

class _DestinationCarrouselState extends State<DestinationCarrousel> {
  int _selectedIndex = 0;
  String _selectedCategory = categories[0]; 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onCategoryTapped(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _goToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sepete Gidiliyor')),
    );
    
  }

  List<Widget> generateImagesTiles() {
    return images.map((image) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: 130.0,
          width: 300.0,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Carousel asset yükleme hatası: $image - $error');
            return const Center(
              child: Icon(Icons.error, color: Colors.red, size: 40.0),
            );
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = categoryProducts[_selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
         title: Padding(
         padding: const EdgeInsets.only(right: 18.0),
         child: Image.asset(
        "assets/images/teknomarktlogo.png",
        height: 60,
        width: MediaQuery.of(context).size.width,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    centerTitle: false, // Sola hizalamak için
    leading: Builder(
    builder: (context) => IconButton(
      icon: const Icon(Icons.menu, color: Color(0xFFE74C3C)),
      onPressed: () => Scaffold.of(context).openDrawer(),
    ),
  ),
),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFE74C3C),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/teknomarktlogo.png",
                    height: 60,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'TeknoMarkt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFFE74C3C)),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Color(0xFFE74C3C)),
              title: const Text('Kategoriler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Color(0xFFE74C3C)),
              title: const Text('Favoriler'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFFE74C3C)),
              title: const Text('Profil'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Color(0xFFE74C3C)),
              title: const Text('Sepet'),
              onTap: () {
                Navigator.pop(context);
                _goToCart();
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFFECF0F1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CarouselSlider(
                items: generateImagesTiles(),
                options: CarouselOptions(
                  height: 250.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (selected) {
                          if (selected) {
                            _onCategoryTapped(category);
                          }
                        },
                        selectedColor: const Color(0xFFE74C3C),
                        backgroundColor: Colors.white,
                        labelStyle: TextStyle(
                          color: _selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Color(0xFFE74C3C)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '$_selectedCategory Ürünleri',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE74C3C),
                ),
              ),
            ),
            SizedBox(
              height: 240.0,
              child: products.isEmpty
                  ? const Center(child: Text('Bu kategoride ürün bulunmamaktadır.'))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Container(
                          width: 160.0,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Card(
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0),
                                  ),
                                  child: product['image'].isEmpty
                                      ? const Center(
                                          child: Icon(Icons.broken_image, color: Colors.grey, size: 40.0),
                                        )
                                      : Image.asset(
                                          product['image'],
                                          fit: BoxFit.contain,
                                          height: 100.0,
                                          width: double.infinity,
                                          errorBuilder: (context, error, stackTrace) {
                                            debugPrint('Asset yükleme hatası: ${product['image']} - $error');
                                            return const Center(
                                              child: Icon(Icons.error, color: Colors.red, size: 40.0),
                                            );
                                          },
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product['name'],
                                        style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        product['price'],
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xFFE74C3C),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('${product['name']} sepete eklendi!'),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFFE74C3C),
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            minimumSize: const Size(100, 30),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          child: const Text(
                                            'Sepete Ekle',
                                            style: TextStyle(fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCart,
        backgroundColor: const Color(0xFFE74C3C),
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
            backgroundColor: Color(0xFFE74C3C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Ara',
            backgroundColor: Color(0xFFE74C3C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriler',
            backgroundColor: Color(0xFFE74C3C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
            backgroundColor: Color(0xFFE74C3C),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: const Color(0xFFE74C3C),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        showUnselectedLabels: true,
        elevation: 8.0,
      ),
    );
  }
}