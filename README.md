<h1 align="center">commit-formal</h1>

<p align="center">
  CLI interactiva para escribir commits de git estandarizados. Sin dependencias externas.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/STATUS-EN%20DESARROLLO-yellow" alt="Estado"/>
  <img src="https://img.shields.io/badge/versión-1.0.0-blue" alt="Versión"/>
  <img src="https://img.shields.io/badge/licencia-MIT-green" alt="Licencia"/>
  <img src="https://img.shields.io/badge/lenguaje-CoffeeScript-red" alt="CoffeeScript"/>
</p>

---

## Índice

- [Descripción](#descripción)
- [Estado del proyecto](#estado-del-proyecto)
- [Funcionalidades](#funcionalidades)
- [Instalación](#instalación)
- [Uso](#uso)
- [Configuración](#configuración)
- [Tecnologías](#tecnologías)
- [Autor](#autor)
- [Licencia](#licencia)

---

## Descripción

**commit-formal** guía al desarrollador paso a paso para escribir un mensaje de commit con formato estándar ([Conventional Commits](https://www.conventionalcommits.org/)). Mejora la legibilidad del historial de git, facilita la búsqueda y hace los proyectos más profesionales.

Escrita en **CoffeeScript** y compilada a JavaScript. Cero dependencias en producción — solo usa módulos nativos de Node.js.

---

## Estado del proyecto

🚧 En desarrollo activo — versión 1.0.0 funcional

---

## Funcionalidades

- ✅ Selección interactiva de tipo de commit (`feat`, `fix`, `docs`, etc.)
- ✅ Scope opcional con sugerencias configurables por proyecto
- ✅ Validación de tipo — no acepta valores fuera de la lista
- ✅ Mensaje corto obligatorio — no permite commits vacíos
- ✅ Cuerpo opcional para detallar los cambios
- ✅ Vista previa del commit antes de confirmarlo
- ✅ Configuración por proyecto via `.formal/config.json`
- 🚧 Instalación como git hook (`--install`)

---

## Instalación

### Prerrequisitos

- Node.js v18+
- npm

### Instalación global

```bash
git clone https://github.com/JacuXx/commit-formal.git
cd commit-formal
npm install -g .
```

A partir de ahí, `commit-formal` está disponible en cualquier terminal.

---

## Uso

### En cualquier repositorio git

```bash
git add .
commit-formal
```

El CLI te guía por cada parte del mensaje:

```
 commit-formal — escribe un commit formal

Tipo de commit (feat | fix | docs | style | refactor | test | chore | perf | revert): feat
Scope [opcional, Enter para omitir]: auth
Mensaje corto: agregar login con Google
Cuerpo [opcional, Enter para omitir]: 

─────────────────────────────
feat(auth): agregar login con Google
─────────────────────────────

[main a1b2c3d] feat(auth): agregar login con Google
```

### Instalar como git hook

```bash
cd mi-proyecto
commit-formal --install
```

Instala el hook en `.git/hooks/` del proyecto. Se ejecuta automáticamente con cada `git commit`.

---

## Configuración

Crea un archivo `.formal/config.json` en la raíz de tu proyecto para personalizar los tipos y scopes disponibles:

```json
{
  "types": ["feat", "fix", "chore", "docs"],
  "scopes": ["api", "ui", "auth", "db"]
}
```

Si no existe el archivo, se usan los valores por defecto.

| Campo | Tipo | Descripción |
|---|---|---|
| `types` | `string[]` | Tipos de commit disponibles |
| `scopes` | `string[]` | Scopes sugeridos (opcional) |

---

## Tecnologías

- **Lenguaje:** CoffeeScript 2.7 (compila a JavaScript)
- **Runtime:** Node.js v18+
- **Módulos usados:** `readline`, `fs`, `path`, `child_process` (todos nativos)
- **Dependencias externas:** ninguna

---

## Autor

Desarrollado por [JacuXx](https://github.com/JacuXx).

---

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).
