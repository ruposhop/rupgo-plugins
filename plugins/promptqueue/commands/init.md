---
description: Crea el archivo de cola de prompts (prompts-queue.md) en el proyecto
---

# Inicializar la cola de prompts

Tu tarea es crear el archivo `prompts-queue.md` en la raiz del proyecto.

1. Comprueba si ya existe `prompts-queue.md`.
   - Si ya existe, NO lo sobrescribas. Avisa al usuario de que ya existe y muestrale su contenido actual. Detente.
2. Si no existe, crealo con exactamente esta plantilla:

```markdown
# Cola de prompts

> Escribe cada tarea como un item. `[ ]` = pendiente, `[x]` = completado.
> Ejecuta `/promptqueue:next` para hacer el siguiente paso a paso,
> o `/promptqueue:run` para vaciar toda la cola de una vez.

## [ ] 1. Tarea de ejemplo (borrame)
Describe aqui el primer prompt con todo el detalle que quieras.
Puedes escribir varias lineas, dar contexto, pegar rutas de archivos, etc.

**Resultado:** _(lo rellenara Claude al completar la tarea)_

## [ ] 2. Otra tarea de ejemplo (borrame)
Describe aqui el segundo prompt.

**Resultado:** _(lo rellenara Claude al completar la tarea)_
```

3. Abre el archivo `prompts-queue.md` SIEMPRE en Visual Studio Code, para que el
   usuario lo vea en una pestana inmediatamente. Ejecuta exactamente:

   ```bash
   code prompts-queue.md
   ```

   - Si el comando `code` falla porque no esta instalado en el PATH, NO te detengas:
     avisa al usuario de que abra VSCode y ejecute desde la paleta de comandos
     "Shell Command: Install 'code' command in PATH", y que vuelva a lanzar
     `/promptqueue:init`. Mientras tanto, sigue con el paso 4 igualmente.

4. En tu respuesta final, ademas del aviso de creacion, incluye SIEMPRE un enlace
   markdown clicable al archivo para que el usuario pueda abrirlo pinchando.
   Escribelo EXACTAMENTE con esta sintaxis y ruta relativa (asi VSCode lo abre
   al hacer clic):

   ```
   Abrir la cola: [prompts-queue.md](prompts-queue.md)
   ```

5. Explica en una linea como anadir sus propios items, y muestra los atajos
   disponibles tal cual, cada uno en su propia linea, para que los tenga a mano:

   - `/promptqueue:next`  -> ejecuta el siguiente prompt y se detiene
   - `/promptqueue:run`   -> ejecuta toda la cola de una vez
   - `/promptqueue:status` -> muestra el estado sin ejecutar nada
