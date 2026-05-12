const fs = require('fs')
const path = require('path')

const distFile = path.join(__dirname, 'dist', 'main.js')
const binFile = path.join(__dirname, 'bin', 'commit-formal')

const wrapper = `#!/usr/bin/env node\nrequire('../dist/main.js')\n`

if (!fs.existsSync(path.join(__dirname, 'bin'))) {
  fs.mkdirSync(path.join(__dirname, 'bin'))
}

fs.writeFileSync(binFile, wrapper)
fs.chmodSync(binFile, '755')

console.log('Shebang agregado → bin/commit-formal')
