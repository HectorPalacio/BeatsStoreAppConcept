import 'package:beats_store_concept/src/models/producto_model.dart';
import 'package:beats_store_concept/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosProv = Provider.of<ProductosProvider>(context);

    return Container(
      width: double.infinity,
      height: 460.0,
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: PageController(viewportFraction: 0.8),
        // children: [
        //   _Card(),
        //   _Card(),
        // ],
        children: productosProv.productos.map((e) => _Card(e)).toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final ProductoModel prod;
  _Card(this.prod);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            children: [
              _PrimeraDescripcion(prod),
              SizedBox(width: 55.0),
              _TarjetaDescripcion(prod),
            ],
          ),
          Positioned(
            top: 90,
            left: 50,
            child: Image(image: AssetImage('assets/${prod.url}')),
            width: 160.0,
          ),
        ],
      ),
    );
  }
}

class _PrimeraDescripcion extends StatelessWidget {
  final ProductoModel prod;
  _PrimeraDescripcion(this.prod);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.batteryFull, size: 15),
            SizedBox(width: 10.0),
            Text(
              '${prod.bateria}-Hour Battery',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(width: 30.0),
            Icon(FontAwesomeIcons.wifi, size: 15),
            SizedBox(width: 10.0),
            Text(
              'Wireless',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _TarjetaDescripcion extends StatelessWidget {
  final ProductoModel prod;
  _TarjetaDescripcion(this.prod);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: size.width * 0.55,
          height: 340.0,
          color: Color(prod.color),
          child: Column(
            children: [
              SizedBox(height: 25.0),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      prod.titulo,
                      style: TextStyle(
                          color: Colors.white24,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prod.subtitulo,
                      style: TextStyle(
                          color: Colors.white24,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      prod.nombre,
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      '\$${prod.precio}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: 80,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        'Add to bag',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    width: 120.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
