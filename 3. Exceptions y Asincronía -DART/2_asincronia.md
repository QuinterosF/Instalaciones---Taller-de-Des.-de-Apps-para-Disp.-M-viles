# 3.2 Programación Asíncrona (Fundamentos)

  * [**Síncrono vs Asíncrono**](#1-s%C3%ADncrono-vs-as%C3%ADncrono)
  * [**`Future`, `async` y `await`**](#2-future-async-y-await)
  * [**Manejo de Errores Asíncronos**](#3-manejo-de-errores-as%C3%ADncronos)
  * [**Simulación y código completo**](#4-simulaci%C3%B3n-y-c%C3%B3digo-completo)

En el desarrollo de aplicaciones móviles, la fluidez es ley. Si una aplicación deja de responder por apenas dos segundos mientras descarga datos, el usuario pensará que se "colgó". Para evitar esto, necesitamos entender cómo ejecutar tareas pesadas en segundo plano.

-----

## 1\. Síncrono vs Asíncrono

Imagina que tu aplicación necesita pedir datos al servidor (Tarea 1) y, al mismo tiempo, mostrar una animación de carga o "Preloader" (Tarea 2).

Si trabajáramos de forma **síncrona** usando `sleep(Duration(seconds: 2))` para simular lo que terda esta tarea, el programa se detendría por completo. Nada se movería, la pantalla no respondería y la Tarea 2 tendría que esperar minutos hasta que la Tarea 1 termine. Eso arruina la experiencia.

```dart
import 'dart:io';

void tarea_1() {
  for (int i = 1; i <= 5; i++) {
    print(i);
    sleep(Duration(seconds: 2));
  }
  print("Respuesta HTTP del servidor");
}

void tarea_2() {
  print("Mostrar Pantalla Preloader de la App");
}
```

-----

## 2\. Future, async y await

Para resolver esto, usamos **`Future`**. Un `Future` es una promesa: el código dice "voy a empezar esta tarea, pero no me esperes, sigue con lo demás".

  * **`async`**: Marca una función como asíncrona.
  * **`await`**: Se usa dentro de la función para esperar el resultado de un `Future` sin detener el resto del sistema.

Observa cómo en este código, la **Tarea 2** se ejecuta inmediatamente, aunque la **Tarea 1** esté "trabajando" en sus ciclos de espera:

```dart
Future<void> tarea_1() async {
  for (int i = 1; i <= 5; i++) {
    print(i);
    // await Future.delayed no bloquea la App, solo pausa esta función
    await Future.delayed(Duration(seconds: 2));
  }
  print("Respuesta HTTP del servidor");
}

void tarea_2() {
  print("Cargar pantalla Preloader de la App");
}

void main() {
  tarea_1(); // Inicia y se va a "segundo plano"
  tarea_2(); // Se ejecuta instantáneamente
}
```

-----

## 3\. Manejo de Errores Asíncronos

En el mundo real, las peticiones HTTP no siempre son exitosas. Un servidor puede estar caído o saturado, devolviendo el famoso **Error 500 (Internal Server Error)**.

Cuando trabajamos con `Futures`, debemos envolver nuestro código en un bloque `try-catch`. Si el servidor lanza un error (usando `throw`), nuestro `catch` lo atrapará para evitar que la aplicación se cierre, permitiéndonos mostrar un mensaje amigable al usuario.

```dart
Future<void> tarea_1({required bool exitosa}) async {
  try {
    // Simulamos la espera de datos
    await Future.delayed(Duration(seconds: 2));

    if (exitosa) {
      print("Respuesta HTTP exitosa. Mostrar App.");
    } else {
      // Simulamos un fallo del servidor
      throw "ERROR 500"; 
    }
  } catch (err) {
    print("Intente de nuevo más tarde. Error: $err");
  }
}
```

-----

## 4\. Simulación y código completo

Aquí tienes el código unificado que puedes agregar a tu repositorio. Este ejemplo demuestra cómo el flujo asíncrono permite que la interfaz (Tarea 2) aparezca mientras la lógica de datos (Tarea 1) gestiona el éxito o el fracaso del servidor.

```dart
// Tarea 1: Simula una petición HTTP pesada al servidor.
// Recibe un parámetro para simular éxito o fallo (Error 500).
Future<void> tarea_1({required bool exitosa}) async {
  print("Tarea 1: Iniciando petición al servidor...");

  try {
    // Simulamos un proceso de carga de 5 pasos (ej. descarga de archivos)
    for (int i = 1; i <= 5; i++) {
      print("  Descargando datos... paso $i");
      await Future.delayed(Duration(seconds: 1));
    }

    if (exitosa) {
      print(
        "Respuesta HTTP del servidor: 200 OK. Mostrando contenido de la App.",
      );
    } else {
      // Lanzamos un error manual para simular un fallo en el servidor
      throw "ERROR 500 (Internal Server Error)";
    }
  } catch (err) {
    print("Error en Tarea 1: $err");
    print("Sugerencia al usuario: Intente de nuevo más tarde.");
  } finally {
    print("Tarea 1: Finalizada.");
  }
}

/// Tarea 2: Simula la carga de la interfaz de usuario (Preloader).
void tarea_2() {
  print("Tarea 2: Pantalla Preloader de la App...");
}

void main() {
  print("=== INICIO DE LA APP (FLUJO ASÍNCRONO) ===");
  print("-" * 45);

  // SIMULACIÓN
  tarea_1(exitosa: false);
  tarea_2();
}
```

-----

## Conclusión

La programación asíncrona es vital para la **concurrencia**. Mientras `tarea_1` espera pacientemente la respuesta del servidor sin molestar a nadie, `tarea_2` toma el control de la pantalla para mantener al usuario informado.
