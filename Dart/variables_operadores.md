# 2. VARIABLES Y OPERADORES

En Dart, las variables son contenedores que reservan un espacio en la memoria para almacenar datos, mientras que los operadores son símbolos especiales que permiten manipular dichos datos mediante cálculos o comparaciones.

## 2.1. Variables (`var`, `dynamic`)

Dart ofrece diferentes formas de declarar variables dependiendo de qué tan flexible necesitemos que sea el tipado:

* **`var`**: Es la forma estándar de declarar una variable con **inferencia de tipos**. Una vez que se le asigna un valor inicial, Dart bloquea ese tipo de dato y no puede cambiarse después.
* **`dynamic`**: Se utiliza cuando no conocemos el tipo de dato de antemano o cuando necesitamos que la variable cambie de tipo durante la ejecución del programa (por ejemplo, de un número a un texto).

```dart
void main() {
  // Uso de var: Dart infiere que es una lista de Strings
  var listaEjemplo = ["rojo", "verde", "azul"]; 
  
  // Uso de dynamic: Puede cambiar su naturaleza
  dynamic comodin = 100;
  comodin = "Ahora soy un texto"; 
}
```

## 2.2. Constantes (`const`, `final`)

Para valores que no deben cambiar una vez asignados, Dart proporciona dos palabras clave:

* **`final`**: Se usa para variables que solo se pueden establecer una vez. Su valor puede ser determinado en tiempo de ejecución (por ejemplo, el resultado de una función).
* **`const`**: Se utiliza para constantes de tiempo de compilación. El valor debe ser conocido antes de que el programa se ejecute.

## 2.3. Operadores Aritméticos

Permiten realizar operaciones matemáticas sobre tipos de datos numéricos (`int` y `double`). Los más comunes son:

* Suma (`+`)
* Resta (`-`)
* Multiplicación (`*`)
* División (`/`)
* Módulo o residuo (`%`)

```dart
void main() {
  int a = 10;
  int b = 3;
  
  int producto = a * b; // 30
  double division = a / b; // 3.33...
}
```

## 2.4. Operadores Relacionales

Se utilizan para comparar dos valores y siempre devuelven un resultado booleano (`true` o `false`):

* Igual que (`==`)
* Diferente de (`!=`)
* Mayor que (`>`) y Menor que (`<`)
* Mayor o igual que (`>=`) y Menor o igual que (`<=`)

## 2.5. Operadores Lógicos

Permiten combinar múltiples expresiones booleanas para formar condiciones más complejas:

* **AND (`&&`)**: Devuelve verdadero solo si ambas condiciones son ciertas.
* **OR (`||`)**: Devuelve verdadero si al menos una de las condiciones es cierta.
* **NOT (`!`)**: Invierte el valor booleano (de true a false y viceversa).
