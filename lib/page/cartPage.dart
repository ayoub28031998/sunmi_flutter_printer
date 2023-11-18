import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:StubSoft/widgets/CartAppBar.dart';
import 'package:StubSoft/Models/CartItem.dart';
import '../Models/CommandeMobile.dart';
import '../controller/CartController.dart';
import '../controller/CommandeMobileController.dart';
import '../sunmi.dart';

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;
  CartPage({required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();


}

class _CartPageState extends State<CartPage> {


  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    for (var item in widget.cartItems) {
      totalPrice =totalPrice + item.prixVenteTtc * item.qte;
    }
    return Scaffold(
      body: Column(
        children: [
          // Votre contenu existant
          CartAppBar(),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 70),
              height: 700,
              decoration: BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Dismissible(
                      key: UniqueKey(),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmer la suppression"),
                              content: Text("Êtes-vous sûr de vouloir supprimer cet article ?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false); // Annuler la suppression
                                  },
                                  child: Text("Annuler"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true); // Confirmer la suppression
                                  },
                                  child: Text("Supprimer"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (direction) {
                        // Supprimer l'article si la suppression est confirmée
                        if (direction == DismissDirection.horizontal) {
                          setState(() {
                            widget.cartItems.removeAt(index);
                          });
                        }
                      },
                      direction: DismissDirection.horizontal,

                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: GestureDetector(

                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              widget.cartItems[index].designation,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Prix: ${widget.cartItems[index].prixVenteTtc} TND',
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: widget.cartItems[index].qte > 1
                                            ? () {
                                          setState(() {
                                            // Décrémenter la quantité
                                            widget.cartItems[index].qte--;
                                          });
                                        }
                                            : null, // Désactiver si qte = 1
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(8),
                                          minimumSize: Size(20, 20),
                                          backgroundColor: widget.cartItems[index].qte > 1
                                              ? Color(0xFF4C53A5) // Couleur normale
                                              : Colors.grey, // Couleur grise pour le bouton désactivé
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 10,
                                        ),
                                      ),
                                      Text(
                                        'Quantité: ${widget.cartItems[index].qte}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            // Incrémenter la quantité
                                            widget.cartItems[index].qte++;
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.all(8),
                                          minimumSize: Size(20, 20),
                                          backgroundColor: Color(0xFF4C53A5),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Supprimer l'article de la liste cartItems
                                  widget.cartItems.removeAt(index);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(widget.cartItems[index].designation),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.delete_rounded,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () async {
              CommandeMobileController commande = CommandeMobileController();
              commande.postAccompte(widget.cartItems);
              // Faites quelque chose avec la commande retournée, si nécessaire
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF4C53A5),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text(
                'Total: $totalPrice TND',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 50,
            child: FloatingActionButton(
              onPressed: () {
                Sunmi printer = Sunmi();
                printer.printReceipt(widget.cartItems, totalPrice);
              },
              backgroundColor: Color(0xFF4C53A5),
              foregroundColor: Colors.white,
              child: Icon(Icons.print),
            ),
          ),
        ],
      ),





    );
  }
}




