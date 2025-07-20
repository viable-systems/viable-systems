# Viable Systems

A comprehensive implementation of the Viable System Model (VSM) in Elixir, with Claude Flow orchestration for intelligent system coordination.

## Overview

This repository serves as the umbrella project for the Viable Systems ecosystem, containing:
- Claude Flow configuration for orchestrating VSM implementations
- Links to all VSM component repositories
- Shared tooling and scripts
- Cross-project coordination

## VSM Components

### Core Packages

- **[vsm-starter](./vsm-starter/)** - Template for building VSM applications
- **[vsm-telemetry](./vsm-telemetry/)** - Advanced telemetry and monitoring
- **[vsm-goldrush](./vsm-goldrush/)** - High-performance cybernetic pattern detection
- **[vsm-rate-limiter](./vsm-rate-limiter/)** - Variety attenuation and rate limiting
- **[vsm-docs](./vsm-docs/)** - Comprehensive documentation

### Architecture

The Viable Systems ecosystem implements Stafford Beer's VSM with modern cloud-native technologies:

```
┌─────────────────────────────────────────────────────────┐
│                     System 5 (Policy)                    │
├─────────────────────────────────────────────────────────┤
│          System 4              │    System 3*            │
│      (Intelligence)            │     (Audit)             │
├────────────────────┬───────────┴──────────────────────┤
│                    │         System 3                   │
│    System 2        │        (Control)                  │
│ (Coordination)     ├────────────────────────────────────┤
│                    │         System 1                   │
│                    │      (Operations)                  │
└────────────────────┴────────────────────────────────────┘
```

## Claude Flow Integration

This project includes Claude Flow configuration for intelligent orchestration:

- **Auto-topology selection** for optimal agent organization
- **Parallel execution** for maximum performance
- **Neural training** capabilities
- **Self-healing workflows**
- **Cross-session memory** persistence

## Getting Started

### Prerequisites

- Elixir 1.17+
- Node.js 18+ (for Claude Flow)
- Git

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/viable-systems/viable-systems.git
   cd viable-systems
   ```

2. Install Claude Flow dependencies:
   ```bash
   npm install
   ```

3. Clone VSM components:
   ```bash
   ./scripts/clone-all.sh
   ```

### Using Claude Flow

Start a Claude Flow session:
```bash
./claude-flow
```

Configure swarm parameters in `claude-flow.config.json`.

## Repository Structure

```
viable-systems/
├── claude-flow*              # Claude Flow executable
├── claude-flow.config.json   # Swarm configuration
├── .mcp.json                # MCP server configuration
├── vsm-starter/             # VSM application template
├── vsm-telemetry/           # Monitoring and dashboards
├── vsm-goldrush/            # Pattern detection
├── vsm-rate-limiter/        # Rate limiting
├── vsm-docs/                # Documentation
└── scripts/                 # Utility scripts
```

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

Each VSM component has its own license. See individual repositories for details.

## References

- [Stafford Beer's Viable System Model](https://en.wikipedia.org/wiki/Viable_system_model)
- [VSM Documentation](https://viable-systems.github.io/vsm-docs/)
- [Claude Flow Documentation](https://github.com/anthropic/claude-flow)