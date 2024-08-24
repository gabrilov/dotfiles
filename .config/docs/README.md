# Dotfiles de Gabrilov

Para clonar el repositorio se deben seguir los pasos indicados en la [wiki de Arch sobre dotfiles](https://wiki.archlinux.org/title/Dotfiles#Tracking_dotfiles_directly_with_Git):

```bash
$ git clone --bare <git-repo-url> $HOME/.dotfiles
$ alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
$ dotfiles checkout
$ dotfiles config --local status.showUntrackedFiles no
```

---
**OJOCUIDAO: El repositorio se clonará en tu directorio de usuario y sobreescribirá los archivos de configuración**
---

Se producirá un error como respuesta al comando `dotfiles checkout` si se ya existían previamente archivos de configuración que se van a sobreescribir. En tal caso, se puede crear una copia de estos archivos antes de su sobreescritura.

```bash
$ mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .dotfiles-backup/{}
```

Este repositorio contiene submódulos. Para descargar los archivos correspondientes e inicializar los submódulos, hay que ejecutar las siguientes órdenes:
```bash
$ dotfiles submodule init
$ dotfiles submodule update
```
