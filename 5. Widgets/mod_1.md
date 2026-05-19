# Práctica de Laboratorio 1: Fundamentos, Navegación e Interactividad Básica en Flutter

**Objetivo de la Práctica:** Comprender la jerarquía del árbol de widgets, construir un menú dinámico de navegación y manipular propiedades visuales mediante la gestión de estados (`StatefulWidget`).

---

## 1. Anatomía del Punto de Entrada y Configuración Global

Al crear un nuevo proyecto en Flutter, el entorno genera un archivo de demostración (la clásica aplicación del contador). Nuestro primer paso como desarrolladores es borrar este código autogenerado para construir nuestra propia arquitectura desde los cimientos.

Toda la magia de Flutter inicia en un solo archivo: `lib/main.dart`.

### 1.1 El Punto de Entrada: La función `main()`

Flutter utiliza el lenguaje de programación Dart. En Dart, como en C++ o Java, la ejecución de cualquier programa debe comenzar obligatoriamente por una función principal llamada `main()`.

* **Sintaxis:**
```dart
void main() {
  runApp(const MyApp());
}

```


* **Análisis de la función `runApp()`:** Esta es una función nativa y fundamental de Flutter. Su único trabajo es tomar el widget que le pasemos como parámetro (en este caso, una instancia de nuestra clase `MyApp`) e "inflarlo" para que ocupe absolutamente toda la pantalla del dispositivo físico o emulador. Es el puente entre el código de Dart y el motor de renderizado visual.

### 1.2 El Configurador del Sistema: El Widget `MaterialApp`

El widget `MaterialApp` es el contenedor organizativo supremo de nuestra aplicación.  Es importante entender que este widget no dibuja elementos visuales directos (no es un botón, ni un texto), sino que envuelve a toda la aplicación para proveerle las herramientas y estándares visuales de Material Design de Google.

* **Propiedades y Parámetros Principales:**
* `title`: Recibe un `String`. Define el nombre interno de la aplicación (útil para cuando el usuario minimiza la app y ve los procesos recientes en su sistema operativo).
* `debugShowCheckedModeBanner`: Recibe un booleano (`true` o `false`). Su única función es mostrar u ocultar la etiqueta roja de "DEBUG" que aparece en la esquina superior derecha durante la fase de desarrollo.
* `theme`: Recibe un objeto de tipo `ThemeData`. En lugar de darle color a cada botón de la app uno por uno, aquí configuramos la paleta de colores global (`colorScheme`) y las tipografías para mantener la consistencia en todo el proyecto.
* `home`: Es la propiedad más importante de la navegación inicial. Define cuál es la primera ruta (pantalla) que se renderizará apenas termine de cargar la aplicación.



### 💻 Práctica 1.1: Limpieza y Código Base

Abre el archivo `lib/main.dart`, borra todo su contenido y escribe la siguiente estructura para inicializar nuestra app:

```dart
import 'package:flutter/material.dart';

// 1. Punto de arranque de la aplicación
void main() {
  runApp(const MyApp());
}

// 2. Clase principal estática (no cambiará su estado global)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. Retornamos el contenedor Material
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Catálogo de Widgets',
      theme: ThemeData(
        // Genera una paleta de colores armónica a partir del color DeepPurple
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      // Nota: MenuPrincipalScreen marcará un error temporalmente 
      // hasta que programemos esa clase en el Módulo 2
      home: const MenuPrincipalScreen(), 
    );
  }
}

```

---

## 2. Anatomía de la Pantalla Principal y Listas Dinámicas

Una vez que hemos configurado el `MaterialApp` (el administrador global), necesitamos un "lienzo" donde pintar nuestra interfaz. En Flutter, no colocamos textos o botones flotando en el vacío; necesitamos estructuras que sigan guías de diseño establecidas.

### 2.1 El Andamiaje Principal: El Widget `Scaffold`

La palabra *Scaffold* se traduce como "andamio". Es el widget estructural por excelencia en Material Design. Su propósito es proporcionarnos "ranuras" o áreas predefinidas para colocar los elementos comunes de una aplicación moderna.

