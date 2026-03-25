# viable-systems

Meta-repository that aggregates VSM component repos as git submodules and provides Claude Flow orchestration configuration.

## Status

- Shell scripts and configuration only; no Elixir source code
- 5 submodules linked (vsm-docs, vsm-goldrush, vsm-rate-limiter, vsm-starter, vsm-telemetry)
- 4 VSM repos are not included as submodules (vsm-core, vsm-connections, vsm-security, vsm-event-bus)
- Claude Flow config present but requires Node.js Claude Flow runtime

## Structure

```
viable-systems/
├── .gitmodules                              # 5 submodule definitions
├── .mcp.json                                # MCP server configuration
├── claude-flow                              # Shell launcher
├── claude-flow.bat                          # Windows launcher
├── claude-flow.ps1                          # PowerShell launcher
├── claude-flow.config.json                  # Swarm/orchestration config
├── scripts/
│   ├── clone-all.sh                         # Clone all VSM repos
│   ├── setup-submodules.sh                  # Initialize submodules
│   └── validate_package.sh                  # Package validation
├── vsm_hex_package_architecture.md          # Hex packaging design doc
├── vsm_repository_migration_roadmap.md      # Migration planning doc
├── vsm-docs/                                # submodule
├── vsm-goldrush/                            # submodule
├── vsm-rate-limiter/                        # submodule
├── vsm-starter/                             # submodule
└── vsm-telemetry/                           # submodule
```

## Submodules

| Submodule | Repo |
|-----------|------|
| vsm-docs | viable-systems/vsm-docs |
| vsm-goldrush | viable-systems/vsm-goldrush |
| vsm-rate-limiter | viable-systems/vsm-rate-limiter |
| vsm-starter | viable-systems/vsm-starter |
| vsm-telemetry | viable-systems/vsm-telemetry |

## Not included as submodules

- vsm-core
- vsm-connections
- vsm-security
- vsm-event-bus
- vsm (umbrella project)

## Setup

```bash
git clone --recursive https://github.com/viable-systems/viable-systems.git
cd viable-systems

# Or if already cloned:
git submodule update --init --recursive
```

## Claude Flow

Requires Node.js and the Claude Flow runtime:

```bash
npm install
./claude-flow
```

Configuration is in `claude-flow.config.json`.

## Limitations

- Only 5 of 9+ VSM repos are tracked as submodules
- Claude Flow is a third-party orchestration tool; its availability and compatibility are not guaranteed
- No CI/CD configuration
- No tests
- The `scripts/clone-all.sh` script may reference repos not in the submodule list
- `.mcp.json` configuration is specific to a particular MCP server setup

## License

See individual submodule repositories for license terms.
