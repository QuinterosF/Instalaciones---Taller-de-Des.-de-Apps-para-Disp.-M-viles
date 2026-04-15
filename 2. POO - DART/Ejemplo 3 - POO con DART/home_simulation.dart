// home_simulation.dart
import 'device_templates.dart';

// Herencia simple
class FocoInteligente extends DispositivoInteligente {
  String color;

  FocoInteligente({required String nombre, required this.color}) 
    : super(nombre: nombre);

  @override
  void operar() {
    print("El foco '$nombre' está iluminando la habitación en color $color.");
  }
}

// Herencia + Mixin
class AltavozInteligente extends DispositivoInteligente with ConexionWiFi {
  int volumenMaximo;

  AltavozInteligente({required String nombre, required this.volumenMaximo}) 
    : super(nombre: nombre);

  @override
  void operar() {
    print("El altavoz '$nombre' está reproduciendo música a nivel $volumenMaximo.");
  }
}

void main() {
  // 1. Estructura de Datos: Lista polimórfica de dispositivos
  List<DispositivoInteligente> miCasa = [
    FocoInteligente(nombre: "Luz Sala Principal", color: "Blanco Cálido"),
    AltavozInteligente(nombre: "Alexa Cocina", volumenMaximo: 80),
    FocoInteligente(nombre: "Lámpara de Noche", color: "Azul Tenue"),
  ];

  print("=== INICIANDO RUTINA DE BUENAS NOCHES ===");

  // 2. Control de Flujo: Recorriendo la lista
  for (var dispositivo in miCasa) {
    
    // Encendemos todos los dispositivos genéricamente
    dispositivo.encender();

    // Verificación de tipo y uso del Mixin
    if (dispositivo is AltavozInteligente) {
      // Como Dart sabe que es un AltavozInteligente, tenemos acceso al método del mixin
      dispositivo.emparejarRed(
        red: "Familia_Perez_5G", 
        nombreDispositivo: dispositivo.nombre
      );
    }

    // Polimorfismo: Cada quien opera a su manera, solo si está encendido
    if (dispositivo.estaEncendido) {
      dispositivo.operar();
    }
    
    print("-" * 40);
  }

  print("=== APAGANDO LA CASA ===");
  // Simulación de apagar un solo dispositivo específico
  miCasa[0].apagar();
}