* **Propiedades Fundamentales:**
* `appBar`: Recibe un widget `AppBar`. Es el espacio reservado para la barra de herramientas superior (donde suele ir el título de la pantalla y el botón de retroceso).
* `body`: Es el área de trabajo principal o "cuerpo". Ocupa todo el espacio restante en la pantalla debajo del `AppBar`. Aquí es donde vivirá la mayor parte de nuestra interfaz.
* `floatingActionButton` *(Opcional)*: Recibe un botón flotante circular que se posiciona de forma fija, usualmente en la esquina inferior derecha.

---

### 2.1.1. `backgroundColor: Theme.of(context).colorScheme.inversePrimary`

### 1. `inversePrimary` (El destino)

Es una propiedad específica dentro de la paleta de colores (`ColorScheme`) de Material 3. Representa una versión contrastante o "invertida" del color primario de la aplicación. Por ejemplo, si el color primario de tu tema es un morado oscuro, el `inversePrimary` será un tono lila claro. Es el color que Flutter recomienda usar por defecto para las barras superiores (`AppBar`) en la última versión de diseño.

### 2. `colorScheme` (La paleta)

Es el objeto que almacena el conjunto de colores funcionales de la aplicación (colores para errores, fondos, textos, botones primarios, etc.). Garantiza que toda la aplicación sea visualmente armónica.

### 3. `Theme.of(context)` (El buscador)

Aquí está el concepto de ingeniería más importante:

* **`Theme.of()`** es un método estático que viaja hacia arriba en el árbol de widgets buscando el widget `Theme` más cercano (que configuramos dentro de `MaterialApp`).
* **`context` (BuildContext):** Es el mapa de ubicación. Sin el `context`, la aplicación no sabría en qué parte de la pantalla se está dibujando este elemento y no podría heredar los colores del tema general.

---

### Explicación (Analogía de la herencia)

Imaginen que la aplicación es una estructura jerárquica:

```
[MaterialApp]  <--- Aquí definimos el tema: "Hoy el color base es DeepPurple"
      |
   [Scaffold]
      |
   [AppBar]    <--- Pregunta: "¿De qué color me pinto?"

```

Cuando el `AppBar` ejecuta `Theme.of(context).colorScheme.inversePrimary`, lo que está haciendo matemáticamente es:

1. A través del **`context`**, mira hacia su padre (`MaterialApp`).
2. Accede al **`Theme`** global.
3. Extrae la paleta **`colorScheme`**.
4. Toma el color exacto asignado a **`inversePrimary`**.

**¿Cuál es la ventaja de enseñarles esto?** Si el día de mañana cambias el color base de la aplicación de morado a verde en el `MaterialApp`, **todas** las pantallas que tengan esta línea cambiarán de color automáticamente sin necesidad de modificar el código de cada `AppBar` una por una.

---


### 2.2 Entendiendo las Listas: `ListView`

Para construir el menú de nuestro catálogo, necesitamos apilar opciones una debajo de la otra. Si utilizamos una simple columna estática (`Column`) y agregamos demasiados elementos, la aplicación excederá el límite físico de los píxeles de la pantalla, provocando un error crítico llamado **Overflow** (desbordamiento).

Para evitar esto, utilizamos **`ListView`**.

* **¿Qué hace?** Es un widget que dispone a sus hijos secuencialmente y, de forma automática, habilita el desplazamiento (scroll) cuando el contenido sobrepasa los límites de la pantalla.
* **Propiedad clave:** A diferencia de widgets como `Center` que solo reciben un hijo (`child`), `ListView` recibe una lista de hijos mediante la propiedad `children: []`.

### 2.3 La Celda Perfecta: El Widget `ListTile`

Dentro del `ListView`, podríamos poner simples textos, pero Material Design nos ofrece **`ListTile`**, una fila pre-configurada estéticamente impecable para menús y listas.

* **Anatomía del `ListTile`:**
* `leading`: El elemento a la izquierda (el inicio de la fila). Usualmente recibe un widget `Icon`.
* `title`: El componente principal de la celda, ubicado en la parte superior central. Recibe un widget `Text`.
* `subtitle`: Texto secundario de menor tamaño ubicado debajo del título.
* `trailing`: El elemento a la derecha (el final de la fila). Suele usarse para íconos de interacción (como una flecha `Icons.arrow_forward_ios` o un interruptor `Switch`).
* `onTap`: Una función anónima `() {}` que se dispara instantáneamente cuando el usuario presiona cualquier parte de la celda.



