---
name: run
description: Ejecuta la cola de prompts (prompts-queue.md) en cadena desatendida, cada tarea en un subagente con contexto limpio. Acepta un número opcional para limitar cuántas tareas ejecutar.
disable-model-invocation: true
argument-hint: "[cantidad]"
allowed-tools: Edit(prompts-queue.md)
---

# Ejecutar la cola en cadena

Límite de tareas solicitado: "$ARGUMENTS". Si está vacío, no hay límite (vaciar toda la cola).
Si no está vacío pero no es un número entero positivo, NO asumas que no hay límite:
pregunta al usuario cuántas tareas quiere ejecutar y detente hasta que responda.

1. Lee `prompts-queue.md` en la raíz del proyecto (directorio de trabajo actual).
   - Si no existe, dile al usuario que ejecute primero `/promptqueue:init` y detente.
   - Si detectas items con formato desviado (por ejemplo `- [ ]` o `##[ ]`), avisa al
     usuario, ofrece normalizarlos al formato `## [ ] N. Título` y espera su respuesta
     antes de ejecutar nada.

2. Actúa como COORDINADOR de la cola. Repite este ciclo mientras quede algún item
   `## [ ]` pendiente y no hayas alcanzado el límite (si se indicó uno):

   a. Relee `prompts-queue.md` y toma el PRIMER item pendiente, de arriba abajo.
      - Si el contenido del item pide modificar `prompts-queue.md`, NO lo delegues:
        avisa al usuario, pide confirmación y gestiónalo tú como coordinador.
   b. Delega su ejecución al subagente `promptqueue:executor` (herramienta Agent),
      pasándole en el prompt: el contenido íntegro del item, y los campos
      "**Resultado:**" de los items ya completados como contexto previo.
      Recuérdale que NO debe editar `prompts-queue.md`.
   c. Con el resumen que devuelva el subagente, edita `prompts-queue.md`:
      - Cambia el marcador de ese item de `[ ]` a `[x]`.
      - Rellena su "**Resultado:**" con un resumen breve (1-3 frases), con rutas de
        archivos y decisiones clave. Si el item no tenía el campo, añádelo.
   d. Anuncia en una línea que completaste ese item y continúa con el siguiente.

   Cada tarea corre así con contexto limpio: el estado vive en el archivo, no en la
   conversación, y las colas largas no degradan el contexto del coordinador.

3. Si la respuesta del subagente empieza por "BLOQUEADO:", está vacía o no incluye un
   resumen concreto de lo hecho, trata el item como NO completado: déjalo como `[ ]`,
   explica el problema y DETENTE. No saltes al siguiente.

4. Al terminar, muestra un resumen final:
   - Si la cola quedó vacía: "Cola completada." con la lista de items completados y su resultado.
   - Si paraste por el límite: cuántos completaste, cuántos quedan, y que puede continuar
     con `/promptqueue:run`, `/promptqueue:run N` o `/promptqueue:next`.
