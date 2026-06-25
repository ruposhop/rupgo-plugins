---
description: Muestra el estado de la cola (pendientes y completados) sin ejecutar nada
---

# Estado de la cola

1. Lee `prompts-queue.md`.
   - Si no existe, dile al usuario que ejecute `/promptqueue:init` y detente.

2. NO ejecutes ningun item. Solo muestra un resumen:
   - Total de items, cuantos completados `[x]` y cuantos pendientes `[ ]`.
   - Lista de pendientes (solo titulos), en orden.
   - Cual seria el siguiente en ejecutarse.

3. No hagas nada mas.
