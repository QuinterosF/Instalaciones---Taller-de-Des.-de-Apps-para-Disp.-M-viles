## Módulo 4: Explorando el Posicionamiento Lineal (Column y Row)

Hasta el momento hemos trabajado con un solo elemento a la vez (un `Container` o un `Text` en el centro de la pantalla). Sin embargo, las aplicaciones reales requieren acomodar múltiples elementos.

Para lograr esto, Flutter utiliza dos widgets principales:

* **Column:** Organiza a sus widgets hijos de manera vertical, uno debajo del otro.
* **Row:** Organiza a sus widgets hijos de manera horizontal, uno al lado del otro.

Ambos widgets comparten dos propiedades fundamentales para controlar la distribución de sus elementos: `mainAxisAlignment` (el eje principal) y `crossAxisAlignment` (el eje cruzado). En este módulo, construiremos un panel para alternar entre `Column` y `Row`, y modificar estas alineaciones en vivo.

### Paso 1: Crear la Pantalla Interactiva

En VS Code, dentro de tu carpeta `lib/screens`, crea un nuevo archivo llamado `column_row_screen.dart`.

Copia y pega el siguiente código. Observa cómo utilizamos listas de opciones (`DropdownButton`) para que el usuario pueda cambiar la alineación dinámicamente:

```dart
import 'package:flutter/material.dart';

class ColumnRowScreen extends StatefulWidget {
  const ColumnRowScreen({super.key});

  @override
  State<ColumnRowScreen> createState() => _ColumnRowScreenState();
}

class _ColumnRowScreenState extends State<ColumnRowScreen> {
  // VARIABLES DE ESTADO
  bool _esFila = false; // false = Column, true = Row
  MainAxisAlignment _mainAlign = MainAxisAlignment.center;
  CrossAxisAlignment _crossAlign = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column y Row'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Playground)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity, // Ocupa todo el ancho posible
              color: Colors.white,
              // Dependiendo del estado '_esFila', mostramos un Row o un Column
              child: _esFila
                  ? Row(
                      mainAxisAlignment: _mainAlign,
                      crossAxisAlignment: _crossAlign,
                      children: _generarCajas(),
                    )
                  : Column(
                      mainAxisAlignment: _mainAlign,
                      crossAxisAlignment: _crossAlign,
                      children: _generarCajas(),
                    ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles
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
                    // --- SWITCH: Alternar entre Column y Row ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Modo:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            const Text('Column'),
                            Switch(
                              value: _esFila,
                              activeColor: Colors.indigo,
                              onChanged: (valor) {
                                setState(() {
                                  _esFila = valor;
                                });
                              },
                            ),
                            const Text('Row'),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),

                    // --- DROPDOWN: mainAxisAlignment ---
                    const Text('mainAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<MainAxisAlignment>(
                      isExpanded: true,
                      value: _mainAlign,
                      items: MainAxisAlignment.values.map((align) {
                        return DropdownMenuItem(
                          value: align,
                          child: Text(align.name),
                        );
                      }).toList(),
                      onChanged: (nuevoValor) {
                        if (nuevoValor != null) {
                          setState(() {
                            _mainAlign = nuevoValor;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 10),

                    // --- DROPDOWN: crossAxisAlignment ---
                    const Text('crossAxisAlignment:', style: TextStyle(fontWeight: FontWeight.bold)),
                    DropdownButton<CrossAxisAlignment>(
                      isExpanded: true,
                      value: _crossAlign,
                      items: CrossAxisAlignment.values.map((align) {
                        return DropdownMenuItem(
                          value: align,
                          child: Text(align.name),
                        );
                      }).toList(),
                      onChanged: (nuevoValor) {
                        if (nuevoValor != null) {
                          setState(() {
                            _crossAlign = nuevoValor;
                          });
                        }
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

  // Función auxiliar para no repetir código, genera 3 cajas de colores
  List<Widget> _generarCajas() {
    return [
      Container(
        width: 60, height: 60, color: Colors.pinkAccent,
        child: const Center(child: Text('A', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      Container(
        width: 80, height: 80, color: Colors.blueAccent,
        child: const Center(child: Text('B', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      Container(
        width: 60, height: 60, color: Colors.amber,
        child: const Center(child: Text('C', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
    ];
  }
}

```

### Paso 2: Conectar la pantalla al Menú Principal

Para poder ver nuestra nueva creación, debemos actualizar el archivo `lib/main.dart` y agregar la navegación correspondiente en el `ListView`.

Abre `main.dart`, asegúrate de importar el nuevo archivo en la parte superior:

```dart
import 'package:catalogo_widgets_app/screens/column_row_screen.dart';

```

Y luego, busca el segundo `ListTile` (el de Column y Row) y actualiza su propiedad `onTap`:

```dart
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ColumnRowScreen(),
                ),
              );
            },

```

### Paso 3: Análisis de la Distribución

Guarda y ejecuta la aplicación. Al entrar a esta nueva opción verás un bloque de tres colores (A, B, C).

* Juega con el botón `Switch`. Verás que el código usa una condición ternaria (`_esFila ? Row(...) : Column(...)`) para reconstruir la interfaz dependiendo de lo que elijas.
* Cambia el `mainAxisAlignment` a `spaceAround` o `spaceBetween`. Nota cómo el espacio sobrante se distribuye entre las cajas.
* El `crossAxisAlignment` se percibe mejor porque hicimos la caja "B" más grande (80x80). Cambia esta propiedad a `start` o `end` y observa cómo las cajas más pequeñas se alinean respecto a la grande en el eje contrario.
