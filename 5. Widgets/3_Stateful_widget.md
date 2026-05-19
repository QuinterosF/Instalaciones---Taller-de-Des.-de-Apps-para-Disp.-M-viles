## Módulo 3: El Poder del Estado e Interactividad (Container, Padding y SizedBox)

Hasta ahora, nuestras pantallas han sido **Stateless Widgets** (Widgets sin estado). Esto significa que son inmutables; una vez que se dibujan en la pantalla, su apariencia no puede cambiar dinámicamente.

Pero, ¿qué pasa si queremos mover un control deslizante y ver cómo cambia el tamaño de una caja? Para que la información de la pantalla se actualice, necesitamos un **Stateful Widget** (Widget con estado), el cual puede redibujarse durante la ejecución de la aplicación. La información que cambia (como el valor del tamaño) se conoce como **Estado** (`State`).

En este módulo exploraremos tres widgets fundamentales modificando sus propiedades en tiempo real:

* **Container:** Funciona como una caja a la que le podemos dar color, bordes redondeados, sombras y dimensiones.

* **Padding:** Agrega espacio interno alrededor de un widget.

* **SizedBox:** Ocupa un espacio fijo, forzando un tamaño específico.



### Paso 1: Convertir a `StatefulWidget` y definir variables

Vamos a reemplazar el código de nuestro archivo `lib/screens/container_screen.dart`. Borraremos el `StatelessWidget` que creamos en el módulo anterior y lo convertiremos en un `StatefulWidget` con variables para almacenar los valores de nuestros *Sliders*.

Copia y pega este nuevo código en `container_screen.dart`:

```dart
import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  // VARIABLES DE ESTADO: Estos valores cambiarán cuando movamos los Sliders
  double _tamano = 150.0;
  double _borderRadius = 10.0;
  double _padding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container, Padding y SizedBox'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // Usamos Column para dividir la pantalla en dos mitades (Arriba/Abajo)
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Playground)
          Expanded(
            flex: 1, // Toma la mitad de la pantalla
            child: Center(
              // 1. PADDING: Aplica espacio interno
              child: Padding(
                padding: EdgeInsets.all(_padding),
                // 2. SIZEDBOX: Fuerza el tamaño del widget hijo
                child: SizedBox(
                  width: _tamano,
                  height: _tamano,
                  // 3. CONTAINER: Damos estilo, color y bordes
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(_borderRadius),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Container',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade100, // Un fondo gris claro para el panel
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- CONTROL DE TAMAÑO (SizedBox) ---
                    Text('Tamaño (SizedBox): ${_tamano.toInt()}'),
                    Slider(
                      value: _tamano,
                      min: 50.0,
                      max: 300.0,
                      activeColor: Colors.teal,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _tamano = nuevoValor;
                        });
                      },
                    ),

                    // --- CONTROL DE BORDES (Container) ---
                    Text('BorderRadius (Container): ${_borderRadius.toInt()}'),
                    Slider(
                      value: _borderRadius,
                      min: 0.0,
                      max: 150.0,
                      activeColor: Colors.teal,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _borderRadius = nuevoValor;
                        });
                      },
                    ),

                    // --- CONTROL DE PADDING ---
                    Text('Padding interno: ${_padding.toInt()}'),
                    Slider(
                      value: _padding,
                      min: 0.0,
                      max: 100.0,
                      activeColor: Colors.teal,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _padding = nuevoValor;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

```

### Paso 2: Análisis de la Magia (`setState`)

¡Guarda los cambios y prueba tu aplicación! Al entrar a la opción del Container y mover los controles deslizantes, verás cómo la caja cuadrada crece, se vuelve circular o se achica al aumentar el padding, todo en tiempo real.

¿Cómo funciona esto?
La clave está en la función **`setState(() { ... })`**. Al mover el `Slider`, disparamos el evento `onChanged`, el cual actualiza nuestra variable (por ejemplo, `_tamano = nuevoValor;`). Si solo cambiáramos el valor de la variable, la pantalla no se daría cuenta. Al envolver ese cambio dentro de `setState`, le decimos a Flutter: *"¡Oye! Un dato acaba de cambiar, por favor reconstruye esta pantalla para reflejar la nueva información"*.
