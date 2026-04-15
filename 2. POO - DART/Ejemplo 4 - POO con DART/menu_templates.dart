abstract class ElementoMenu {
  String nombre;
  
  // Encapsulamiento: El precio base es privado para proteger el dato.
  double _precioBase = 0.0;

  // Constructor con parámetros nombrados requeridos
  ElementoMenu({required this.nombre});

  // Getter para obtener el precio de forma segura
  double get precio => _precioBase;

  // Setter para asignar o modificar el precio con validación
  set precio(double valor) {
    if (valor >= 0) {
      _precioBase = valor;
    } else {
      print("Error: El precio no puede ser negativo.");
    }
  }

  // Abstracción: Firma del método que cada hijo debe implementar
  void mostrarDetalle();
}

// Mixin para añadir funcionalidad de descuentos solo a clases específicas
mixin Promocionable {
  void aplicarDescuento(ElementoMenu item, double porcentaje) {
    if (porcentaje > 0 && porcentaje <= 100) {
      double descuento = item.precio * (porcentaje / 100);
      item.precio = item.precio - descuento; 
      print("¡Promoción aplicada a '${item.nombre}'! Descuento del $porcentaje %");
    }
  }
}
