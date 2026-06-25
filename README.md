# rupgo-plugins

Marketplace de plugins de [rupgo.com](https://rupgo.com) para **Claude Code**.

## Plugins disponibles

- **promptqueue** — Cola de prompts encadenados: escribe tus prompts en un markdown y ejecútalos de uno en uno o en cadena, con estado persistente. [Ver detalles](./plugins/promptqueue/README.md)

## Instalación

En Claude Code:

```
/plugin marketplace add ruposhop/rupgo-plugins
/plugin install promptqueue@rupgo-plugins
```

> Sustituye `TU_USUARIO` por tu usuario de GitHub una vez publiques este repo.

## Cómo publicar (para Rupo)

1. Crea un repo **público** en GitHub llamado `rupgo-plugins`.
2. Sube el contenido de esta carpeta a la raíz del repo.
3. Comparte con tu comunidad las dos líneas de instalación de arriba (con tu usuario real).
4. Para actualizar un plugin: sube cambios al repo y sube la `version` en su `plugin.json`. Tus usuarios refrescan con `/plugin marketplace update`.

## Licencia

MIT
