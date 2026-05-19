## Módulo 7: Capas y Desplazamiento Avanzado (Stack, GridView y SingleChildScrollView)

En interfaces modernas, rara vez los elementos están simplemente uno al lado del otro. A menudo necesitamos encimar widgets o mostrar listas de productos que exceden el tamaño de nuestro dispositivo. Para esto, Flutter nos ofrece tres herramientas maestras:

* **Stack:** Este widget permite colocar widgets uno encima de otro. Funciona como capas de Photoshop , donde el primer hijo queda al fondo y el último queda encima. Es ideal para colocar insignias (badges) sobre imágenes o textos sobre fondos.

* **GridView:** Organiza elementos en forma de cuadrícula, lo cual es perfecto para construir una galería de imágenes o productos.

* **SingleChildScrollView:** Hace desplazable a cualquier widget que no sea naturalmente scrollable, como una Column. Esto permite desplazar contenido cuando no cabe en pantalla, siendo ideal para contenido que es largo pero finito, como formularios o artículos.

### Paso 1: Crear la Pantalla de Capas y Cuadrículas

En tu carpeta `lib/screens`, crea nuestro último archivo llamado `layers_scroll_screen.dart`.

En este código vamos a crear un "Playground" dual. Por defecto mostrará una tarjeta de perfil construida con un `Stack`, y mediante un interruptor podremos cambiar la vista para ver un `GridView` en acción. Además, todo el panel inferior estará envuelto en un `SingleChildScrollView`.

Copia y pega el siguiente código:

```dart
import 'package:flutter/material.dart';

class LayersScrollScreen extends StatefulWidget {
  const LayersScrollScreen({super.key});

  @override
  State<LayersScrollScreen> createState() => _LayersScrollScreenState();
}

class _LayersScrollScreenState extends State<LayersScrollScreen> {
  // VARIABLES DE ESTADO
  String _vistaActual = 'Stack'; // Puede ser: 'Stack', 'GridView' o 'ScrollView'
  bool _mostrarBadge = true; // Controla la capa superior del Stack
  double _posicionTop = -10.0; // Controla la posición 'Y' del badge
  double _posicionRight = -10.0; // Controla la posición 'X' del badge

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capas y Desplazamiento'),
        backgroundColor: Colors.amber.shade700,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                // Mostramos el widget correspondiente según la selección
                child: _obtenerVistaActual(),
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles envuelto en un SingleChildScrollView
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- SELECTOR: Alternar entre vistas ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Vista actual:', style: TextStyle(fontWeight: FontWeight.bold)),
                        DropdownButton<String>(
                          value: _vistaActual,
                          items: const [
                            DropdownMenuItem(value: 'Stack', child: Text('1. Stack')),
                            DropdownMenuItem(value: 'GridView', child: Text('2. GridView')),
                            DropdownMenuItem(value: 'ScrollView', child: Text('3. SingleChildScrollView')),
                          ],
                          onChanged: (nuevoValor) {
                            if (nuevoValor != null) {
                              setState(() {
                                _vistaActual = nuevoValor;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    const Divider(),

                    // Mostrar controles específicos del Stack solo si está seleccionado
                    if (_vistaActual == 'Stack') ...[
                      // --- SWITCH: Capa del Badge ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Mostrar Badge (Capa Superior):', style: TextStyle(fontWeight: FontWeight.bold)),
                          Switch(
                            value: _mostrarBadge,
                            activeColor: Colors.amber.shade700,
                            onChanged: (valor) {
                              setState(() {
                                _mostrarBadge = valor;
                              });
                            },
                          ),
                        ],
                      ),
                      
                      // --- SLIDERS: Widget Positioned ---
                      const SizedBox(height: 10),
                      const Text('Mover Badge (Vertical - Top):', style: TextStyle(fontWeight: FontWeight.bold)),
                      Slider(
                        value: _posicionTop,
                        min: -30.0,
                        max: 50.0,
                        activeColor: Colors.amber.shade700,
                        onChanged: _mostrarBadge ? (valor) => setState(() => _posicionTop = valor) : null,
                      ),
                      const Text('Mover Badge (Horizontal - Right):', style: TextStyle(fontWeight: FontWeight.bold)),
                      Slider(
                        value: _posicionRight,
                        min: -30.0,
                        max: 50.0,
                        activeColor: Colors.amber.shade700,
                        onChanged: _mostrarBadge ? (valor) => setState(() => _posicionRight = valor) : null,
                      ),
                    ] else if (_vistaActual == 'GridView') ...[
                      const Center(
                        child: Text(
                          'El GridView organiza sus elementos en columnas y genera scroll automáticamente si exceden el tamaño.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      )
                    ] else ...[
                      const Center(
                        child: Text(
                          'El SingleChildScrollView permite deslizar una Column que de otro modo causaría un error de desbordamiento (Overflow).',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // MÉTODO AUXILIAR: Retorna el widget según la selección del usuario
  Widget _obtenerVistaActual() {
    switch (_vistaActual) {
      case 'Stack':
        return _construirStack();
      case 'GridView':
        return _construirGridView();
      case 'ScrollView':
        return _construirScrollView();
      default:
        return _construirStack();
    }
  }

  // MÉTODO AUXILIAR: Construye el Stack
  Widget _construirStack() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.amber, Colors.deepOrangeAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.white, child: Icon(Icons.person, size: 50, color: Colors.grey)),
            SizedBox(height: 10),
            Text('Desarrollador', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        if (_mostrarBadge)
          Positioned(
            top: _posicionTop,
            right: _posicionRight,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              child: const Icon(Icons.verified, color: Colors.white, size: 30),
            ),
          ),
      ],
    );
  }

  // MÉTODO AUXILIAR: Construye el GridView
  Widget _construirGridView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(6, (index) {
          List<Color> colores = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];
          return Container(
            color: colores[index % colores.length],
            child: Center(child: Text('Ítem ${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 20))),
          );
        }),
      ),
    );
  }

  // MÉTODO AUXILIAR: Construye el SingleChildScrollView
  Widget _construirScrollView() {
    // Aquí forzamos un contenido muy largo (20 cajas) para que requiera scroll
    return SingleChildScrollView(
      child: Column(
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Elemento ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          );
        }),
      ),
    );
  }
}

```

