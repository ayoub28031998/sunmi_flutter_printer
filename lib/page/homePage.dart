import 'dart:math';
import 'package:flutter/material.dart';
import 'package:StubSoft/widgets/HomeAppBar.dart';
import 'package:StubSoft/widgets/CategorieWidhet.dart';
import 'package:StubSoft/widgets/ItemWidgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:StubSoft/Models/FamilleArticleDTO.dart';
import 'package:StubSoft/Models/ArticleDTO.dart';
import 'package:StubSoft/Models/CartItem.dart';
import 'package:StubSoft/controller/FamilleArticleController.dart';
import 'package:StubSoft/controller/ArticleControler.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cartPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  late PageController _pageController;
  int _currentIndex = 0;
  List<ArticleDTO> listeArticle = [];
  List<FamilleArticleDTO> listeFamilleArticle = [];
  bool dataLoaded = false;
  String selectedCategory = "11";
  List<CartItem> cartItems = []; // List to store items in the cart
  int panierCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<int> getPanierCount() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('panier') ?? 0;
  }

  void fetchData() async {
    listeArticle = await ArticleControler().getArticleByCodeFamille("11", true);
    listeFamilleArticle = await FamilleArticleController().getFamilleArticle();

    setState(() {
      dataLoaded = true;
    });
  }

  void updatePanierCountInPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('panier', panierCount);
  }

  void onItemRemoved() {
    setState(() {
      panierCount = cartItems.length;
    });
    updatePanierCountInPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildHomePageContent(),
          Container(
            color: Colors.blue,
            child: CartPage(
              cartItems: cartItems,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.shopping_cart_checkout, size: 30, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildHomePageContent() {
    return FutureBuilder<int>(
      future: getPanierCount(),
      builder: (context, snapshot) {
        panierCount = snapshot.data ?? 0;
        return ListView(
          children: [
            HomeAppBar(panierCount: cartItems.length),
            Container(
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 50,
                          width: 250,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search_outlined,
                          size: 27,
                          color: Color(0xFF4C53A5),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: dataLoaded
                          ? List.generate(
                        listeFamilleArticle.length,
                            (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory =
                                  listeFamilleArticle[index].CodeFamille;
                            });
                          },
                          child: CategoriesWidget(
                            listeFamilleArticle[index].Libelle,
                            isActive: selectedCategory ==
                                listeFamilleArticle[index].CodeFamille,
                          ),
                        ),
                      )
                          : [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      "Products",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                  ),
                  GetBuilder<ArticleControler>(
                    init: ArticleControler(),
                    builder: (value) {
                      return FutureBuilder<List<ArticleDTO>>(
                        future: value.getArticleByCodeFamille(
                            selectedCategory, true),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print("${snapshot.error}");
                            return const Text('error');
                          } else if (snapshot.hasData) {
                            final article = snapshot.data!;
                            return GridView.builder(
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                              ),
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: article.length,
                              itemBuilder: (context, index) => ItemWidget(
                                article[index].logo,
                                article[index].designation,
                                article[index].prixVenteTtc,
                                onClick: () async {
                                  prefs = await SharedPreferences.getInstance();
                                  setState(() {
                                    prefs.setBool('Selected$index', true);
                                    int existingIndex = cartItems.indexWhere((item) =>
                                    item.designation == article[index].designation &&
                                        item.prixVenteTtc == article[index].prixVenteTtc);

                                    if (existingIndex != -1) {
                                      // Si l'article existe déjà, incrémente la quantité
                                      cartItems[existingIndex].qte++;
                                    } else {
                                      // Sinon, ajoute un nouvel élément avec qte = 1
                                      cartItems.add(
                                        CartItem(
                                          logo: article[index].logo.toString(),
                                          designation: article[index].designation,
                                          prixVenteTtc: article[index].prixVenteTtc,
                                          qte: 1,
                                          codeArticle: article[index].codeArticle,
                                        ),
                                      );
                                    }

                                    SnackBar snackBar = const SnackBar(
                                      content: Text('Product added to the cart'),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  });
                                },

                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
