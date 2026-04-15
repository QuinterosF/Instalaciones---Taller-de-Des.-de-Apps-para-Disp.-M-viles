// device_templates.dart

abstract class DispositivoInteligente {
  String nombre;
  
  // Encapsulamiento: El estado de encendido es privado
  bool _estaEncendido = false; 

  // Constructor con parámetros nombrados requeridos
  DispositivoInteligente({required this.nombre});

  // Métodos seguros para alterar el estado interno
  void encender() {
    _estaEncendido = true;
    print("[$nombre] ha sido ENCENDIDO.");
  }

  void apagar() {
    _estaEncendido = false;
    print("[$nombre] ha sido APAGADO.");
  }

  // Getter para leer el estado sin poder modificarlo directamente
  bool get estaEncendido => _estaEncendido;

  // Abstracción: Firma del método obligatorio
  void operar();
}

mixin ConexionWiFi {
  // Método del mixin usando parámetros nombrados
  void emparejarRed({required String red, required String nombreDispositivo}) {
    print("[WiFi] El dispositivo '$nombreDispositivo' se emparejó exitosamente a la red: $red");
  }
}
