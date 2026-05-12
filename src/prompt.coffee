# prompt.coffee
# Maneja todas las preguntas interactivas al usuario via stdin/stdout.
# Usa readline nativo de Node — sin dependencias externas.

readline = require 'readline'

# Crea una interfaz readline y hace una pregunta.
# Retorna una Promise que resuelve con la respuesta del usuario.
ask = (question) ->
  new Promise (resolve) ->
    rl = readline.createInterface
      input: process.stdin
      output: process.stdout
    rl.question question, (answer) ->
      rl.close()
      resolve answer.trim()

# Pregunta el tipo de commit y valida que sea uno de los permitidos.
askType = (types) ->
  list = types.join(' | ')
  loop
    answer = await ask "\nTipo de commit (#{list}): "
    if answer in types
      return answer
    console.log "  ✗ Tipo inválido. Elige uno de: #{list}"

# Pregunta el scope — opcional, Enter para omitir.
askScope = (scopes) ->
  hint = if scopes.length > 0 then "(#{scopes.join(', ')}) " else ''
  answer = await ask "Scope #{hint}[opcional, Enter para omitir]: "
  if answer is '' then null else answer

# Pregunta el mensaje corto — no puede estar vacío.
askMessage = ->
  loop
    answer = await ask "Mensaje corto: "
    if answer.length > 0
      return answer
    console.log "  ✗ El mensaje no puede estar vacío."

# Pregunta si se quiere agregar un cuerpo — opcional.
askBody = ->
  answer = await ask "Cuerpo [opcional, Enter para omitir]: "
  if answer is '' then null else answer

module.exports = { askType, askScope, askMessage, askBody }
