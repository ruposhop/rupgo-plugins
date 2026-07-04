# rupgo-plugins

Marketplace de plugins de [rupgo.com](https://rupgo.com) para **Claude Code**.

## Plugins disponibles

- **promptqueue** — Cola de prompts: escribe tus tareas en un markdown y ejecútalas una a una o en cadena desatendida (en cadena, cada tarea corre en un subagente con contexto limpio), con estado persistente en el propio archivo. [Ver detalles](./plugins/promptqueue/README.md)

## Instalación

En Claude Code:

```
/plugin marketplace add ruposhop/rupgo-plugins
/plugin install promptqueue@rupgo-plugins
```

## Mantenimiento (para publicar cambios)

1. Haz los cambios en el plugin y sube la `version` de su `plugin.json` (ej. `1.2.0` → `1.2.1`).
2. Haz push a `main`.
3. Los usuarios reciben la actualización con `/plugin marketplace update rupgo-plugins`.

## Licencia

MIT
