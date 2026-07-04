#!/bin/bash
# SessionStart hook de promptqueue: si el proyecto tiene una cola con items
# pendientes, avisa al usuario y da contexto a Claude. Silencioso en caso contrario.
set -u

QUEUE_FILE="${CLAUDE_PROJECT_DIR:-.}/prompts-queue.md"
[ -f "$QUEUE_FILE" ] || exit 0

count=$(grep -c '^## \[ \]' "$QUEUE_FILE" 2>/dev/null) || true
count=${count:-0}

if [ "$count" -gt 0 ] 2>/dev/null; then
  printf '{"systemMessage":"promptqueue: %s tarea(s) pendiente(s) en prompts-queue.md — /promptqueue:next (una), /promptqueue:run (todas), /promptqueue:status (ver)","hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"La cola del plugin promptqueue (prompts-queue.md) tiene %s items pendientes. NO ejecutes items por tu cuenta: espera a que el usuario lo pida con /promptqueue:next o /promptqueue:run."}}\n' "$count" "$count"
fi
exit 0
