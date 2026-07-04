---
name: status
description: Muestra el estado de la cola de prompts (prompts-queue.md) sin ejecutar nada, con pendientes y completados. Usar cuando el usuario pregunte cómo va la cola, qué queda pendiente o pida el estado de promptqueue.
model: haiku
---

# Estado de la cola

1. Lee `prompts-queue.md` en la raíz del proyecto (directorio de trabajo actual).
   - Si no existe, dile al usuario que ejecute `/promptqueue:init` y detente.

2. NO ejecutes ningún item. Solo muestra un resumen:
   - Total de items, cuántos completados `[x]` y cuántos pendientes `[ ]`.
   - Lista de pendientes (solo títulos), en orden.
   - Cuál sería el siguiente en ejecutarse.
   - Si hay items con formato desviado (no empiezan por `## [ ]` ni `## [x]`), menciónalos.

3. No hagas nada más.
