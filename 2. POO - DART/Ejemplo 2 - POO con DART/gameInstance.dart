import 'game.dart';

class Guerrero extends Personaje {
  int fuerza;

  Guerrero({required String nombre, required this.fuerza})
    : super(nombre: nombre);

  @override
  void atacar() {
    print('''
      El guerrero  $nombre, ataca con su espada
      Daño: $fuerza
    ''');
  }
}

class Mago extends Personaje with Curador {
  int PoderMagico;
  int puntosCuracion;

  Mago({
    required String nombre,
    required this.PoderMagico,
    required this.puntosCuracion,
  }) : super(nombre: nombre);

  @override
  void atacar() {
    print('''
      El Mago  $nombre, ataca lanzando una bola de fuego
      Daño: $PoderMagico
    ''');
  }
}

void main() {
  List<Personaje> equipo = [
    Guerrero(nombre: "Arthur", fuerza: 5),
    Mago(nombre: "Merlín", PoderMagico: 4, puntosCuracion: 1),
    Guerrero(nombre: "Pancho", fuerza: 7),
  ];

  print("=== INICIA EL COMBATE ===");

  for (var heroe in equipo) {
    if (heroe.estaVivo()) {
      heroe.atacar();

      if (heroe is Mago) heroe.curar(heroe, heroe.puntosCuracion);
    }
  }

  print("-" * 30);

  print("=== TURNO DEL ENEMIGO ===");

  // SIMULAMOS QUE UN ENEMIGO ATACA A PANCHO (indice 2 en la lista)
  equipo[2].recibirDano(cantidad: 6);

  print(
    "Pancho sigue vivo?\n${equipo[2].estaVivo() ? "Si" : "No, murió en combate"}"
  );
}
