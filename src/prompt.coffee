
readline = require 'readline'

ask = (question) ->
  new Promise (resolve) ->
    rl = readline.createInterface
      input: process.stdin
      output: process.stdout
    rl.question question, (answer) ->
      rl.close()
      resolve answer.trim()

askType = (types) ->
  list = types.join(' | ')
  loop
    answer = await ask "\nTipo de commit (#{list}): "
    if answer in types
      return answer
    console.log "  ✗ Tipo inválido. Elige uno de: #{list}"

askScope = (scopes) ->
  hint = if scopes.length > 0 then "(#{scopes.join(', ')}) " else ''
  answer = await ask "Scope #{hint}[opcional, Enter para omitir]: "
  if answer is '' then null else answer

askMessage = ->
  loop
    answer = await ask "Mensaje corto: "
    if answer.length > 0
      return answer
    console.log "  ✗ El mensaje no puede estar vacío."

askBody = ->
  answer = await ask "Cuerpo [opcional, Enter para omitir]: "
  if answer is '' then null else answer

module.exports = { askType, askScope, askMessage, askBody }
