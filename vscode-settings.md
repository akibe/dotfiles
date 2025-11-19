# Settings

```json
{
  // UI
  "workbench.colorTheme": "Community Material Theme",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.activityBar.location": "top",
  "explorer.compactFolders": false,

  // Editor
  "editor.fontFamily": "UDEV Gothic 35JPDOC, monospace",
  "editor.fontLigatures": true,
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "biomejs.biome",
  "editor.codeActionsOnSave": {
    "quickfix.biome": "explicit",
    "source.organizeImports.biome": "explicit"
    // "source.organizeImports": "explicit",
    // "source.fixAll": "explicit"
  },
  "editor.quickSuggestions": {
    "other": true,
    "comments": false,
    "strings": false
  },
  "editor.scrollBeyondLastLine": false,
  "editor.minimap.enabled": false,

  // Terminal
  "terminal.integrated.defaultProfile.osx": "zsh",
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.fontFamily": "UDEV Gothic JPDOC, monospace",
  "terminal.integrated.scrollback": 10000,
  "terminal.integrated.sendKeybindingsToShell": true,
  "terminal.integrated.allowChords": true,

  // Plugins
  "javascript.updateImportsOnFileMove.enabled": "always",
  "typescript.updateImportsOnFileMove.enabled": "always",

  "markdown-preview-enhanced.enableExtendedTableSyntax": true,
  "markdown-preview-enhanced.enableTypographer": true,
  "markdown-preview-enhanced.mermaidTheme": "forest",

  "tailwindCSS.hovers": true,
  "git-graph.showStatusBarItem": false,
  "database-client.autoSync": true,

  "[markdown]": {
    "editor.wordWrap": "on",
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.trimAutoWhitespace": false,
    "files.trimTrailingWhitespace": false,
    "editor.formatOnSave": true
  },

  "[prisma]": {
    "editor.defaultFormatter": "Prisma.prisma"
  },

  "[yaml]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

# Plugins

- Auto Rename Tag
- Biome
- Codex
- Community Material Theme
- Database Client
- Drizzle ORM
- EditorConfig
- Git Graph
- GitHub Pull Requests
- GitLens
- Live Preview
- Markdown All in One
- Markdown Preview Enhanced
- Material Icon Theme
- Path Intellisense
- Prettier
- Prisma
- Solidity
- SVG
- Tailwind CSS IntelliSense
- Thunder Client
