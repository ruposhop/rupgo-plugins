# promptqueue

Cola de prompts encadenados para **Claude Code**. Escribe tus prompts en un archivo markdown y ejecútalos de uno en uno (con confirmación entre cada paso) o en cadena desatendida. El estado vive en el propio archivo, así que sobrevive entre sesiones y lo ves en git.

Hecho por [rupgo.com](https://rupgo.com) para la comunidad.

## Por qué

Cuando trabajas con Claude Code se te ocurren varias tareas encadenadas, pero quieres que se ejecuten en orden y de una en una, no todas a la vez en un único prompt gigante donde se pierde el contexto. `promptqueue` te deja ir apuntando esos prompts y dispararlos controladamente.

## Instalación

```
/plugin marketplace add ruposhop/rupgo-plugins
/plugin install promptqueue@rupgo-plugins
```

(Sustituye `TU_USUARIO` por el usuario/repo de GitHub donde publiques el marketplace.)

## Uso

1. **Inicializa la cola** (crea `prompts-queue.md` en tu proyecto):

   ```
   /promptqueue:init
   ```

2. **Edita `prompts-queue.md`** y añade tus tareas. Cada una es un encabezado con `[ ]`:

   ```markdown
   ## [ ] 1. Crear el esquema de la base de datos
   Diseña las tablas para usuarios y sesiones en Supabase...

   **Resultado:** _(lo rellena Claude)_

   ## [ ] 2. Implementar la autenticación
   Usando el esquema anterior, crea el flujo de login...

   **Resultado:** _(lo rellena Claude)_
   ```

3. **Ejecuta**, en uno de los dos modos:

   - Paso a paso (recomendado, máximo control):
     ```
     /promptqueue:next
     ```
     Hace solo el siguiente pendiente, lo marca `[x]`, escribe su resultado y para. Vuelve a invocarlo para el siguiente.

   - En cadena (desatendido):
     ```
     /promptqueue:run
     ```
     Vacía toda la cola, marcando cada item al terminar. Si algo falla, se detiene en ese punto.

4. **Consulta el estado** cuando quieras, sin ejecutar nada:

   ```
   /promptqueue:status
   ```

## Comandos

| Comando | Qué hace |
|---|---|
| `/promptqueue:init` | Crea `prompts-queue.md` con una plantilla. |
| `/promptqueue:next` | Ejecuta el siguiente pendiente y se detiene. |
| `/promptqueue:run` | Ejecuta toda la cola en cadena. |
| `/promptqueue:status` | Muestra progreso sin ejecutar. |

## Consejos

- **Cadenas largas:** usa `/promptqueue:next` con un `/clear` entre items pesados. Como el estado y los resúmenes están en el archivo, no pierdes el hilo aunque limpies el contexto.
- **Contexto entre pasos:** el campo `**Resultado:**` de cada item completado se usa como contexto para los siguientes. Escribe prompts que se apoyen en él ("usando el esquema anterior...").
- **Versiona la cola en git:** verás el avance en los diffs.

## Licencia

MIT
