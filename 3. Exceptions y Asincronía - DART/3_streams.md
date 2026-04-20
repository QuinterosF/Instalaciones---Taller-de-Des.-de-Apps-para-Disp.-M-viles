# 3.3 Streams: Flujos de Datos en Tiempo Real

  * [**¿Qué es un Stream?**](#1-qu%C3%A9-es-un-stream)
  * [**Diferencia: Future vs Stream**](#2-diferencia-future-vs-stream)
  * [**Generadores Asíncronos: async* y yield*\*](#3-generadores-as%C3%ADncronos-async-y-yield)
  * [**Simulación y código completo**](#4-simulaci%C3%B3n-y-c%C3%B3digo-completo)

En las secciones anteriores aprendimos a esperar un dato único. Pero, ¿qué pasa si necesitamos monitorear el precio del Bitcoin cada segundo, recibir mensajes en un chat o ver el progreso de una descarga? Aquí es donde entra la **Programación Reactiva** con los **Streams**.

-----

## 1\. ¿Qué es un Stream?

Un **Stream** es como una tubería de agua: una vez que la abres, el líquido (los datos) fluye de un extremo a otro de forma continua. En Dart, tú te sitúas al final de la tubería para "escuchar" (`listen`) y reaccionar a cada gota de información que llega.

Un Stream en Dart es una secuencia de eventos asíncronos que emite datos a lo largo del tiempo, en lugar de todos a la vez, similar a una cinta transportadora que entrega elementos uno por uno. Permite manejar múltiples valores (datos o errores) y notificar al cierre, ideal para actualizaciones en tiempo real sin bloquear la interfaz de usuario.

-----

## 2\. Diferencia: Future vs Stream

Es fundamental entender cuándo usar cada uno para no sobrecargar la memoria de la aplicación:

| Característica | Future | Stream |
| :--- | :--- | :--- |
| **Cantidad de datos** | Devuelve **un solo** valor o un error. | Puede devolver **múltiples** valores en el tiempo. |
| **Finalización** | Se detiene apenas entrega el resultado. | Se mantiene abierto hasta que se cierra explícitamente. |
| **Ejemplo real** | Pedir el nombre de un usuario a la DB. | Escuchar la ubicación GPS mientras el usuario se mueve. |

-----

## 3\. Generadores Asíncronos: `async*` y `yield`

Para crear un flujo de datos propio, usamos una sintaxis especial:

1.  **`async*`**: Marca la función como un generador de Stream (fíjate en el asterisco).
2.  **`yield`**: A diferencia de `return` (que termina la función), `yield` entrega un dato pero mantiene la función "viva" para entregar el siguiente.

### Ejemplo: El contador de progreso

```dart
Stream<int> contadorProgreso() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i * 20; // Entrega 20, 40, 60... pero no cierra la función
  }
}
```

-----

## 4\. Simulación y código completo

Para esta simulación, transformaremos nuestra **Tarea 1**. En lugar de imprimir números por su cuenta, ahora será un **Stream** que emite el progreso. La **Tarea 2** seguirá mostrando el Preloader, demostrando que la interfaz reacciona a cada "gota" de datos que llega del servidor.

```dart
/// TAREA 1: Ahora es un Stream (Generador Asíncrono)
/// Emite el porcentaje de descarga paso a paso.
Stream<int> flujoDeDescarga() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 2));
    yield i * 20; // Emitimos el progreso: 20%, 40%, 60%, 80%, 100%
  }
}

/// Función que "Escucha" el Stream
void procesarDescarga() {
  print("Tarea 1: Iniciando descarga...");

  // Nos suscribimos al flujo de datos
  flujoDeDescarga().listen(
    (porcentaje) {
      // Este bloque se ejecuta CADA VEZ que llega un dato (yield)
      print("  [Servidor] Progreso de descarga: $porcentaje%");
    },
    onError: (err) => print("Tarea 1: Error en la descarga: $err"),
    onDone: () => print("Tarea 1: Descarga completa. Archivo guardado."),
  );
}

/// TAREA 2: Sigue siendo la interfaz de usuario
void tarea_2() {
  print("Tarea 2: Cargando pantalla Preloader...");
}

void main() {
  print("=== INICIO DE SESIÓN REACTIVA ===");
  print("-" * 40);

  procesarDescarga(); // Iniciamos el flujo
  tarea_2(); // La UI responde de inmediato
}
```

-----

## Conclusión

Con los **Streams**, hemos pasado de un código que "espera y se detiene" a un código **reactivo**. Tu aplicación ahora es capaz de escuchar cambios en tiempo real, lo cual es la base para manejar estados complejos en **Flutter** (como los *Blocs* o *Providers*).

> [!IMPORTANT]
> **Puntos clave para recordar:**
>
>  * Usa `listen()` para empezar a recibir datos.
>  * Usa `async*` y `yield` para crear tus propios flujos.
>  * Siempre cierra tus Streams o cancela las suscripciones cuando no las necesites para evitar fugas de memoria.
