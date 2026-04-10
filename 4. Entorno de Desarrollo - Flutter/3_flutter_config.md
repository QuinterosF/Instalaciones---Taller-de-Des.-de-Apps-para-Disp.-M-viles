# 3. Configuración Final de Flutter

Una vez que tenemos Android Studio y el SDK de Flutter instalados, debemos realizar la configuración final para vincular ambas herramientas y aceptar los términos de uso.

## 3.1. Diagnóstico del sistema (Flutter Doctor)

El comando más importante para un desarrollador Flutter es `flutter doctor`. Este comando analiza tu sistema y te indica qué falta por configurar.

1.  Abre una terminal (PowerShell o CMD).
2.  Escribe el siguiente comando:

    ```bash
    flutter doctor
    ```

3.  Verás una lista de verificación. Es normal que en este punto aparezcan "X" rojas en **Android toolchain** y **Android Studio**.

## 3.2. Aceptar Licencias de Android

Aunque instalaste el SDK, debes aceptar formalmente las licencias de Google para poder compilar aplicaciones.

1.  En la terminal, ejecuta:

    ```bash
    flutter doctor --android-licenses
    ```
2.  El sistema te mostrará varios textos legales. Debes presionar la tecla **`y`** (de *yes*) y luego `Enter` para cada una de las licencias (suelen ser entre 5 y 7).

## 3.3. Verificación Final

Tras reiniciar Android Studio, deberías ver una nueva opción en la pantalla de bienvenida: **"New Flutter Project"**. 

Como prueba definitiva, vuelve a ejecutar en tu terminal:

```bash
flutter doctor
```

Ahora, tanto **Android toolchain** como **Android Studio** deberían aparecer con una marca verde (✓).

-----

> **Siguiente paso:** Para completar el entorno, configuraremos un dispositivo virtual en [4. Emuladores](emuladores.md).
