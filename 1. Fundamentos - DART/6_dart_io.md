# Guía de Aprendizaje: Entrada y Salida de Datos por Consola en Dart

Para que una aplicación sea interactiva, necesita recibir información del usuario y mostrar resultados. En Dart, esto se logra utilizando la librería `dart:io`. En esta guía, aprenderás a capturar texto, números enteros y decimales, y a verificar que los tipos de datos sean los correctos.

---

## 1. Importación de Librería y Salida de Datos
Para manejar la entrada y salida de archivos o consola, lo primero es importar `dart:io`. A diferencia de `print()`, que añade un salto de línea automático, usaremos `stdout.write()` para mantener el cursor en la misma línea cuando pidamos un dato.

Escribe este bloque inicial para configurar la librería y pedir el primer dato:

```dart
import 'dart:io'; // Librería necesaria para stdin y stdout

void main() {
  // stdout.write permite mostrar un mensaje sin salto de línea
  stdout.write("Nombre: ");

  // stdin.readLineSync() lee lo que el usuario escribe como String
  // El signo '!' asegura que el valor no será nulo
  String nombre = stdin.readLineSync()!;

  print("Cargando nombre...");
}
```

## 2. Captura de Números (Conversión de tipos)
Por defecto, todo lo que se recibe por `stdin.readLineSync()` es un texto (`String`). Si necesitamos realizar cálculos o guardar edades, debemos convertir ese texto a un número (`int` o `double`) usando el método `.parse()`.

Añade la captura de edad y altura a tu código:

```dart
// (Continuación dentro del main)

  stdout.write("Edad: ");
  // int.parse convierte el String ingresado a un número entero
  int edad = int.parse(stdin.readLineSync()!);

  stdout.write("Altura (m): ");
  // double.parse convierte el String ingresado a un número decimal
  double altura = double.parse(stdin.readLineSync()!);
```

## 3. Interpolación de Cadenas y Salida de Resultados
Una vez capturados los datos, los mostramos usando la **interpolación de variables** (`$variable`). Esto nos permite insertar valores directamente dentro de un texto.

Añade este bloque para mostrar el resumen al usuario:

```dart
// (Continuación dentro del main)

  print(
    "\nHola $nombre, tu edad es de $edad años y tu altura es de $altura metros.",
  );
```

## 4. Verificación de Tipos de Datos
Para asegurar que las conversiones (parsing) se realizaron correctamente, podemos usar la propiedad `.runtimeType`. Esto le indica a Dart que nos diga qué tipo de dato tiene la variable en tiempo de ejecución.

Finaliza tu código con estas líneas de diagnóstico:

```dart
// (Continuación final del main)

  print("\n--- Diagnóstico de tipos ---");
  print("nombre es de tipo ${nombre.runtimeType}");
  print("edad es de tipo ${edad.runtimeType}");
  print("altura es de tipo ${altura.runtimeType}");
}
```

---

## Conceptos Clave

1.  **`stdin.readLineSync()!`**: Detiene la ejecución del programa hasta que el usuario presiona "Enter". El operador `!` se usa porque el método podría devolver un valor nulo, y le confirmamos a Dart que estamos seguros de que habrá un valor.
2.  **`int.parse()` / `double.parse()`**: Son funciones de "Casting" o conversión. Si el usuario ingresa una letra cuando se espera un número, el programa lanzará un error (excepción).
3.  **`stdout.write()`**: Útil para crear formularios en consola donde la respuesta aparece justo al lado de la pregunta.
4.  **`${variable.runtimeType}`**: Una herramienta de depuración muy útil para verificar que nuestras variables son del tipo que esperamos (String, int, double, etc.).

---

## 💻 Código completo
```dart
import 'dart:io';

void main() {
  stdout.write("Nombre: ");
  String nombre = stdin.readLineSync()!;

  stdout.write("Edad: ");
  int edad = int.parse(stdin.readLineSync()!);

  stdout.write("Altura (m): ");
  double altura = double.parse(stdin.readLineSync()!);

  print(
    "Hola $nombre, tu edad es de $edad años y tu altura es de $altura metros.",
  );

  print("nombre es de tipo ${nombre.runtimeType}");
  print("edad es de tipo ${edad.runtimeType}");
  print("altura es de tipo ${altura.runtimeType}");
}

```
