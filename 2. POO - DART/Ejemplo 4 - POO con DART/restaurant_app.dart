import 'menu_templates.dart';

// Herencia y uso de Mixin
class Plato extends ElementoMenu with Promocionable {
  String categoria;

  Plato({
    required String nombre, 
    required this.categoria
  }) : super(nombre: nombre);

  @override
  void mostrarDetalle() {
    print("   PLATO: $nombre");
    print("   Categoría: $categoria | Precio: Bs. ${precio.toStringAsFixed(2)}");
  }
}

// Herencia simple
class Bebida extends ElementoMenu {
  bool esAlcoholica;
  double tamanoMl;

  Bebida({
    required String nombre, 
    required this.esAlcoholica, 
    required this.tamanoMl
  }) : super(nombre: nombre);

  @override
  void mostrarDetalle() {
    String tipo = esAlcoholica ? "Con Alcohol" : "Sin Alcohol";
    print("   BEBIDA: $nombre");
    print("   Tipo: $tipo | Tamaño: ${tamanoMl} ml | Precio: Bs. ${precio.toStringAsFixed(2)}");
  }
}

void main() {
  // 1. Estructura de Datos: Lista de elementos del menú
  List<ElementoMenu> miMenu = [
    Plato(nombre: "Planchita", categoria: "Fuerte"),
    Bebida(nombre: "Limonada", esAlcoholica: false, tamanoMl: 500),
    Plato(nombre: "Sopa de Maní", categoria: "Entrada"),
    Bebida(nombre: "Vino Tinto", esAlcoholica: true, tamanoMl: 150),
  ];

  // Asignación de precios iniciales usando el Setter
  miMenu[0].precio = 45.00;
  miMenu[1].precio = 8.00;
  miMenu[2].precio = 9.50;
  miMenu[3].precio = 35.00;

  print("=============================================");
  print("         SISTEMA DE RESTAURANTE DIGITAL      ");
  print("=============================================\n");

  // 2. Control de Flujo: Procesamiento del menú
  for (var item in miMenu) {
    
    // Verificación de tipo para aplicar lógica de Mixin
    if (item is Plato) {
      // Aplicamos un 10% de descuento solo si el item es 'Promocionable'
      item.aplicarDescuento(item, 10);
    }

    // Polimorfismo: Llamada al método mostrarDetalle
    item.mostrarDetalle();
    
    print("-" * 45);
  }

  // 3. Verificación final de estado con Operador Ternario
  print("Estado del sistema: ${miMenu.isNotEmpty ? 'Menú cargado correctamente' : 'Error: Menú vacío'}");
}
