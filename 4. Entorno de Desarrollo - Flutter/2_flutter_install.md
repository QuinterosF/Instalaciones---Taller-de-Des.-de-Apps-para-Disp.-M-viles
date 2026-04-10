# 2\. Instalación de Flutter SDK

El SDK de Flutter es el conjunto de herramientas que nos permitirá compilar y ejecutar nuestras aplicaciones. Sigue estos pasos cuidadosamente.

## 2.1. Descarga del SDK

1.  Ve a la [documentación oficial de Flutter](https://docs.flutter.dev/install/manual#install-flutter) y descarga el paquete (bundle) de la última versión **stable**.
2.  El archivo será un `.zip` (por ejemplo: `flutter_windows_3.41.6-stable.zip`).

## 2.2. Crear Carpeta de Destino

Es fundamental elegir una ruta correcta para evitar problemas de permisos o caracteres especiales.

  * **Recomendación:** Crea una carpeta llamada `develop` en tu perfil de usuario: `C:\Usuarios\TuUsuario\develop`.
  * **¡ADVERTENCIA\!:** No instales Flutter en `C:\Program Files\` o rutas que contengan espacios o caracteres especiales (tildes, ñ), ya que requiere privilegios elevados y romperá las herramientas de línea de comandos.

## 2.3. Extraer el SDK

Extrae el contenido del archivo `.zip` dentro de la carpeta que creaste. Deberías tener una ruta final similar a:
`C:\Users\TuUsuario\develop\flutter`

> **Nota sobre Antivirus:** Si después de extraer no ves el archivo `flutter_console.bat` dentro de la carpeta `bin`, es posible que tu antivirus lo haya puesto en cuarentena. Si sucede, marca la carpeta de Flutter como "confiable" y vuelve a extraer.

## 2.4. Agregar Flutter al PATH (Variables de Entorno)

Este paso es el más importante: permite que tu computadora reconozca los comandos `flutter` y `dart` desde cualquier terminal.

1.  **Copia la ruta:** Entra en la carpeta `flutter`, luego en `bin` y copia la ruta completa desde la barra de direcciones (ej: `C:\Users\TuUsuario\develop\flutter\bin`).
2.  **Abrir Variables de Entorno:**
      * Presiona la tecla `Windows` y escribe: **Variables de entorno**.
      * Selecciona **Editar las variables de entorno del sistema**.
      * Haz clic en el botón **Variables de entorno...**.
3.  **Configurar el Path:**
      * En la sección **Variables del sistema**, busca la variable llamada `Path` y haz doble clic.
      * Haz clic en **Nuevo** y pega la ruta que copiaste (la que termina en `\bin`).
      * Haz clic en **Aceptar** en las tres ventanas abiertas.

## 2.5. Validar la Instalación

Para aplicar los cambios, **cierra cualquier terminal o consola que tengas abierta** y abre una nueva (PowerShell o CMD).

Escribe los siguientes comandos para verificar que todo esté en orden:

```bash
flutter --version
```

```bash
dart --version
```

Si el sistema te devuelve los números de versión, ¡felicidades\! Ya tienes el SDK de Flutter vinculado a tu sistema.

-----

> **Siguiente paso:** Ahora que el SDK está instalado, debemos terminar de configurar las licencias y herramientas en
>
> [3. Configuración de Flutter](https://www.google.com/search?q=./flutter_config.md).