### 2.4 El Sistema de Rutas: `Navigator`

En el desarrollo móvil, la navegación se maneja conceptualmente como una **Pila de Cartas (Stack)**. La pantalla que estás viendo es la carta que está arriba de la pila.

* Para navegar hacia una **nueva pantalla**, colocamos una carta encima usando **`Navigator.push`**.
* Para **regresar**, quitamos la carta superior usando **`Navigator.pop`** (Flutter suele hacer esto automáticamente al presionar el botón "Atrás" del `AppBar`).
* **Anatomía del comando de navegación:**
```dart
Navigator.push(
  context, 
  MaterialPageRoute(builder: (context) => const PantallaDestino()),
);

```


* `context`: Es el objeto `BuildContext`. Funciona como el "GPS" de Flutter. Le dice al framework en qué rama exacta del árbol de widgets se encuentra el usuario en ese momento.
* `MaterialPageRoute`: Es una clase encargada de construir la nueva pantalla y gestionar la animación de transición nativa (por ejemplo, deslizar desde la derecha en iOS, o desvanecer hacia arriba en Android).



---

### 💻 Práctica 2.1: Implementación del Menú Principal

Regresa a tu archivo `lib/main.dart`. Justo debajo de la clase `MyApp` (fuera de sus llaves de cierre), vamos a crear la clase para nuestra pantalla principal aplicando todos los conceptos aprendidos.

Escribe el siguiente código:

```dart
// Esta clase representa nuestra primera pantalla completa
class MenuPrincipalScreen extends StatelessWidget {
  const MenuPrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Retornamos el andamio estructural
    return Scaffold(
      // 2. Configuramos la barra superior
      appBar: AppBar(
        title: const Text('Inicio - Catálogo de Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
      ),
      // 3. El cuerpo será una lista desplazable
      body: ListView(
        children: [
          // 4. Nuestra primera opción del menú
          ListTile(
            leading: const Icon(Icons.crop_square, color: Colors.teal),
            title: const Text('1. Container, Padding y SizedBox'),
            subtitle: const Text('Cajas, márgenes y espacios'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // 5. Ejecutamos la navegación al presionar
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContainerScreen(), 
                ),
              );
            },
          ),
          // Un divisor visual para separar opciones
          const Divider(), 
        ],
      ),
    );
  }
}

```

--

## 3. El Poder del Estado y la Anatomía de las Cajas

Hasta este punto, hemos construido una pantalla principal estática. Ahora, daremos el salto más importante en Flutter: hacer que nuestra aplicación reaccione a las acciones del usuario.

Antes de escribir el código de nuestra pantalla interactiva, debemos entender las herramientas y conceptos matemáticos/visuales que utilizaremos.

### 3.1. La Revolución del Estado: `StatelessWidget` vs `StatefulWidget`

Imagina que quieres dibujar un interruptor de luz.

* Un **`StatelessWidget` (Widget sin estado)** es como una *fotografía* de un interruptor. Una vez que la imprimes y la pegas en la pantalla, ya no puede cambiar. Si internamente en el código cambias la variable de "apagado" a "encendido", la fotografía seguirá mostrando el interruptor apagado porque es inmutable (no se puede redibujar).
* Un **`StatefulWidget` (Widget con estado)** es un *interruptor real*. Tiene memoria (Estado) y sabe si está encendido o apagado.

Para que este interruptor real funcione, necesita un motor, y ese motor se llama **`setState((){})`**.

* **La regla de oro de `setState`:** Si tienes una variable `ancho = 100` y la cambias a `ancho = 200`, la pantalla **no se actualizará sola**. Al envolver ese cambio dentro de `setState((){ ancho = 200; })`, le estás enviando un mensaje urgente al framework de Flutter: *"¡Atención! Un dato visual acaba de cambiar. Por favor, vuelve a dibujar (renderizar) esta pantalla inmediatamente con los nuevos valores"*.

### 3.2. Anatomía de la Caja Multiusos: El Widget `Container`

El `Container` es el equivalente a un bloque de Lego base. Por sí solo es invisible, pero es el widget más versátil para crear diseños. Funciona como una caja de cartón a la que puedes darle forma, color y estilo.

