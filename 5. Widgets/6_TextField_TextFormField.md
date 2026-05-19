## Módulo 6: Formularios y Entrada de Datos (TextField y TextFormField)

En esta sección abordaremos dos componentes esenciales para la captura de texto:

* **TextField:** Es el cuadro de texto básico donde el usuario puede escribir información. Es ideal para búsquedas simples o ingresos de datos rápidos donde no requerimos una validación estricta.

* **TextFormField:** Es una versión avanzada y mejorada de `TextField` diseñada específicamente para usarse dentro de un widget `Form`. Su principal ventaja es que incluye funciones de validación para formularios, devolviendo mensajes de error si los datos ingresados no cumplen ciertos criterios (como un correo sin el arroba o contraseñas cortas).

### Paso 1: Crear la Pantalla de Entradas de Texto

En tu carpeta `lib/screens`, crea el archivo `inputs_screen.dart`.

Vamos a dividir nuestra pantalla nuevamente. En la parte superior veremos cómo los datos se actualizan en tiempo real creando una "Tarjeta de Presentación". En la parte inferior, colocaremos los campos de entrada.

Copia y pega el siguiente código:

```dart
import 'package:flutter/material.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  // VARIABLES DE ESTADO
  String _nombreUsuario = "Usuario Anónimo";
  String _correoValidado = "Sin correo registrado";
  
  // LLAVE GLOBAL PARA EL FORMULARIO
  // Esto nos permite identificar el Form y ejecutar sus validaciones desde un botón
  final _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Datos'),
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // MITAD SUPERIOR: Área de previsualización (Tarjeta en vivo)
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: Card(
                  elevation: 5,
                  color: Colors.orange.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.account_circle, size: 80, color: Colors.orange),
                        const SizedBox(height: 10),
                        Text(
                          _nombreUsuario,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _correoValidado,
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // MITAD INFERIOR: Panel de controles (Inputs y Formulario)
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              color: Colors.grey.shade100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1. TextField (Actualización en tiempo real)', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    // TEXTFIELD SIMPLE
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Escribe tu nombre",
                        border: const OutlineInputBorder(), // Borde alrededor del campo
                        prefixIcon: const Icon(Icons.person),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange.shade800, width: 2),
                        ),
                      ),
                      onChanged: (valor) {
                        // El evento onChanged captura cada letra que el usuario escribe
                        setState(() {
                          // Si el campo está vacío, volvemos al valor por defecto
                          _nombreUsuario = valor.isEmpty ? "Usuario Anónimo" : valor;
                        });
                      },
                    ),
                    const Divider(height: 40),

                    const Text('2. TextFormField (Validación por Formulario)', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    
                    // FORMULARIO Y TEXTFORMFIELD
                    Form(
                      key: _formKey, // Asignamos la llave al formulario
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Correo electrónico",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email),
                            ),
                            // La función validator revisa el texto antes de guardarlo
                            validator: (valor) {
                              if (valor == null || valor.isEmpty) {
                                return 'El correo es obligatorio';
                              } else if (!valor.contains('@')) {
                                return 'Debe ser un correo válido (necesita @)';
                              }
                              return null; // Null significa que pasó la validación
                            },
                            // onSaved se ejecuta solo cuando le decimos al formulario que guarde
                            onSaved: (valor) {
                              setState(() {
                                _correoValidado = valor!;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          
                          // BOTÓN PARA VALIDAR EL FORMULARIO
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(backgroundColor: Colors.orange.shade800),
                              icon: const Icon(Icons.save),
                              label: const Text('Validar y Guardar Correo'),
                              onPressed: () {
                                // Ejecutamos la validación a través de la GlobalKey
                                if (_formKey.currentState!.validate()) {
                                  // Si todo es válido (retornó null), guardamos los datos
                                  _formKey.currentState!.save();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Correo guardado con éxito', style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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

### Paso 2: Conectar la pantalla al Menú Principal

Como en los pasos anteriores, vamos a enlazar esta nueva ruta en nuestro archivo `lib/main.dart`.

1. Importa la nueva pantalla en la parte superior:
```dart
import 'package:catalogo_widgets_app/screens/inputs_screen.dart';

```


2. Añade un nuevo `ListTile` dentro del `ListView` en la clase `MenuPrincipalScreen`:
```dart
          ListTile(
            leading: const Icon(Icons.keyboard, color: Colors.orange),
            title: const Text('4. Formularios y Entradas'),
            subtitle: const Text('TextField y TextFormField'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InputsScreen(),
                ),
              );
            },
          ),
          const Divider(),

```



### Paso 3: Análisis de la Captura de Datos

Ejecuta la aplicación y entra a la sección de Formularios. Aquí hay dos comportamientos fascinantes que los futuros ingenieros de software deben notar:

1. **El efecto de `onChanged`:** Empieza a escribir en el campo de "Nombre". Notarás que por cada letra que pulsas, el estado de la aplicación se redibuja y la Tarjeta de Presentación superior se actualiza instantáneamente. Esta es una interacción asíncrona fluida.
2. **El poder de `GlobalKey<FormState>`:** Escribe algo sin el símbolo `@` en el campo de correo y presiona "Validar y Guardar". El widget `Form` coordina la validación y dispara automáticamente el mensaje rojo de error que programamos. La tarjeta de arriba no se actualizará hasta que ingreses un correo correcto y el método `validator` retorne `null` (lo que indica que no hay errores).



A través de la clase `InputDecoration`, también hemos personalizado la estética de ambas entradas añadiendo bordes e íconos `prefixIcon`.
