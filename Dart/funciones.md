# 5. FUNCIONES

Las funciones son bloques de código autónomos que realizan una tarea específica. Su principal objetivo es la reutilización de código y la organización lógica de los programas, permitiendo que un sistema complejo se divida en partes más pequeñas y manejables.

## 5.1. Definición de Funciones
Una función en Dart se define especificando el tipo de dato que devuelve, su nombre y, opcionalmente, una lista de parámetros entre paréntesis.

```dart
// Función que devuelve una cadena de texto (String)
String obtenerSaludo() {
  return "¡Bienvenidos al curso de Dart!";
}

void main() {
  String mensaje = obtenerSaludo();
  print(mensaje);
}
```

## 5.2. Argumentos Posicionales
Son los argumentos tradicionales donde el orden de los valores enviados al llamar la función debe coincidir exactamente con el orden definido en la declaración. Son obligatorios.

```dart
// Los parámetros 'nombre' y 'ciudad' son posicionales
void mostrarInfo(String nombre, String ciudad) {
  print("Nombre: $nombre, Ciudad: $ciudad");
}

void main() {
  // Llamada obligatoria con ambos valores en orden
  mostrarInfo("Elena", "Sucre");
}
```

## 5.3. Argumentos por Nombre
Permiten que los argumentos se pasen en cualquier orden al invocar la función, utilizando el nombre del parámetro. Se definen encerrando los parámetros entre llaves `{}`. Al ser opcionales, es común usar tipos que acepten nulos (`?`) o asignarles valores por defecto.

```dart
// 'edad' tiene un valor por defecto de 20 si no se envía
String crearPerfil({String? nombre, String? ocupacion, int edad = 20}) {
  return "Usuario: $nombre, Profesión: $ocupacion, Edad: $edad";
}

void main() {
  // Se pueden enviar en cualquier orden indicando el nombre
  print(crearPerfil(ocupacion: "Diseñadora", nombre: "Valeria"));
  
  // O enviar todos los datos, incluyendo el que tiene valor por defecto
  print(crearPerfil(nombre: "Pedro", ocupacion: "Analista", edad: 45));
}
```

## 5.4. Función de Flecha (Arrow Function)
Para funciones que contienen una única expresión, Dart ofrece una sintaxis simplificada utilizando el operador `=>`. Esta sintaxis elimina la necesidad de usar las llaves `{}` y la palabra reservada `return`.

```dart
// Función tradicional
int sumar(int a, int b) {
  return a + b;
}

// Función de flecha equivalente
int sumarFlecha(int a, int b) => a + b;

void main() {
  // También se pueden asignar a variables
  var calcularArea = (int base, int altura) => base * altura;
  
  print("Suma: ${sumarFlecha(10, 20)}");
  print("Área: ${calcularArea(5, 4)}");
}
```