**Propiedad crucial: `decoration`**

Para darle estilo a un `Container` usamos la propiedad `decoration`, la cual recibe un objeto `BoxDecoration`. Aquí configuramos su estética:

* `color`: Pinta el fondo de la caja.
* `borderRadius`: Redondea las esquinas. Recibe un objeto `BorderRadius.circular(valor)` para aplicar una curva matemática a las cuatro esquinas.
* `boxShadow`: Permite agregar sombras para crear un efecto de elevación (3D).

> ⚠️ **Peligro Crítico (Error común de principiantes):**
> Si decides usar la propiedad `decoration` en un `Container`, **el color de fondo debe ir OBLIGATORIAMENTE dentro del `BoxDecoration`**. Si pones un color afuera del `decoration` y otro adentro, Flutter sufrirá una "colisión de diseño" y la aplicación se cerrará con una pantalla roja de error.

### 3.3. Anatomía de los Espacios: `Padding` y `EdgeInsets`

En el diseño de interfaces, si pegamos un texto directamente al borde de la pantalla, se ve estéticamente mal y difícil de leer. Para solucionar esto usamos el widget **`Padding`** (Relleno o Margen interno).

El widget `Padding` tiene una propiedad obligatoria llamada `padding`, la cual no recibe un simple número, sino un objeto geométrico llamado **`EdgeInsets`** (Inserciones de bordes).

Existen 3 formas principales de usar `EdgeInsets`:

1. `EdgeInsets.all(10.0)`: Aplica exactamente 10 píxeles de espacio en los 4 lados (Arriba, Abajo, Izquierda, Derecha).
2. `EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0)`: Aplica 20 píxeles a la izquierda/derecha, y 5 píxeles arriba/abajo.
3. `EdgeInsets.only(top: 15.0)`: Aplica espacio únicamente en el lado especificado (en este caso, 15 píxeles solo en la parte superior).

### 3.4. El Controlador de Tamaño: El Widget `SizedBox`

Si un `Container` es una caja de cartón decorada, un **`SizedBox`** es un cubo de cristal invisible y rígido. Su única función en la vida es obligar a que el espacio que ocupa tenga un ancho (`width`) y un alto (`height`) matemáticamente exactos.

**Se usa para dos cosas:**

1. **Forzar tamaño:** Si envuelves un botón dentro de un `SizedBox(width: 200)`, el botón se estirará obligatoriamente a 200 píxeles, sin importar si su texto es corto o largo.
2. **Crear separaciones:** Si tienes dos textos apilados y quieres separarlos, puedes poner un `SizedBox(height: 20)` vacío entre ellos. Actuará como un ladrillo invisible que empuja los elementos, separándolos por 20 píxeles.

---

## Construyendo el Playground Interactivo

Con la teoría clara sobre el Estado, el `Container` y los espacios, es hora de programar. Vamos a crear una pantalla dividida en dos: la mitad superior mostrará nuestro `Container` (la vista previa) y la mitad inferior tendrá los controles deslizantes (`Slider`) para modificarlo en tiempo real.

### 3.5. Creación del Archivo y el `StatefulWidget`

Para mantener nuestro proyecto ordenado bajo estándares profesionales, no escribiremos todo en el `main.dart`.

1. En Visual Studio Code, dentro de la carpeta `lib`, crea una nueva carpeta llamada `screens`.
2. Dentro de `screens`, crea un archivo llamado `container_screen.dart`.
3. Escribe `stful` y presiona la tecla `Tab` (o `Enter`). Visual Studio Code generará automáticamente la estructura de un **StatefulWidget**. Nómbralo `ContainerScreen`.

Notarás que Flutter crea **dos clases** conectadas:

1. `class ContainerScreen`: Es la configuración pública de la pantalla.
2. `class _ContainerScreenState`: Es la clase privada (indicada por el guion bajo `_`) que guarda la memoria de la pantalla y dibuja la interfaz. Aquí es donde trabajaremos.

### 3.6. Definiendo las Variables de Estado

Dentro de la clase `_ContainerScreenState`, antes del método `build`, declararemos las variables que van a cambiar. En Dart, colocar un guion bajo al inicio del nombre de una variable (ej. `_dimension`) la hace "privada", una excelente práctica de encapsulamiento en ingeniería de software.

