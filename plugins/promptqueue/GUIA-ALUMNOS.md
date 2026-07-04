# Guía de promptqueue para alumnos

`promptqueue` es un plugin de **Claude Code** que te da una cola de tareas: apuntas
en un archivo markdown todo lo que quieres que Claude haga en tu proyecto, y luego
lo ejecutas en orden, de una en una o todo seguido. Deja de escribir mega-prompts
con cinco cosas a la vez: apunta, ordena y dispara.

## 1. Instalación (una sola vez)

Abre Claude Code en cualquier proyecto y ejecuta estos dos comandos:

```
/plugin marketplace add ruposhop/rupgo-plugins
/plugin install promptqueue@rupgo-plugins
```

Listo. El plugin queda instalado para todos tus proyectos.

## 2. Primeros pasos

En el proyecto donde quieras trabajar:

1. **Crea la cola:**

   ```
   /promptqueue:init
   ```

   Esto crea `prompts-queue.md` en la raíz del proyecto y lo abre en VSCode.
   Dentro verás las instrucciones y una tarea de ejemplo.

2. **Añade tus tareas.** Tienes dos formas:

   - Desde el chat: `/promptqueue:add Crea la página de login con validación`
   - Editando `prompts-queue.md` a mano. Cada tarea es así:

     ```markdown
     ## [ ] 1. Crear la página de login
     Haz un formulario de login con email y contraseña, validación
     en cliente, y conéctalo al endpoint /api/login.

     **Resultado:** _(lo rellenará Claude al completar la tarea)_
     ```

     `[ ]` significa pendiente y `[x]` completada. No toques el campo
     **Resultado:** — lo rellena Claude al acabar cada tarea.

3. **Ejecuta:**

   | Comando | Qué hace | Cuándo usarlo |
   |---|---|---|
   | `/promptqueue:next` | Ejecuta SOLO la siguiente tarea y se para | Cuando quieres revisar cada paso antes de seguir (recomendado al empezar) |
   | `/promptqueue:run` | Ejecuta TODA la cola seguida | Cuando confías en tus tareas y quieres dejarlo trabajar |
   | `/promptqueue:run 3` | Ejecuta solo las 3 siguientes | Colas largas, por tandas |
   | `/promptqueue:status` | Te dice cómo va la cola, sin ejecutar nada | Siempre que quieras |

4. **Al abrir una sesión nueva** en un proyecto con tareas pendientes, el plugin
   te avisará solo: "promptqueue: N tarea(s) pendiente(s)".

## 3. Cómo escribir buenas tareas

Esta es la parte importante. La calidad del resultado depende de cómo escribas cada tarea:

- **Autocontenida.** En el modo `run`, cada tarea la ejecuta un ayudante que NO ve
  tu conversación. Escribe cada tarea como si se la dieras a alguien que acaba de
  llegar: qué hacer, dónde (rutas de archivos), y con qué criterios.
- **Una cosa por tarea.** "Crea el modelo de datos" y "haz el formulario" son dos
  tareas, no una. Tareas pequeñas = errores pequeños.
- **Encadénalas con el Resultado.** Cada tarea completada deja un resumen en su
  campo **Resultado:**, y las siguientes tareas lo reciben como contexto. Puedes
  escribir "usando el esquema de la tarea anterior, crea...".
- **El orden importa.** Se ejecutan de arriba abajo. Pon primero los cimientos.

## 4. Consejos y problemas típicos

- **¿Cola larga (más de 4-5 tareas)?** Ve por tandas con `/promptqueue:run 3`.
- **¿Una tarea falló?** La cola se detiene y la tarea queda como `[ ]` con la
  explicación del problema. Corrige la descripción de la tarea y relanza.
- **¿No se abrió el archivo en VSCode?** Te faltará el comando `code`: abre la
  paleta de VSCode (Cmd+Shift+P) y ejecuta "Shell Command: Install 'code' command
  in PATH". No es obligatorio: puedes abrir `prompts-queue.md` como cualquier archivo.
- **El archivo es tuyo.** Puedes reordenar tareas, borrarlas o editarlas cuando
  quieras — es markdown normal. Si usas git, committéalo: verás tu progreso en los diffs.
- **Tareas difíciles:** antes de lanzar la cola, cambia a un modelo más potente
  con `/model` (por ejemplo `/model opus`).

## 5. Actualizar el plugin

Cuando haya una versión nueva:

```
/plugin marketplace update rupgo-plugins
```

---

Hecho por [rupgo.com](https://rupgo.com). ¿Dudas o ideas? hola@rupgo.com