### Paso 2: Conexión Final al Menú Principal

Abre tu archivo `lib/main.dart` por última vez para enlazar esta pantalla.

1. Importa el archivo arriba:
```dart
import 'package:catalogo_widgets_app/screens/layers_scroll_screen.dart';

```


2. Añade el último `ListTile` en tu `ListView` de la clase `MenuPrincipalScreen`:
```dart
          ListTile(
            leading: const Icon(Icons.layers, color: Colors.amber),
            title: const Text('5. Capas y Cuadrículas'),
            subtitle: const Text('Stack, Positioned y GridView'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LayersScrollScreen(),
                ),
              );
            },
          ),

```



### Paso 3: Análisis Final

* **Stack y Positioned:** En la vista de Stack, mueve los sliders. Verás cómo el icono verde de verificación (Capa 3) se desplaza independientemente del fondo (Capa 1) y del texto (Capa 2). El widget `Positioned` nos da control absoluto sobre las coordenadas X y Y del elemento hijo dentro de un `Stack`.
* **GridView:** Al activar el interruptor de GridView, verás cómo 4 bloques se organizan matemáticamente en una cuadrícula de 2x2. Si agregaras más elementos a la lista, el `GridView` se encargaría automáticamente del *scroll*.

### Paso 4: El Último Commit en GitHub

El proyecto está completo y totalmente funcional. Es momento de sellar nuestro trabajo enviando el código final a la nube. En la terminal de VS Code:

```bash
git add .
git commit -m "feat: pantalla final con Stack, Positioned, GridView y SingleChildScrollView"
git push

```
