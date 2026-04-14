import 'dart:math';
import 'vehiculo.dart'; // HERENCIA

class Bus extends vehiculo { // Bus hereda de vehiculo
  // ATRIBUTO PROPIO NO HEREDADO
  int capacidadPasajeros;

  // CONSTRUCTOR DE LA CLASE HIJA
  Bus({
    required String marca,
    required String modelo,
    required this.capacidadPasajeros,
  }) : super(marca: marca, modelo: modelo); // super (CONSTRUCTOR DE LA CLASE PADRE)

  // POLIMORFISMO
  @override
  void iniciarRuta() { // (CÓMO LO VA A HACER)
    print('''
      El bus marca: $marca, modelo: $modelo,
      inició su ruta PREDETERMINADA con una capacidad máxima
      de $capacidadPasajeros pasajeros
      KILOMETRAJE ACTUAL: $kilometraje
    ''');
  }
}

class Minivan extends vehiculo { // Minivan hereda de vehiculo
  // ATRIBUTO PROPIO NO HEREDADO
  String tipoTraccion;

  // CONSTRUCTOR DE LA CLASE HIJA
  Minivan({
    required String marca,
    required String modelo,
    required this.tipoTraccion,
  }) : super(marca: marca, modelo: modelo); // super (CONSTRUCTOR DE LA CLASE PADRE)
  
  // POLIMORFISMO
  @override
  void iniciarRuta() { // (CÓMO LO VA A HACER)
    print('''
      La minivan marca: $marca, modelo: $modelo
      inició su ruta EXPRESS, destacando su tracción $tipoTraccion
      KILOMETRAJE ACTUAL: $kilometraje
    ''');
  }
}

void main() {
  List<vehiculo> vehiculosRuta = [
    Bus(marca: "Scania", modelo: "113", capacidadPasajeros: 45),
    Minivan(marca: "Nissan", modelo: "Terrano", tipoTraccion: "4x4"),
  ];

  print("---INICIANDO OPERACIONES DE RUTA---");

  for (var vehiculo in vehiculosRuta) {
    double distancia = Random().nextDouble() * 100;
    vehiculo.registrarViaje(distancia); 

    vehiculo.iniciarRuta(); // (cada vehículo sabe COMO iniciar ruta)
  }
}
