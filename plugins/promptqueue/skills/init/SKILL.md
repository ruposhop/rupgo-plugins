---
name: init
description: Crea el archivo de cola de prompts (prompts-queue.md) en la raíz del proyecto con una plantilla de ejemplo. Usar cuando el usuario pida "inicializa la cola", "crea la cola de prompts", "quiero usar promptqueue" o similar.
allowed-tools: Write(prompts-queue.md), Bash(code prompts-queue.md)
---

# Inicializar la cola de prompts

Crear el archivo `prompts-queue.md` en la raíz del proyecto (el directorio de trabajo actual).

1. Comprueba si ya existe `prompts-queue.md`.
   - Si ya existe, NO lo sobrescribas. Avisa al usuario de que ya existe, muestra un resumen de su estado (items pendientes y completados) y detente.

2. Si no existe, créalo con exactamente esta plantilla:

```markdown
# Cola de prompts

> Escribe cada tarea como un item `## [ ] N. Título` seguido de su descripción.
> `[ ]` = pendiente, `[x]` = completada.
> - `/promptqueue:add` añade una tarea nueva desde el chat.
> - `/promptqueue:next` ejecuta la siguiente tarea y se detiene.
> - `/promptqueue:run` ejecuta toda la cola (o `/promptqueue:run 3` solo las 3 siguientes).
> - `/promptqueue:status` muestra el progreso sin ejecutar nada.

## [x] 0. Tarea de ejemplo (bórrame cuando quieras)
Así se escribe una tarea: describe el prompt con todo el detalle que necesites,
en varias líneas, con contexto, criterios y rutas de archivos. Para crear la tuya,
añade un item nuevo con `[ ]` en lugar de `[x]`.

**Resultado:** Así resumirá Claude cada tarea completada, con rutas y decisiones clave.
```

3. Intenta abrir el archivo en Visual Studio Code para que el usuario lo vea en una
   pestaña. Ejecuta exactamente este comando, sin `./` ni rutas absolutas:

   ```bash
   code prompts-queue.md
   ```

   - Si el comando `code` no está instalado en el PATH, NO te detengas: continúa con el paso 4.
     Al final, menciona brevemente que puede abrir el archivo con su editor habitual (y que
     si usa VSCode puede instalar el comando `code` desde la paleta: "Shell Command:
     Install 'code' command in PATH").

4. En la respuesta final, incluye SIEMPRE un enlace markdown clicable al archivo, exactamente
   con esta sintaxis y ruta relativa (así VSCode lo abre al hacer clic):

   ```
   Abrir la cola: [prompts-queue.md](prompts-queue.md)
   ```

5. Explica en una línea cómo añadir items (editando el archivo o con `/promptqueue:add`),
   y muestra los atajos disponibles, cada uno en su propia línea:

   - `/promptqueue:add [tarea]` → añade una tarea a la cola
   - `/promptqueue:next` → ejecuta la siguiente tarea y se detiene
   - `/promptqueue:run [N]` → ejecuta toda la cola (o solo N tareas)
   - `/promptqueue:status` → muestra el estado sin ejecutar nada
