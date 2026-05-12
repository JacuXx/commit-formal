# formatter.coffee
# Función pura: recibe un objeto con las partes del commit
# y retorna el string final formateado.

formatCommit = ({type, scope, message, body}) ->
  header = if scope
    "#{type}(#{scope}): #{message}"
  else
    "#{type}: #{message}"

  if body
    "#{header}\n\n#{body}"
  else
    header

module.exports = { formatCommit }
