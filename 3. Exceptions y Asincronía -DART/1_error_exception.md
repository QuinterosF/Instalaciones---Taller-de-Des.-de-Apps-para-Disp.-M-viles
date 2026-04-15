# 3.1 Manejo de Errores y Excepciones
  * [**try, catch y finally**](#1-la-red-de-seguridad-try-catch-y-finally)

Imagina que estás usando tu app de banco favorita. Intentas transferir dinero, pero justo en ese momento tu conexión a internet falla o intentas enviar más dinero del que tienes. Si no se ha previsto esto, la app se cerrará inesperadamente.

En el mundo del desarrollo profesional, **no podemos evitar que ocurran errores, pero sí podemos controlar cómo reacciona nuestra aplicación ante ellos.**

---

## 1. La Red de Seguridad: `try`, `catch` y `finally`

En Dart, cuando sospechamos que un bloque de código puede fallar, lo envolvemos en una estructura de "red de seguridad".

* **`try`**: Aquí colocamos el código que **"intentaremos"** ejecutar (si todo sale bien).
* **`catch`**: Si algo sale mal dentro del `try`, el control pasa inmediatamente a este bloque. Aquí **"capturamos"** el error para que la app no muera.
* **`finally`**: Este bloque se ejecuta **siempre**, pase lo que pase (haya habido error o no). Es ideal para limpiar recursos o cerrar conexiones.

### Ejemplo: El intento de transferencia básica
```dart
void realizarTransferencia(int monto, bool simularException) {
  try {
    print("Iniciando proceso de transferencia...");

    // Simulamos un error
    if (simularException) {
      throw "ERROR FATAL!!!";
    }

    print("Transferencia de \$$monto completada con éxito.");
  } 
  catch (e) {
    print("Algo salió mal: $e");
  }
  finally {
    print("Operación finalizada. Limpiando datos temporales...");
  }
}
```


---

## 2. Siendo Específicos: La Cláusula `on`

Capturar un error genérico con `catch` es como ir al médico y solo decirle "me duele algo". Es mucho mejor ser específicos. La cláusula `on` nos permite reaccionar de forma distinta dependiendo del **tipo** de error que ocurra.

Imagina que nuestra transferencia puede fallar por dos razones: un error de formato (pusieron letras en lugar de números) o un error de red.

```dart
void procesarPago(String montoTexto) {
  try {
    double monto = double.parse(montoTexto); // Puede lanzar FormatException
    print("Procesando pago de Bs. $monto...");
  }
  on FormatException {
    print("Error: El monto ingresado '$montoTexto' no es un número válido.");
  }
  on Exception catch (e) {
    print("Ocurrió un error inesperado: $e");
  }
  catch (e) {
    print("Error desconocido: $e");
  }
}
```

> **Regla de oro:** Siempre coloca las excepciones más específicas arriba y las más generales (`catch` genérico) al final.

---

## 3. Creando nuestras propias reglas: Custom Exceptions

A veces, las excepciones que trae Dart por defecto (como `FormatException` o `IOException`) no son suficientes para describir la lógica de nuestro negocio. En nuestro banco, necesitamos una excepción específica cuando el usuario no tiene suficiente dinero.

Para crear una excepción personalizada, simplemente creamos una clase que implemente `Exception`.

### Paso A: Definir la excepción
```dart
class SaldoInsuficienteException implements Exception {
  final double saldoActual;
  final double montoIntentado;

  SaldoInsuficienteException({
    required this.saldoActual,
    required this.montoIntentado,
  });

  @override
  String toString() =>
      "SaldoInsuficienteException: Intentaste transferir Bs. $montoIntentado pero solo tienes Bs. $saldoActual.";
}
```

### Paso B: Lanzar (`throw`) y Capturar la excepción
Ahora, en nuestra lógica de negocio, podemos "lanzar" el error manualmente cuando se rompa una regla.

```dart
void validarRetiro(double saldo, double retiro) {
  try {
    if (retiro > saldo) {
      // Lanzamos nuestra propia excepción
      throw SaldoInsuficienteException(
        saldoActual: saldo,
        montoIntentado: retiro,
      );
    }
    print("Retiro autorizado.");
  }
  on SaldoInsuficienteException catch (e) {
    print("Operación denegada.");
    print(e); // Imprime nuestro mensaje personalizado
  }
}
```

## 4. Simulación y código completo

```dart
// try, catch y finally
void realizarTransferencia(int monto, bool simularException) {
  try {
    print("Iniciando proceso de transferencia...");

    // Simulamos un error
    if (simularException) {
      throw "ERROR FATAL!!!"; //Lanzar error con "throw"
    }

    print("Transferencia de \$$monto completada con éxito.");
  } 
  catch (e) {
    print("Algo salió mal: $e");
  }
  finally {
    print("Operación finalizada. Limpiando datos temporales...");
  }
}

// La claúsula "on"
void procesarPago(String montoTexto) {
  try {
    double monto = double.parse(montoTexto); // Puede lanzar FormatException
    print("Procesando pago de Bs. $monto...");
  }
  on FormatException {
    print("Error: El monto ingresado '$montoTexto' no es un número válido.");
  }
  on Exception catch (e) {
    print("Ocurrió un error inesperado: $e");
  }
  catch (e) {
    print("Error desconocido: $e");
  }
}

// CREANDO NUESTRA PROPIA EXCEPTION
class SaldoInsuficienteException implements Exception {
  final double saldoActual;
  final double montoIntentado;

  SaldoInsuficienteException({
    required this.saldoActual,
    required this.montoIntentado,
  });

  @override
  String toString() =>
      "SaldoInsuficienteException: Intentaste transferir Bs. $montoIntentado pero solo tienes Bs. $saldoActual.";
}

// Custom Exceptions
void validarRetiro(double saldo, double retiro) {
  try {
    if (retiro > saldo) {
      // Lanzamos nuestra propia excepción
      throw SaldoInsuficienteException(
        saldoActual: saldo,
        montoIntentado: retiro,
      );
    }
    print("Retiro autorizado.");
  }
  on SaldoInsuficienteException catch (e) {
    print("Operación denegada.");
    print(e); // Imprime nuestro mensaje personalizado
  }
}

// SIMULACIÓN
void main() {
  print("\n===== SIMULANDO QUE TODO SALE BIEN =====");
  print("-" * 40);
  realizarTransferencia(100, false);
  print("-" * 40);
  procesarPago("100");
  print("-" * 40);
  validarRetiro(200, 100);
  print("-" * 40);

  print("\n\n===== SIMULANDO QUE TODO SALE MAL =====");
  print("-" * 40);
  realizarTransferencia(100, true);
  print("-" * 40);
  procesarPago("100a");
  print("-" * 40);
  validarRetiro(200, 10000);
  print("-" * 40);
}
```

---

## Conclusión para tu carrera como Desarrollador
Manejar excepciones no se trata solo de evitar que la app se cierre. Se trata de **comunicación**. Un buen manejo de errores le dice al usuario exactamente qué pasó ("No tienes internet") en lugar de dejarlo frente a una pantalla en blanco o una app congelada.
