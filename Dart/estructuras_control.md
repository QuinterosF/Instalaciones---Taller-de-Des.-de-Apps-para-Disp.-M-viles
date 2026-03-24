# 4. ESTRUCTURAS DE CONTROL

Las estructuras de control permiten romper la ejecución lineal de un programa, otorgando la capacidad de tomar decisiones lógicas o repetir procesos de manera eficiente según las condiciones del entorno.

## 4.1. Sentencia `if` / `else`
Es la estructura de decisión más básica. Evalúa una expresión booleana y ejecuta un bloque de código si el resultado es `true`. Se puede añadir un bloque `else` para manejar el escenario contrario.

```dart
void main() {
  int puntaje = 85;

  if (puntaje >= 90) {
    print("Excelente desempeño");
  } else if (puntaje >= 70) {
    print("Aprobado");
  } else {
    print("Reprobado");
  }
}
```

## 4.2. Ciclo `for`
El ciclo `for` es ideal cuando conocemos de antemano cuántas veces queremos ejecutar una instrucción. En Dart, es común usar la variante `for-in` para recorrer colecciones como las listas.

```dart
void main() {
  var ciudades = ["La Paz", "Potosí", "Santa Cruz", "Oruro"];
  
  // Recorrido simplificado de una lista
  for (var ciudad in ciudades) {
    print("Visitando: $ciudad");
  }
}
```

## 4.3. Ciclo `while`
Esta estructura repite un bloque de código mientras una condición específica se mantenga como verdadera. Es fundamental asegurar que la condición cambie en algún punto para evitar bucles infinitos.

```dart
void main() {
  int contador = 1;
  
  while (contador <= 3) {
    print("Intento número: $contador");
    contador++;
  }
}
```

## 4.4. Sentencia `switch`
El `switch` es una forma elegante de evaluar una variable frente a múltiples casos posibles. Es especialmente útil cuando se trabaja con valores discretos (como enteros o cadenas).

```dart
import 'dart:math';

void main() {
  // Generamos un número aleatorio entre 0 y 3
  int opcion = Random().nextInt(4);

  switch (opcion) {
    case 0:
      print("Seleccionaste la opción inicial");
    case 1:
      print("Seleccionaste la opción intermedia");
    case 2:
      print("Seleccionaste la opción avanzada");
    default:
      print("Opción no reconocida"); // Se ejecuta si no coincide con los anteriores
  }
}
```
