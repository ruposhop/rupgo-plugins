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

3. Confirma al usuario que el archivo se ha creado y explicale en una linea como anadir sus propios items y como ejecutarlos.
