---
name: add
description: Añade una tarea nueva al final de la cola de prompts (prompts-queue.md) sin ejecutarla. Usar cuando el usuario pida "añade a la cola", "apunta esta tarea", "encola esto" o dicte una tarea para más tarde.
argument-hint: "[descripción de la tarea]"
allowed-tools: Edit(prompts-queue.md), Write(prompts-queue.md)
---

# Añadir una tarea a la cola

Tarea indicada por el usuario: "$ARGUMENTS"

1. Lee `prompts-queue.md` en la raíz del proyecto (directorio de trabajo actual).
   - Si no existe, ofrece crearlo con `/promptqueue:init` (o créalo directamente si el
     usuario ya dejó clara la intención: usa el encabezado y el blockquote de instrucciones
     de la plantilla de init, sin items de ejemplo, y añade la tarea como item 1).

2. Determina el contenido de la tarea:
   - Si "$ARGUMENTS" tiene contenido, úsalo.
   - Si está vacío, usa lo que el usuario acaba de pedir en la conversación.
   - Si tampoco hay nada claro, pregunta qué tarea quiere añadir y detente hasta que responda.

3. Añade el item AL FINAL del archivo con este formato exacto:

   ```markdown
   ## [ ] N. Título corto de la tarea
   Descripción detallada de la tarea, con el contexto necesario para ejecutarla más
   tarde sin depender de esta conversación (rutas, criterios, ejemplos).

   **Resultado:** _(lo rellenará Claude al completar la tarea)_
   ```

   - N = el número mayor entre los items existentes + 1 (si hay items sin numerar,
     usa el total de items + 1).
   - Si los items existentes usan un formato desviado (por ejemplo `- [ ]`), avisa al
     usuario antes de mezclar formatos (mismo criterio que next/run).
   - Redacta la descripción de forma autocontenida: quien la ejecute no verá esta conversación.

4. NO ejecutes la tarea. Confirma en una línea qué añadiste, la posición en la cola y
   cuántos pendientes hay ahora.
