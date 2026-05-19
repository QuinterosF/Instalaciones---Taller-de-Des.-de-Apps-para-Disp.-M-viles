## Módulo 2: Navegación y Listas (Armando el Menú Principal)

En este módulo transformaremos nuestra pantalla estática inicial en un menú dinámico. Para ello, aprenderemos a mostrar listas de elementos y a navegar entre múltiples pantallas usando el sistema de rutas de Flutter.

### Paso 1: Crear una pantalla de destino (Placeholder)

Antes de crear un botón de navegación, necesitamos un lugar hacia dónde ir. Vamos a crear la pantalla donde más adelante exploraremos el widget `Container`.

Para mantener las buenas prácticas de la ingeniería de software y no tener todo amontonado en un solo archivo, vamos a organizar nuestro proyecto:

1. En VS Code, dentro de la carpeta `lib`, crea una nueva carpeta llamada `screens`.
2. Dentro de `screens`, crea un archivo llamado `container_screen.dart`.
3. Escribe el siguiente código base (nuestro "Placeholder"):

```dart
import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explorador de Container'),
        backgroundColor: Colors.teal, // Un color distinto para diferenciar
      ),
      body: const Center(
        child: Text('Aquí construiremos el interactivo del Container'),
      ),
    );
  }
}

```

### Paso 2: Construir el menú con `ListView`

Ahora, regresemos a nuestro archivo `lib/main.dart`. Vamos a reemplazar el mensaje de bienvenida por una lista de opciones.

Flutter nos ofrece **`ListView`**, el widget ideal para mostrar elementos desplazables (scrollables). Dentro de este, usaremos **`ListTile`**, un componente prefabricado que estructura perfectamente un ícono, un título y una acción.

Modifica la clase `MenuPrincipalScreen` en `main.dart` para que quede así:

```dart
// No olvides importar la nueva pantalla que creamos arriba del archivo
import 'package:catalogo_widgets_app/screens/container_screen.dart';
import 'package:flutter/material.dart';

// ... (El código de void main() y MyApp se mantiene igual)

class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Reemplazamos Center por ListView
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.check_box_outline_blank, color: Colors.teal),
            title: const Text('1. Container, Padding y SizedBox'),
            subtitle: const Text('Cajas, márgenes y espacios'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Aquí implementaremos la navegación
            },
          ),
          const Divider(), // Agrega una línea separadora
          
          ListTile(
            leading: const Icon(Icons.view_column, color: Colors.blue),
            title: const Text('2. Column y Row'),
            subtitle: const Text('Alineación vertical y horizontal'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Futura navegación
            },
          ),
          const Divider(),
          
          // Iremos agregando más ListTiles a medida que avancemos...
        ],
      ),
    );
  }
}

```

**Conceptos Clave:**

* 
**`ListView`:** Organiza a sus hijos (`children`) uno debajo del otro y permite el desplazamiento (scroll) si los elementos exceden el tamaño de la pantalla.


* **`Icon`:** Agregamos íconos de Material Design (`leading` a la izquierda, `trailing` a la derecha) para dar un aspecto profesional y guiar visualmente al usuario.

### Paso 3: Implementar la Navegación (`Navigator`)

En Flutter, las pantallas se manejan como una pila (Stack) de cartas. Para ir a una nueva pantalla, ponemos una carta encima de la pila (`push`). Para regresar, la quitamos (`pop`).

Vamos a darle vida al `onTap` de nuestro primer `ListTile`. Modifica esa parte específica dentro de `main.dart`:

```dart
            onTap: () {
              // Usamos Navigator para ir a la nueva pantalla
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContainerScreen(),
                ),
              );
            },

```

Guarda todos los archivos (`Ctrl + S`). Si pruebas la aplicación ahora, verás un menú profesional. Al presionar la primera opción, la app navegará automáticamente a la pantalla del "Explorador de Container", e incluso Flutter colocará automáticamente el botón de "Atrás" en el `AppBar` superior. ¡Magia!

### Paso 4: Guardando nuestro progreso en GitHub

Es fundamental documentar que acabamos de implementar nuestro sistema de navegación. Abre la terminal de VS Code y ejecuta:

```bash
git add .
git commit -m "feat: creación del menú con ListView e implementación de navegación básica"
git push

```

---

¿Qué tal te parece este paso a paso? En este punto los estudiantes ya tendrán un cascarón funcional navegable. Si estás listo, el **Módulo 3** será donde se pone realmente interesante: ¡convertiremos ese `ContainerScreen` en un **StatefulWidget** con *Sliders* para manipular el Container en tiempo real!