```dart
class _ContainerScreenState extends State<ContainerScreen> {
  // VARIABLES DE ESTADO (Memoria de la pantalla)
  double _dimension = 150.0; // Valor inicial del ancho y alto
  double _radioBorde = 0.0;  // Valor inicial de las esquinas (cuadrado perfecto)
  
  // ... método build ...
}

```

### 3.7. El Controlador de Interfaz: El Widget `Slider`

Para modificar nuestras variables `_dimension` y `_radioBorde`, usaremos un widget nativo llamado `Slider` (Control deslizante).

* **Anatomía del `Slider`:**
* `value`: Recibe la variable actual que va a representar en la barra (ej. `_dimension`).
* `min` y `max`: Establecen los límites matemáticos permitidos.
* `onChanged`: Es la función que se dispara cada milisegundo mientras el usuario arrastra el control. Recibe un parámetro (el `nuevoValor`) que usaremos para actualizar nuestra variable dentro de un `setState`.



### 💻 Práctica 3.2: El Código Completo de la Pantalla

A continuación, escribiremos el código de nuestra interfaz. Presta especial atención a los comentarios en el código, ya que explican cómo el widget `Expanded` nos ayuda a dividir la pantalla matemáticamente.

Copia este código en tu archivo `container_screen.dart`:

```dart
import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  // 1. Nuestras variables reactivas
  double _dimension = 150.0;
  double _radioBorde = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground: Container'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      // Usamos Column para apilar la vista previa arriba y los controles abajo
      body: Column(
        children: [
          // 2. ÁREA DE VISTA PREVIA
          // Expanded obliga a su hijo a tomar todo el espacio restante disponible.
          // Al usar dos Expanded, la pantalla se divide exactamente 50/50.
          Expanded(
            child: Center(
              // SizedBox fuerza al Container a tener un tamaño exacto
              child: SizedBox(
                width: _dimension, // Conectado a la variable
                height: _dimension, // Conectado a la variable
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    // Conectado a la variable
                    borderRadius: BorderRadius.circular(_radioBorde), 
                    // Una sombra sutil para dar efecto 3D
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))
                    ],
                  ),
                  child: const Center(
                    child: Text('Caja', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
          
          // 3. ÁREA DE CONTROLES
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0), // Margen interno de 20px
              color: Colors.grey.shade100, // Fondo gris claro para diferenciar el panel
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- CONTROL 1: TAMAÑO ---
                  // Usamos .toInt() para mostrar el número sin decimales en el texto
                  Text('Tamaño de la Caja: ${_dimension.toInt()} px', 
                       style: const TextStyle(fontWeight: FontWeight.bold)),
                  Slider(
                    value: _dimension,
                    min: 50.0,
                    max: 250.0,
                    activeColor: Colors.teal,
                    onChanged: (nuevoValor) {
                      // CRÍTICO: setState avisa a Flutter que debe redibujar la pantalla
                      setState(() {
                        _dimension = nuevoValor;
                      });
                    },
                  ),
                  const SizedBox(height: 20), // Separador invisible
                  
                  // --- CONTROL 2: BORDES ---
                  Text('Radio del Borde: ${_radioBorde.toInt()} px', 
                       style: const TextStyle(fontWeight: FontWeight.bold)),
                  Slider(
                    value: _radioBorde,
                    min: 0.0,
                    max: 125.0, // 125 es la mitad de 250 (el tamaño máximo), lo que generará un círculo perfecto
                    activeColor: Colors.teal,
                    onChanged: (nuevoValor) {
                      setState(() {
                        _radioBorde = nuevoValor;
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

```

### 3.8. Conectando el Menú Principal (Resolviendo el Error)

¿Recuerdas que en el Módulo 2 dejamos un error intencional en `main.dart` porque `ContainerScreen` no existía? Es hora de enlazar ambas pantallas.

Ve a tu archivo `lib/main.dart`. En la parte superior (debajo de la importación de `material.dart`), agrega la ruta a tu nuevo archivo:

```dart
import 'package:catalogo_widgets_app/screens/container_screen.dart';

```

Al hacer esto, el error en tu `ListTile` desaparecerá.
