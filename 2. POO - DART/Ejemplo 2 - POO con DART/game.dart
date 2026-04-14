abstract class Personaje {
  int _puntosVida = 100;
  String nombre;

  Personaje({required this.nombre});

  void recibirDano({required int cantidad}) {
    _puntosVida -= cantidad;

    if (_puntosVida < 0) _puntosVida = 0;

    print(
      "$nombre recibe $cantidad puntos de daño. Vida restante: $_puntosVida",
    );
  }

  bool estaVivo() {
    return _puntosVida > 0;
  }

  void atacar();

  set puntosVida(int value) {
    _puntosVida += value;
  }
}

mixin Curador {
  void curar(Personaje heroe, int puntosCuracion) {
    print("Curación!, Restaurando puntos de vida...");
    heroe.puntosVida = puntosCuracion;
  }
}
