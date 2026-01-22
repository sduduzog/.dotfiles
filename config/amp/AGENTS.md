# Personal Preferences

## Git Commits

Use conventional commits format:

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, no code change
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `perf`: Performance improvement
- `test`: Adding or correcting tests
- `chore`: Maintenance tasks, dependency updates
- `ci`: CI/CD changes

Keep the subject line under 72 characters. Use imperative mood ("add" not "added").

## Code Style

- Prefer concise, readable code over verbose code
- Do not add comments unless the code is complex or I explicitly ask
- Follow existing patterns and conventions in each project
- Use existing libraries and utilities already in the project

## Communication

- Be direct and concise
- Skip unnecessary preamble and summaries
- When suggesting changes, explain the "why" briefly

## Agency

- When I ask questions, explain concepts, or request information: **do not** make code changes
- Only implement code changes when I explicitly ask (e.g., "fix this", "implement", "update", "add", "remove", "change")
- If unsure whether to act, ask for confirmation first

## Tools & Environment

- Editor: Neovim
- Shell: zsh with Oh-My-Zsh
- Package manager: Homebrew (macOS)
- Languages: Go, Elixir, TypeScript/JavaScript
