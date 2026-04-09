# 1. TIPOS DE DATOS

En el desarrollo móvil con Dart, comprender los tipos de datos es el primer paso fundamental para estructurar la información en la memoria. Dart es un lenguaje con tipado estático opcional e inferencia de tipos, lo que aporta seguridad y flexibilidad al código.

A continuación, se detallan los tipos de datos fundamentales:

## 1.1. Cadenas de texto (`String`)
Las cadenas de texto (o *strings*) representan secuencias de caracteres. Se utilizan de manera general para almacenar y manipular texto. En Dart, se pueden definir utilizando comillas simples o dobles, lo cual facilita la inclusión de unas dentro de otras si fuera necesario.

```dart
void main() {
  String nombre = "Lucía";
  String apellido = 'Mendoza';
  
  print(nombre);
  print(apellido);
}
```

## 1.2. Números (`int` y `double`)
Dart maneja los datos numéricos principalmente a través de dos tipos:
* **`int`**: Representa valores enteros, es decir, números sin parte fraccionaria.
* **`double`**: Representa números de punto flotante o decimales.

El lenguaje también proporciona librerías integradas como `dart:math` que facilitan la generación y manipulación de estos valores:

```dart
import 'dart:math';

void main() {
  // Generar un número decimal aleatorio entre 0.0 y 1.0
  double valorDecimal = Random().nextDouble();
  print(valorDecimal);

  // Generar un número entero aleatorio entre 0 y 3
  int caso = Random().nextInt(4);
  print(caso);
}
```

## 1.3. Booleanos (`bool`)
El tipo de dato booleano es binario y solo puede contener uno de dos valores lógicos: `true` (verdadero) o `false` (falso). Estos valores son la piedra angular de las estructuras de control lógico y la toma de decisiones dentro del algoritmo.

```dart
import 'dart:math';

void main() {
  // Generar un valor booleano aleatorio (true o false)
  bool estadoLogico = Random().nextBool();
  print(estadoLogico);
}
```

## 1.4. Nulos (`null`)
En el contexto de la programación, `null` representa la ausencia de un valor. Por defecto, Dart implementa "seguridad nula" (*Sound Null Safety*), lo que significa que las variables no pueden contener un valor nulo a menos que el programador lo declare explícitamente.

Para indicar que un tipo de dato puede aceptar un valor nulo, se debe añadir un signo de interrogación (`?`) a su declaración.

```dart
void main() {
  // Variable que NO puede ser nula (arrojará error si no se inicializa antes de usarse)
  String ciudad = "Cochabamba";
  
  // Variable que SÍ puede ser nula
  String? direccion = null;
  
  print(ciudad);
  print(direccion);
}
```
