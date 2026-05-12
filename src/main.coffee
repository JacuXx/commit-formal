# main.coffee
# Entry point de commit-formal.
# Orquesta el flujo: config → prompt → format → git commit.

fs           = require 'fs'
path         = require 'path'
{ execSync } = require 'child_process'

{ askType, askScope, askMessage, askBody } = require './prompt'
{ formatCommit }                            = require './formatter'
{ install }                                 = require './installer'

# Carga config del proyecto actual o usa defaults.
loadConfig = ->
  configPath = path.join process.cwd(), '.formal', 'config.json'
  if fs.existsSync configPath
    JSON.parse fs.readFileSync configPath, 'utf8'
  else
    types: ['feat','fix','docs','style','refactor','test','chore','perf','revert']
    scopes: []

# Flujo principal interactivo.
run = ->
  args = process.argv.slice 2

  if '--install' in args
    install()
    return

  config = loadConfig()

  console.log '\n commit-formal — escribe un commit formal\n'

  type    = await askType config.types
  scope   = await askScope config.scopes
  message = await askMessage()
  body    = await askBody()

  commitMsg = formatCommit { type, scope, message, body }

  console.log "\n─────────────────────────────"
  console.log commitMsg
  console.log "─────────────────────────────\n"

  try
    execSync "git commit -m #{JSON.stringify commitMsg}",
      stdio: 'inherit'
  catch err
    console.error '✗ git commit falló.'
    process.exit 1

run()
