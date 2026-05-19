## Módulo 5: Elementos de Interfaz de Usuario (UI) Textuales y Visuales

Para construir interfaces atractivas, Flutter nos provee de componentes prefabricados. En esta sección abordaremos:

* **Text:** El widget fundamental para mostrar texto en pantalla, el cual permite personalizar la tipografía completamente.

* **Image:** Permite mostrar imágenes en la aplicación. Utilizaremos `Image.network` para cargar una imagen desde internet.

* **Icon:** Muestra íconos prediseñados de Material Design.

* **ElevatedButton:** Un botón con un efecto de elevación (sombra) que resalta visualmente.

* **FilledButton:** Un botón moderno con fondo relleno de color, ideal para acciones principales.

### Paso 1: Crear la Pantalla de Elementos UI

Dentro de tu carpeta `lib/screens`, crea un nuevo archivo llamado `ui_elements_screen.dart`.

Copia y pega el siguiente código. Observa cómo utilizamos el estado para alterar el tamaño del texto, activar la negrita y cambiar el color del ícono mediante la botonera inferior:

```dart
import 'package:flutter/material.dart';

class UIElementsScreen extends StatefulWidget {
  const UIElementsScreen({super.key});

  @override
  State<UIElementsScreen> createState() => _UIElementsScreenState();
}

class _UIElementsScreenState extends State<UIElementsScreen> {
  // VARIABLES DE ESTADO
  double _tamanioTexto = 25.0;
  bool _esNegrita = false;
  Color _colorIcono = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text, Image, Icon y Botones'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Playground)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1. TEXT
                  Text(
                    '¡Hola, Flutter!',
                    style: TextStyle(
                      fontSize: _tamanioTexto,
                      fontWeight: _esNegrita ? FontWeight.bold : FontWeight.normal,
                      color: Colors.deepPurple,
                    ),
                  ),
                  
                  // 2. ICON
                  Icon(
                    Icons.favorite,
                    size: 60,
                    color: _colorIcono,
                  ),
                  
                  // 3. IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://picsum.photos/300/150', // Imagen aleatoria
                      width: 300,
                      height: 150,
                      fit: BoxFit.cover, // Ajusta la imagen a la caja
                    ),
                  ),
                  
                  // 4. BOTONES
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Mostrar un mensaje emergente
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('ElevatedButton presionado')),
                          );
                        },
                        child: const Text('Elevated'),
                      ),
                      FilledButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('FilledButton presionado')),
                          );
                        },
                        child: const Text('Filled'),
                      ),
                    ],
                  ),
                ],
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
                    // --- CONTROL: Tamaño de Texto ---
                    Text('Tamaño de Texto: ${_tamanioTexto.toInt()}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Slider(
                      value: _tamanioTexto,
                      min: 15.0,
                      max: 50.0,
                      activeColor: Colors.deepPurple,
                      onChanged: (nuevoValor) {
                        setState(() {
                          _tamanioTexto = nuevoValor;
                        });
                      },
                    ),

                    // --- CONTROL: Texto en Negrita ---
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Texto en Negrita:', style: TextStyle(fontWeight: FontWeight.bold)),
                        Switch(
                          value: _esNegrita,
                          activeColor: Colors.deepPurple,
                          onChanged: (valor) {
                            setState(() {
                              _esNegrita = valor;
                            });
                          },
                        ),
                      ],
                    ),
                    const Divider(),

                    // --- CONTROL: Color del Ícono ---
                    const Text('Color del Ícono:', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _botonColor(Colors.red, 'Rojo'),
                        _botonColor(Colors.green, 'Verde'),
                        _botonColor(Colors.blue, 'Azul'),
                      ],
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

  // Función auxiliar para generar los botones de colores sin repetir código
  Widget _botonColor(Color color, String nombre) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        setState(() {
          _colorIcono = color;
        });
      },
      child: Text(nombre),
    );
  }
}

```

### Paso 2: Conectar la pantalla al Menú Principal

Para poder navegar a esta nueva pantalla, actualicemos nuestro archivo `lib/main.dart`.

1. Asegúrate de importar la nueva pantalla en la parte superior:
```dart
import 'package:catalogo_widgets_app/screens/ui_elements_screen.dart';

```


2. En tu clase `MenuPrincipalScreen`, justo debajo del `ListTile` que creamos en el módulo anterior, agrega el siguiente bloque para nuestra tercera opción:
```dart
          ListTile(
            leading: const Icon(Icons.smart_button, color: Colors.deepPurple),
            title: const Text('3. Elementos UI'),
            subtitle: const Text('Text, Image, Icon y Botones'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UIElementsScreen(),
                ),
              );
            },
          ),
          const Divider(),

```



### Paso 3: Análisis de la Interacción Visual

Guarda los cambios y ejecuta la aplicación.

* Manipula el **Slider** y el **Switch**; observa cómo el widget `Text` responde al instante modificando su propiedad `style`.
* Presiona los botones rojo, verde y azul del panel de control. Esto demuestra cómo podemos enviar parámetros (en este caso, un color) a una función constructora de componentes `_botonColor()` para reaccionar cambiando la propiedad `color` del widget `Icon`.
* Finalmente, presiona los botones del área de previsualización. Al hacerlo, invocamos un `SnackBar`, que es un pequeño mensaje flotante en la parte inferior, validando que el `onPressed` de los botones se ejecutó correctamente.
