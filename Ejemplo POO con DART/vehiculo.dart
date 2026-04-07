// ABSTRACCIÓN
abstract class vehiculo {
  //ATRIBUTOS
  String marca; //público
  String modelo; //público 
  double _kilometraje = 0; //privado

  //CONSTRUCTOR
  vehiculo({required this.marca, required this.modelo});

  // ENCAPSULAMIENTO (GETTERS Y SETTERS)
  // SET _kilometraje
  void registrarViaje(double distancia) {
    _kilometraje += distancia;
  }

  // GET _kilometraje
  double get kilometraje {
    return _kilometraje;
  }

  // POLIMORFISMO
  void iniciarRuta(); // firma (QUÉ VA A HACER)
}
