# SCRIPTS

Repositorio de scripts de utilidad (bash, automatización, mantenimiento del sistema, etc.). Aquí iré subiendo y documentando los scripts que vaya creando.

## Scripts disponibles

### `backup.sh`

Script de copias de seguridad interactivo.

- Crea (si no existe) un directorio `~/BACKUPS` donde se almacenan las copias.
- Pide al usuario el nombre de un directorio a respaldar y lo busca en el sistema con `find`.
- Si no encuentra ningún directorio, o encuentra varios con el mismo nombre, finaliza para que el usuario revise/renombre.
- Pide confirmación de la ruta encontrada; si responde "no", vuelve a pedir el nombre.
- Genera un archivo comprimido `.tar.gz` con fecha y hora en `~/BACKUPS`.

**Uso:**

```bash
git clone https://sreaperr/SCRIPTS
cd SCRIPTS
chmod +x backup.sh
./backup.sh
```

### `update.sh`

Script de actualización del sistema (Arch Linux). Solo ejecución manual de momento.

- Actualiza los paquetes oficiales con `pacman -Syu` y limpia la caché con `pacman -Sc`.
- Actualiza los paquetes AUR con `paru` y limpia su caché.

**Uso:**

```bash
chmod +x update.sh
./update.sh
```

## Estructura

Cada script incluye en su cabecera un comentario describiendo su propósito. A medida que se añadan nuevos scripts, se documentarán en este README.
