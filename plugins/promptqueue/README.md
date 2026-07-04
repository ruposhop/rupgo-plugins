# promptqueue

Cola de prompts para **Claude Code**. Escribe tus tareas en un archivo markdown y ejecútalas una a una (un paso por invocación, con parada entre pasos) o en cadena desatendida. El estado vive en el propio archivo: sobrevive entre sesiones, se versiona en git y no depende del contexto de la conversación.

Hecho por [rupgo.com](https://rupgo.com) para la comunidad.

> **¿Empiezas ahora?** Lee la [guía de uso paso a paso](./GUIA-ALUMNOS.md).

## Por qué

Cuando trabajas con Claude Code se te ocurren varias tareas encadenadas, pero quieres que se ejecuten en orden y de una en una, no todas a la vez en un único prompt gigante donde se pierde el control. `promptqueue` te deja apuntar esos prompts y dispararlos de forma controlada.

## Instalación

```
/plugin marketplace add ruposhop/rupgo-plugins
/plugin install promptqueue@rupgo-plugins
```

## Uso

1. **Inicializa la cola** (crea `prompts-queue.md` en tu proyecto, lo abre en VSCode si el comando `code` está disponible, y te deja un enlace clicable):

   ```
   /promptqueue:init
   ```

2. **Añade tareas**, editando `prompts-queue.md` directamente o desde el chat:

   ```
   /promptqueue:add Crear el esquema de la base de datos en Supabase
   ```

   Cada tarea es un encabezado con `[ ]` y una descripción:

   ```markdown
   ## [ ] 1. Crear el esquema de la base de datos
   Diseña las tablas para usuarios y sesiones en Supabase...

   **Resultado:** _(lo rellenará Claude al completar la tarea)_

   ## [ ] 2. Implementar la autenticación
   Usando el esquema anterior, crea el flujo de login...

   **Resultado:** _(lo rellenará Claude al completar la tarea)_
   ```

3. **Ejecuta**, en uno de los dos modos:

   - **Paso a paso** (máximo control y visibilidad):
     ```
     /promptqueue:next
     ```
     Hace solo la siguiente tarea pendiente en la conversación actual, la marca `[x]`,
     escribe su resultado y se detiene. Tú decides cuándo lanzar la siguiente
     reinvocando el comando.

   - **En cadena** (desatendido):
     ```
     /promptqueue:run
     ```
     Vacía toda la cola. Cada tarea se ejecuta en un **subagente con contexto limpio**:
     el coordinador solo mantiene el estado del archivo, así las colas largas no
     degradan el contexto. Si algo falla, se detiene en ese punto y te lo explica.

     ¿Cola muy larga? Limita la tanda: `/promptqueue:run 3` ejecuta solo las 3 siguientes.

4. **Consulta el estado** cuando quieras, sin ejecutar nada:

   ```
   /promptqueue:status
   ```

Además, al **arrancar una sesión** en un proyecto con tareas pendientes, el plugin te
avisa automáticamente de cuántas quedan y cómo continuar.

## Comandos

| Comando | Qué hace |
|---|---|
| `/promptqueue:init` | Crea `prompts-queue.md` con una plantilla y lo abre en VSCode (si el comando `code` está disponible). |
| `/promptqueue:add [tarea]` | Añade una tarea al final de la cola sin ejecutarla. |
| `/promptqueue:next` | Ejecuta la siguiente pendiente en la conversación y se detiene. |
| `/promptqueue:run [N]` | Ejecuta toda la cola (o solo N tareas), cada una con contexto limpio. |
| `/promptqueue:status` | Muestra el progreso sin ejecutar nada. |

## Consejos

- **Escribe tareas autocontenidas:** quien las ejecuta puede no ver tu conversación.
  Incluye rutas, criterios y contexto en la propia tarea.
- **Contexto entre pasos:** el campo `**Resultado:**` de cada tarea completada se pasa
  como contexto a las siguientes. Escribe prompts que se apoyen en él ("usando el
  esquema anterior...").
- **Colas largas:** usa `/promptqueue:run 3` por tandas, o `/promptqueue:next` con un
  `/clear` entre tareas pesadas. Como el estado está en el archivo, no pierdes el hilo.
- **Tareas difíciles:** cambia a un modelo más capaz antes de lanzar la cola con
  `/model best` (usa el mejor modelo disponible en tu plan; si tu versión no reconoce
  `best`, usa por ejemplo `/model opus`).
- **Versiona la cola en git:** verás el avance en los diffs.

## Licencia

MIT
