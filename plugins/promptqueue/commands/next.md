---
description: Ejecuta el siguiente prompt pendiente de la cola y se detiene
---

# Ejecutar el siguiente prompt de la cola

1. Lee el archivo `prompts-queue.md` en la raiz del proyecto.
   - Si no existe, dile al usuario que ejecute primero `/promptqueue:init` y detente.

2. Localiza el PRIMER item cuyo encabezado este marcado como `[ ]` (pendiente),
   en orden de aparicion de arriba abajo.
   - Si no hay ningun item `[ ]`, responde exactamente: "Cola completada. No quedan prompts pendientes." y detente.

3. Ejecuta UNICAMENTE el contenido de ese item como si fuera la instruccion del usuario.
   - NO leas, NO planifiques y NO ejecutes ningun item posterior.
   - Si items anteriores ya completados tienen un campo "Resultado:", usalo como contexto.
   - Lleva la tarea hasta el final (escribe el codigo, crea los archivos, corre lo que haga falta).

4. Cuando la tarea este completada por completo, edita `prompts-queue.md`:
   - Cambia el marcador de ese item de `[ ]` a `[x]`.
   - Rellena su campo "**Resultado:**" con un resumen breve (1-3 frases) de lo que produjiste,
     incluyendo rutas de archivos o decisiones clave que los siguientes items puedan necesitar.

5. Para y reporta:
   - Que item acabas de completar.
   - Cual es el siguiente item pendiente (solo su titulo), SIN ejecutarlo.
   - Recuerda al usuario que ejecute `/promptqueue:next` de nuevo para continuar.

IMPORTANTE: no avances al siguiente item por tu cuenta. Tu turno termina aqui.
