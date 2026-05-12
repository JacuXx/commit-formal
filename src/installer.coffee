# installer.coffee
# Instala commit-formal como git hook en el proyecto actual.
# Uso: commit-formal --install

fs   = require 'fs'
path = require 'path'

install = ->
  hooksDir = path.join process.cwd(), '.git', 'hooks'

  unless fs.existsSync hooksDir
    console.error '✗ No se encontró .git/hooks/ — ¿estás dentro de un repositorio git?'
    process.exit 1

  hookPath = path.join hooksDir, 'prepare-commit-msg'
  hookContent = """
    #!/bin/sh
    commit-formal --hook "$1"
  """

  fs.writeFileSync hookPath, hookContent
  fs.chmodSync hookPath, '755'

  console.log "✓ Hook instalado en #{hookPath}"
  console.log '  A partir de ahora, commit-formal se ejecutará automáticamente con git commit.'

module.exports = { install }
