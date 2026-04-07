# Programación Orientada a Objetos (POO)

## 1. ¿Qué es un paradigma de programación?
Es la forma en que los programadores decidimos cómo irá estructurado nuestro código[cite: 2]. Un paradigma establece un patrón o una forma en la que nuestros programas van a estar organizados[cite: 2].

## 2. ¿Qué es la Programación Orientada a Objetos (POO)?
Es un paradigma de programación que organiza el software en "objetos" que combinan datos o características (**atributos**) y comportamientos o funcionalidades (**métodos**), modelando elementos del mundo real[cite: 2].

*   **Atributos:** Datos y características[cite: 2].
*   **Métodos:** Funcionalidades y comportamientos[cite: 2].

## 3. Clases (Plantilla de un objeto)
Una Clase es la representación en código de lo que es un objeto[cite: 2]. Se conoce también como una plantilla o prototipo a partir del cual se crean copias con la misma estructura pero valores distintos[cite: 2].

### Ejemplo en Dart: Clase Usuario
Basado en el diagrama de la plantilla de usuario[cite: 2]:

```dart
class Usuario {
  // Atributos (Variables)
  String nombre;
  String apellido;
  String correo;
  String password;
  String telefono;

  // Constructor
  Usuario(this.nombre, this.apellido, this.correo, this.password, this.telefono);

  // Métodos (Funciones)
  void encriptarPassword() {
    print("Encriptando contraseña para $nombre...");
  }

  bool verificarPassword(String pass) {
    return this.password == pass;
  }

  void iniciarSesion() {
    print("Sesión iniciada para $correo");
  }
}
```

### 3.1. Relación entre Clases
Los objetos pueden relacionarse entre sí para realizar funcionalidades conjuntas o trabajar de forma individual[cite: 2]. Por ejemplo, un objeto **Autor** y una **Categoría** pueden conectarse con un objeto **Blog**[cite: 2].

## 4. Instancia de una clase (Objeto funcional)
Cada copia que hacemos de una clase es un objeto; en programación, esto se llama **instancia**[cite: 2]. Es una realización concreta de la plantilla que reside en la memoria con valores únicos[cite: 2].

### Ejemplo en Dart: Creación de Instancias
Modelando a Tony Stark y Peter Parker[cite: 2]:

```dart
void main() {
  // Instancia 1: Usuario 1
  Usuario usuario1 = Usuario("Tony", "Stark", "tony@gmail.com", "123abc", "555-0101");

  // Instancia 2: Usuario 2
  Usuario usuario2 = Usuario("Peter", "Parker", "peter@gmail.com", "456xyz", "555-0202");

  usuario1.iniciarSesion();
  usuario2.encriptarPassword();
}
```

---

## 5. Cuatro Pilares de la POO

### 5.1. Abstracción
Es el proceso de identificar las características y comportamientos esenciales de un objeto, ignorando los detalles complejos e innecesarios (como "color de piel" o "lunares" si no son relevantes para el sistema)[cite: 2].

En Dart, esto se implementa a menudo mediante **clases abstractas**, las cuales no se pueden instanciar directamente[cite: 2].

```dart
abstract class VehiculoBase {
  String marca;
  VehiculoBase(this.marca);

  // Método abstracto: define QUÉ hace, pero no CÓMO
  void iniciarRuta(); 
}
```

### 5.2. Herencia
Mecanismo que permite a una clase hija (subclase) heredar atributos y métodos de una clase padre (superclase), promoviendo la reutilización de código bajo una jerarquía "es-un"[cite: 2].

```dart
class Vehiculo {
  String placa;
  String marca;
  
  Vehiculo(this.placa, this.marca);

  void acelerar() => print("Acelerando...");
  void frenar() => print("Frenando...");
}

// Subclase Motocicleta
class Motocicleta extends Vehiculo {
  double peso;
  Motocicleta(String placa, String marca, this.peso) : super(placa, marca);

  void usarCasco() => print("Casco puesto.");
}
```

### 5.3. Polimorfismo
Es la capacidad de diferentes clases de responder al mismo método de formas distintas[cite: 2]. Permite que una subclase cambie el comportamiento predeterminado de los métodos de su superclase[cite: 2].

```dart
abstract class Forma {
  void dibujar();
}

class Circulo extends Forma {
  @override
  void dibujar() => print("Dibujando un Círculo.");
}

class Triangulo extends Forma {
  @override
  void dibujar() => print("Dibujando un Triángulo.");
}
```

### 5.4. Encapsulamiento
Consiste en restringir el acceso directo a los datos internos para proteger la integridad del objeto[cite: 2]. Se utiliza una interfaz pública (Getters y Setters) para interactuar con atributos privados de manera controlada[cite: 2].

En Dart, la privacidad se indica con el guion bajo (`_`)[cite: 2].

```dart
class CuentaBancaria {
  double _saldo = 0; // Atributo privado

  // Getter (Accesor)
  double get saldo => _saldo;

  // Setter (Mutador) con validación
  set deposito(double valor) {
    if (valor > 0) {
      _saldo += valor;
    }
  }
}
```

---

## 6. Mixins
Un **mixin** en Dart permite reutilizar código en múltiples jerarquías de clases sin usar la herencia tradicional[cite: 2]. Se "inyectan" funcionalidades usando la palabra clave `with`[cite: 2].

**Características:**
*   Comparten comportamientos entre clases no relacionadas jerárquicamente[cite: 2].
*   Se declaran con `mixin` y no pueden tener constructores[cite: 2].



### Ejemplo en Dart: Comportamientos de Animales
Basado en el diagrama de animales[cite: 2]:

```dart
abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

mixin Volador {
  void volar() => print("Estoy volando");
}

mixin Caminante {
  void caminar() => print("Estoy caminando");
}

mixin Nadador{
  void nadar() => print("Estoy nadando");
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Volador, Caminante {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}

class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volador {}

void main() {
  final delfi = Delfin();
  delfi.nadar();

  final batman = Murcielago();
  batman.caminar();
  batman.volar();

  final Lucas = Pato();
  Lucas.caminar();
  Lucas.nadar();
  Lucas.volar();
}
```
