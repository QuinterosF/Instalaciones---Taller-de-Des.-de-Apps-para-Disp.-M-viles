# 3. ESTRUCTURAS DE DATOS

Las estructuras de datos son colecciones que permiten agrupar múltiples valores bajo una sola entidad, facilitando su administración, búsqueda y manipulación. Dart ofrece tres estructuras fundamentales: Listas, Sets y Mapas.

## 3.1. Listas (`List`)
Una **Lista** es una colección ordenada de objetos donde cada elemento tiene una posición específica (índice), comenzando desde el 0. Las listas permiten almacenar elementos duplicados y pueden ser de tipo dinámico o restringidas a un tipo de dato específico.

```dart
void main() {
  // Lista con tipos de datos mixtos (dynamic)
  var diversos = ["texto", 100, 3.5, true, null];
  print(diversos);

  // Lista tipada (solo permite Strings)
  List<String> estudiantes = ["Carla", "Roberto", "Raúl"];
  print(estudiantes);

  // Acceso a un elemento por su índice (posición 1)
  print(estudiantes[1]); // Resultado: Roberto

  // Modificación de la lista
  estudiantes.add("Elena");        // Añadir elemento al final
  estudiantes.remove("Carla");     // Eliminar por valor
  estudiantes.removeAt(0);         // Eliminar por índice
  
  print(estudiantes);
}
```

## 3.2. Sets (`Set`)
Un **Set** es una colección de elementos donde cada valor es único; no se permiten duplicados. A diferencia de las listas, los sets no garantizan un orden específico de los elementos, pero son mucho más eficientes para verificar si un elemento existe en la colección.

```dart
void main() {
  // Definición de un Set de números enteros
  Set<int> naturales = {1, 2, 3, 4, 5};
  
  // Intentar añadir un duplicado (no tendrá efecto)
  naturales.add(2); 
  
  // Operaciones específicas de conjuntos
  Set<int> otros = {4, 5, 6, 7};
  
  print(naturales.intersection(otros)); // Elementos comunes: {4, 5}
  print(naturales.union(otros));        // Combinación de ambos: {1, 2, 3, 4, 5, 6, 7}
  
  // Eliminar un elemento
  naturales.remove(1);
}
```

## 3.3. Mapas (`Map`)
Un **Mapa** es un objeto que asocia **llaves** (keys) con **valores** (values). Tanto las llaves como los valores pueden ser de cualquier tipo de objeto. Cada llave debe ser única, pero los valores pueden repetirse.

```dart
void main() {
  // Mapa de tipo <int, String>
  Map<int, String> diccionario = {
    1: "Iniciando",
    2: "Procesando",
    3: "Finalizado"
  };

  // Acceder a un valor mediante su llave
  print(diccionario[2]); // Resultado: Procesando

  // Agregar una nueva entrada al mapa
  diccionario[4] = "Error";

  // Eliminar una entrada usando la llave
  diccionario.remove(1);

  // Propiedad útil para conocer el tamaño
  print("Tamaño del mapa: ${diccionario.length}");
}
```
