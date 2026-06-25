---
description: Ejecuta toda la cola de prompts en cadena hasta vaciarla
---

# Ejecutar toda la cola en cadena

1. Lee el archivo `prompts-queue.md` en la raiz del proyecto.
   - Si no existe, dile al usuario que ejecute primero `/promptqueue:init` y detente.

2. Repite el siguiente ciclo hasta que no quede ningun item `[ ]`:

   a. Localiza el PRIMER item marcado como `[ ]` (pendiente), de arriba abajo.
   b. Ejecuta su contenido por completo como instruccion del usuario.
      Usa los campos "Resultado:" de items anteriores como contexto.
   c. Al terminar, edita `prompts-queue.md`:
      - Cambia su marcador de `[ ]` a `[x]`.
      - Rellena su "**Resultado:**" con un resumen breve (1-3 frases), con rutas y decisiones clave.
   d. Anuncia en una linea que completaste ese item y continua AUTOMATICAMENTE con el siguiente.

3. Cuando no queden items pendientes, responde: "Cola completada." y muestra un resumen final
   con la lista de items completados y su resultado.

NOTAS DE SEGURIDAD:
- Si un item falla o queda bloqueado (por ejemplo, falta informacion o un comando da error que no puedes resolver),
  DETENTE en ese item, dejalo como `[ ]`, explica el problema y espera instrucciones. No saltes al siguiente.
- Si la cola es muy larga y el contexto empieza a degradarse, avisa al usuario y sugierele
  continuar con `/promptqueue:next` paso a paso tras un `/clear`.
