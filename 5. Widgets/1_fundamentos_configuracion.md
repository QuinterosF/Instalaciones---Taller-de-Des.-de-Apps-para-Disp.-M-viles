## Módulo 1: Fundamentos, Configuración Inicial y Control de Versiones

En esta guía construiremos un "Catálogo Interactivo de Widgets". No será solo teoría; programaremos una aplicación donde podremos manipular las propiedades de cada Widget (tamaño, color, alineación) en tiempo real para ver cómo reaccionan en la pantalla.

Como en todo proyecto de software profesional, el primer paso no es solo escribir código, sino preparar nuestro entorno y asegurar nuestro trabajo utilizando control de versiones.

### Paso 1: Creación del Proyecto Flutter en Visual Studio Code

Para empezar, crearemos el esqueleto de nuestra aplicación directamente desde nuestro editor de código.

1. Abre **Visual Studio Code**.
2. Presiona la combinación de teclas **`Ctrl + Shift + P`** para abrir la Paleta de Comandos.
3. Escribe y selecciona la opción **`Flutter: New Project`**.
4. En la lista desplegable, selecciona **`Application`** (A Flutter application with descriptive comments and tests).
5. Selecciona la carpeta en tu computadora donde deseas guardar el proyecto.
6. Finalmente, asigna el nombre al proyecto: **`catalogo_widgets_app`** y presiona `Enter`.

Visual Studio Code preparará todo el entorno y abrirá el proyecto automáticamente.

### Paso 2: Inicializando Git y GitHub

Antes de tocar una sola línea de código, vamos a asegurar nuestro proyecto. Git nos permitirá llevar un historial de los cambios, y GitHub será nuestro respaldo en la nube.

Abre la terminal integrada de Visual Studio Code (puedes usar el atajo de teclado **`Ctrl + ñ`** o ir al menú *Terminal > New Terminal*).

1. Inicializa el repositorio local:
```bash
git init

```


2. Añade todos los archivos iniciales que generó Flutter y haz tu primer commit:
```bash
git add .
git commit -m "init: creación del proyecto base en Flutter desde VS Code"

```


3. Ve a tu cuenta de **GitHub** y crea un nuevo repositorio llamado `catalogo_widgets_app` (déjalo público o privado, pero sin agregar archivo README ni .gitignore desde la web).
4. Vincula tu proyecto local con el repositorio en la nube y sube los archivos (reemplaza `<TU_USUARIO>` por tu nombre de usuario en GitHub):
```bash
git branch -M main
git remote add origin https://github.com/<TU_USUARIO>/catalogo_widgets_app.git
git push -u origin main

```



¡Listo! Ya tienes tu código a salvo en la nube.

### Paso 3: Limpieza y Estructura Base (`main.dart`)

Flutter genera mucho código de ejemplo por defecto (la famosa app del contador). Vamos a limpiar el archivo `lib/main.dart` para empezar desde cero con nuestra propia arquitectura.

Abre el archivo `lib/main.dart`, borra todo su contenido y escribe lo siguiente:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de 'DEBUG'
      title: 'Catálogo de Widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuPrincipalScreen(),
    );
  }
}

```

**Conceptos Clave:**

* **`StatelessWidget`:** Utilizamos un widget "sin estado" para `MyApp` porque la configuración general de la aplicación (el tema y el título) no va a cambiar dinámicamente mientras la usamos.
* **`MaterialApp`:** Es el widget raíz que envuelve toda la aplicación y nos provee de las herramientas de Material Design, además de gestionar la navegación.

### Paso 4: Creando nuestra primera pantalla (`Scaffold` y `Center`)

Como notaste, en la propiedad `home` llamamos a `MenuPrincipalScreen()`, pero aún no existe. Vamos a crear la estructura básica de esta pantalla.

Justo debajo de la clase `MyApp`, añade el siguiente código:

```dart
class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provee la estructura visual básica (AppBar, Body, FAB, etc.)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio - Catálogo de Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Center se encarga de posicionar a su hijo exactamente en el medio
      body: const Center(
        child: Text(
          'Bienvenido al Explorador de Widgets',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

```

Si guardas los cambios y ejecutas la aplicación (presionando `F5` o usando el botón de Play en VS Code), verás una pantalla limpia con una barra superior y un texto perfectamente centrado. Has utilizado exitosamente tus primeros widgets estructurales: **`Scaffold`**, **`Center`** y **`Text`**.

### Paso 5: Guardando nuestro progreso en GitHub

Hemos logrado nuestro primer objetivo visual y de estructura. Es el momento perfecto para hacer nuestro segundo commit y subirlo a GitHub. Acostúmbrate a hacer esto cada vez que completes una funcionalidad.

En tu terminal de VS Code, ejecuta:

```bash
git add lib/main.dart
git commit -m "feat: limpieza de main.dart y creación del Scaffold principal"
git push

```
