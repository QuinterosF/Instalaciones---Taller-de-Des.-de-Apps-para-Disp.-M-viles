# 4. Configuración de Emuladores y Dispositivos Físicos

Para poder probar nuestras aplicaciones de Flutter mientras programamos, necesitamos un dispositivo. Podemos usar un emulador (un dispositivo virtual que corre en la computadora) o un dispositivo físico real. 

A continuación veremos cómo configurar ambos métodos, con recomendaciones de rendimiento basadas en las mejores prácticas de desarrollo.

## 4.1. Crear un Android Emulator (AVD)

Si tu computadora tiene buenos recursos (más de 8GB de RAM), puedes optar por crear un emulador desde Android Studio.

1. Abre **Android Studio**.
2. Haz clic en **More Actions** y selecciona **Virtual Device Manager**.
3. Haz clic en **Create Device**.

### Seleccionar y configurar el Hardware
4. **Perfil del dispositivo:** Puedes seleccionar uno existente (como el Pixel 7) o crear un *New Hardware Profile* a medida (por ejemplo, imitando un Galaxy S23). Haz clic en **Next**.
5. **System Image:** Descarga y selecciona una versión reciente de Android (API Level 33, 34, etc.). Haz clic en **Next**.
6. **Show Advanced Settings:** ¡Esta es la parte más importante! Haz clic en "Show Advanced Settings" para modificar el rendimiento:
   * **Graphics:** Si tienes una tarjeta de video independiente (NVIDIA/AMD), asegúrate de que esté seleccionada la aceleración por **Hardware**. Esto dará un salto de rendimiento tremendo. Si no sabes, déjalo en *Automatic*.
   * **RAM:** Asígnale al menos **2 GB (2048 MB)**. Si tu PC tiene 16GB de RAM o más, te recomendamos asignarle **4 GB (4096 MB)** para que corra fluido.
   * **Internal Storage:** ¡Súbelo a **4 GB (4096 MB)**! El sistema operativo Android ya ocupa unos 700MB. Si lo dejas en 2GB, pronto tendrás que estar borrando aplicaciones manualmente por falta de espacio de almacenamiento.
   * **Quick Boot:** Asegúrate de que "Quick Boot" esté habilitado para que el emulador se inicie rápidamente en futuras ocasiones.

7. Haz clic en **Finish**. ¡Ya puedes darle al botón de *Play* para lanzar tu emulador!

---

## 4.2. Usar un Dispositivo Físico (Recomendado)

Si tu computadora no tiene características muy potentes o simplemente prefieres la fluidez natural, probar directamente en tu teléfono Android es la mejor opción. 

### Paso A: Habilitar Opciones de Desarrollador
1. En tu teléfono, ve a **Ajustes** > **Acerca del teléfono** (About phone).
2. Busca la opción **Número de compilación** (Build number).
3. Toca esta opción unas **7 veces seguidas** hasta que el teléfono te pida tu PIN y te muestre el mensaje: *"¡Ya eres desarrollador!"*.

### Paso B: Activar el modo de depuración
1. Regresa al menú de **Ajustes** y entra a **Sistema** > **Opciones de desarrollador** (Developer options).
2. Asegúrate de que el interruptor general esté encendido.
3. **Depuración por USB (USB Debugging):** Activa esta opción. Es obligatoria para poder instalar la app desde la PC.
4. **Pantalla activa (Stay Awake):** **¡Súper recomendado!** Activa la opción que dice *Pantalla encendida al cargar* o *Stay Awake*. Esto evitará que la pantalla de tu teléfono se bloquee o apague cada 30 segundos mientras estás probando código, ahorrándote mucha frustración.

---

## 4.3. Probar la conexión (Hot Reload en VS Code)

Con el emulador encendido o tu dispositivo físico conectado por USB (recuerda darle "Permitir" si sale un cuadro de diálogo en tu celular):

1. Abre tu editor de código (por ejemplo, **Visual Studio Code**).
2. En la parte inferior derecha, busca la opción **"Select Device"**.
3. Selecciona tu teléfono físico o tu emulador de la lista.
4. Presiona **F5** para lanzar la aplicación. La primera vez puede tardar un poco mientras compila, pero después podrás hacer cambios en tu código, presionar `Ctrl + S` y ver cómo la interfaz se actualiza instantáneamente en tu teléfono (Hot Reload).

---

> **¡Felicidades!** Tu entorno ya está 100% configurado y listo.
