# 1\. Instalación y Configuración de Android Studio

Para desarrollar aplicaciones con Flutter, necesitamos las herramientas de Android (tooling). Android Studio nos permitirá ejecutar nuestras apps tanto en dispositivos físicos como en emuladores.

## 1.1. Instalación de Android Studio

1.  **Descarga:** Ve al sitio oficial de [Android Studio](https://developer.android.com/studio?hl=es-419) y descarga la última versión estable.
2.  **Instalación:** Ejecuta el instalador y sigue los pasos del asistente (se recomienda la configuración "Standard").
3.  **Actualización:** Si ya lo tienes instalado, asegúrate de que esté actualizado a la última versión estable (**Help \> Check for Updates**).

## 1.2. Configuración del Android SDK y Herramientas

Una vez instalado, debemos preparar las herramientas de desarrollo (SDK) necesarias para que Flutter pueda comunicarse con Android.

### Abrir el SDK Manager

  * **Si estás en la pantalla de bienvenida:** Haz clic en **More Actions** \> **SDK Manager**.
  * **Si ya tienes un proyecto abierto:** Ve a **Tools** \> **SDK Manager**.

### Paso A: SDK Platforms

1.  Asegúrate de estar en la pestaña **SDK Platforms**.
2.  Busca la versión más reciente (actualmente **API Level 36** o superior).
3.  Si en la columna *Status* dice "Update available" o "Not installed", marca la casilla.
4.  Haz clic en **Apply** y luego en **OK** para instalar.

### Paso B: SDK Tools (Crucial para Flutter)

Flutter requiere herramientas específicas que no siempre vienen instaladas por defecto.

1.  Cambia a la pestaña **SDK Tools**.
2.  **IMPORTANTE:** Marca las siguientes casillas (si no están marcadas):
      * **Android SDK Build-Tools**
      * **Android SDK Command-line Tools (latest)** (Obligatorio para que funcione el comando `flutter doctor`)
      * **Android Emulator**
      * **Android SDK Platform-Tools**
      * **CMake**
      * **NDK (Side by side)**
3.  Haz clic en **Apply**.
4.  Confirma con **OK** en el cuadro de diálogo y espera a que el instalador finalice.
5.  Haz clic en **Finish**.

-----

> **Siguiente paso:** Una vez configurado Android Studio, podemos proceder a la [Instalación de Flutter](https://www.google.com/search?q=./flutter_install.md).
