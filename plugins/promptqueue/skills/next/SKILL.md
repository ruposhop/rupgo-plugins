---
name: next
description: Ejecuta la siguiente tarea pendiente de la cola de prompts (prompts-queue.md) y se detiene. Usar SOLO cuando el usuario pida explícitamente ejecutar el siguiente prompt de la cola ("ejecuta el siguiente", "sigue con la cola", "continúa la cola"). No ejecutar por iniciativa propia.
allowed-tools: Edit(prompts-queue.md)
---

# Ejecutar la siguiente tarea de la cola

1. Lee `prompts-queue.md` en la raíz del proyecto (directorio de trabajo actual).
   - Si no existe, dile al usuario que ejecute primero `/promptqueue:init` y detente.

2. Localiza el PRIMER item cuyo encabezado sea `## [ ] ...` (pendiente), en orden de
   aparición de arriba abajo.
   - Si no hay ningún item pendiente, responde: "Cola completada. No quedan prompts pendientes." y detente.
   - Si detectas items con formato desviado (por ejemplo `- [ ]`, `##[ ]` sin espacio, o
     encabezados de otro nivel), NO los adivines: avisa al usuario, ofrece normalizarlos
     al formato `## [ ] N. Título` y espera su respuesta antes de ejecutar nada.

3. Ejecuta ÚNICAMENTE el contenido de ese item como si fuera la instrucción del usuario.
   - NO leas, NO planifiques y NO ejecutes ningún item posterior.
   - Usa los campos "**Resultado:**" de items ya completados como contexto si el item lo necesita.
   - Lleva la tarea hasta el final (escribe el código, crea los archivos, ejecuta lo que haga falta).
   - Si el propio item pide modificar `prompts-queue.md`, avisa al usuario y pide confirmación
     antes de hacerlo: el archivo es el estado de la cola.

4. Cuando la tarea esté completada por completo, edita `prompts-queue.md`:
   - Cambia el marcador de ese item de `[ ]` a `[x]`.
   - Rellena su campo "**Resultado:**" con un resumen breve (1-3 frases) de lo que
     produjiste, incluyendo rutas de archivos o decisiones clave que los siguientes
     items puedan necesitar. Si el item no tenía campo "**Resultado:**", añádelo.

5. Para y reporta:
   - Qué item acabas de completar.
   - Cuál es el siguiente pendiente (solo su título), SIN ejecutarlo.
   - Recuerda al usuario que puede continuar con `/promptqueue:next` o `/promptqueue:run`.

IMPORTANTE: no avances al siguiente item por tu cuenta. El turno termina aquí.
