#!/usr/bin/env bash

set -e

echo "AI-SDLC Skill Setup"
echo "-------------------"

if [ ! -d "skills" ]; then
  echo "Error: skills/ directory not found."
  exit 1
fi

echo ""
echo "Select the tools you want to support:"
echo ""
echo "1) .agents   (GitHub Copilot, OpenAI Codex, other agents)"
echo "2) .claude   (Claude Code, Cline)"
echo "3) .cursor   (Cursor)"
echo "4) all supported adapters"
echo "5) cancel"
echo ""

# Optional argument: copilot, codex, claude, cline, cursor, opencode, kiro,
# junie, devin, all, or the legacy menu numbers 1-5.
choice=${1:-}
if [ -z "$choice" ]; then
  read -p "Selection [1-5]: " choice
fi

create_link () {
  target_dir=$1

  mkdir -p "$target_dir"

  if [ -e "$target_dir/skills" ]; then
    echo "✓ $target_dir/skills already exists"
    return
  fi

  if ln -s ../skills "$target_dir/skills" 2>/dev/null; then
    echo "✓ Symlink created: $target_dir/skills → ../skills"
  else
    echo "Symlink not supported, copying skills instead..."
    cp -r skills "$target_dir/skills"
    echo "✓ Skills copied to $target_dir/skills"
  fi
}

create_claude_adapter () {
  if [ ! -e "CLAUDE.md" ] && [ ! -L "CLAUDE.md" ]; then
    printf '%s\n' '@AGENTS.md' > CLAUDE.md
    echo "✓ CLAUDE.md adapter created"
  fi
}

create_cursor_link () {
  target_dir=".cursor/skills"
  mkdir -p .cursor
  if [ -e "$target_dir" ]; then
    echo "✓ $target_dir already exists"
    return
  fi
  if ln -s ../skills "$target_dir" 2>/dev/null; then
    echo "✓ Symlink created: $target_dir → ../skills"
  else
    echo "Symlink not supported, copying skills instead..."
    cp -r skills "$target_dir"
  fi
}

case $choice in
  1|copilot|codex|opencode|devin)
    create_link ".agents"
    ;;
  2|claude)
    create_link ".claude"
    create_claude_adapter
    ;;
  cline)
    create_link ".claude"
    ;;
  3|cursor)
    create_cursor_link
    ;;
  4|all)
    create_link ".agents"
    create_link ".claude"
    create_claude_adapter
    create_cursor_link
    ;;
  kiro|junie)
    echo "✓ $choice uses the repository AGENTS.md"
    ;;
  5|cancel)
    echo "Cancelled."
    exit 0
    ;;
  *)
    echo "Unknown target: $choice" >&2
    exit 1
    ;;
esac

echo ""
echo "Setup complete."
echo ""
echo "Detected structure:"
echo ""

[ -d ".agents/skills" ] && echo "✓ .agents/skills"
[ -d ".claude/skills" ] && echo "✓ .claude/skills"
[ -d ".cursor/skills" ] && echo "✓ .cursor/skills"

echo ""
echo "Your canonical skills remain in:"
echo "skills/"
echo ""
