# VSM Repository Migration Roadmap

## Overview

This roadmap outlines the migration strategy from the monolithic `autonomous-opponent-v2` to a modular ecosystem of 31 repositories under the `@viable-systems` GitHub organization.

## Repository Structure

### Total Repository Count: 31

- **13** Core Infrastructure Packages
- **5** Additional Support Packages  
- **4** Main Applications
- **5** Support/Documentation Repositories
- **4** Optional Extraction Packages

---

## Phase 1: Foundation Setup (Week 1)

### Objective: Establish organizational infrastructure

#### 1.1 Create GitHub Organization
```bash
# Create @viable-systems organization
# Setup organization settings, teams, and permissions
```

#### 1.2 **viable-systems/vsm-starter** ⭐ 
**Priority: CRITICAL - Create First**
- Standard Elixir/Phoenix project template
- CI/CD GitHub Actions templates
- Standard README.md template
- Contributing guidelines
- MIT License template
- `.formatter.exs` with VSM conventions

#### 1.3 **viable-systems/vsm-docs** 📚
**Priority: HIGH**
- Central documentation hub
- Package discovery guide
- VSM theory documentation
- Migration guide from autonomous-opponent

#### 1.4 Setup External Services
- Create Hex.pm organization: `viable_systems`
- Create Docker Hub namespace: `viablesystems`
- Setup shared CI/CD secrets

---

## Phase 2: Core Dependencies (Week 2-3)

### Objective: Extract packages with zero VSM dependencies

#### 2.1 **viable-systems/vsm-telemetry** 📊
**Dependencies**: Only Elixir stdlib + telemetry
```elixir
{:telemetry, "~> 1.2"},
{:telemetry_metrics, "~> 0.6"},
{:telemetry_poller, "~> 1.0"}
```
**Why First**: Provides observability for migration process

#### 2.2 **viable-systems/vsm-goldrush** ⚡
**Dependencies**: GenStage only
```elixir
{:gen_stage, "~> 1.2"}
```
**Critical**: Event processing engine used by many packages

#### 2.3 **viable-systems/vsm-rate-limiter** 🚦
**Dependencies**: Minimal
```elixir
{:ex_rated, "~> 2.1", optional: true}
```
**Includes**: Token bucket, sliding window algorithms

---

## Phase 3: VSM Core Extraction (Week 4-5)

### Objective: Extract the heart of the system

#### 3.1 **viable-systems/vsm-core** 🧠
**CRITICAL: Most packages depend on this**

Extract from `autonomous_opponent_v2_core/lib/autonomous_opponent_v2_core/vsm/`:
- `s1/` - Operations subsystem (priority queues, workers)
- `s2/` - Coordination (anti-oscillation)
- `s3/` - Control (resource bargaining)
- `s4/` - Intelligence (pattern recognition)
- `s5/` - Policy (governance)
- `channels/variety_channel.ex`
- `channels/temporal_variety_channel.ex` (1,368 lines!)
- `algedonic/` (814 lines - pain/pleasure)

**Module Rename**:
```elixir
# From
defmodule AutonomousOpponentV2Core.VSM.S1.Operations

# To
defmodule VsmCore.S1.Operations
```

#### 3.2 **viable-systems/vsm-event-bus** 📡
**Dependencies**: vsm-core
```elixir
{:vsm_core, "~> 0.1"},
{:phoenix_pubsub, "~> 2.1"},
{:libcluster, "~> 3.3"}
```

Extract from:
- `event_bus.ex`
- `event_bus/` directory
- HLC implementation
- Ordered delivery system

---

## Phase 4: Infrastructure Layer (Week 6-7)

### Objective: Extract connection and security infrastructure

#### 4.1 **viable-systems/vsm-connections** 🔌
**Dependencies**: vsm-core, vsm-event-bus
```elixir
{:vsm_core, "~> 0.1"},
{:vsm_event_bus, "~> 0.1"},
{:finch, "~> 0.18"},
{:poolboy, "~> 1.5"},
{:redix, "~> 1.5"}
```

Extract from `connections/`:
- Pool management
- Circuit breakers
- Health checking
- Multi-protocol support

#### 4.2 **viable-systems/vsm-security** 🔐
**Dependencies**: vsm-core, vsm-event-bus

Extract from `security/`:
- Z3N architecture
- Neural Bloom filters
- Zone-aware routing
- Zombie detection

#### 4.3 **viable-systems/vsm-external-interfaces** 🌐
**Dependencies**: vsm-core, vsm-connections

Extract from `external_interfaces/`:
- HTTP adapters
- WebSocket support
- gRPC interfaces

---

## Phase 5: Intelligence Layer (Week 8-9)

### Objective: Extract ML and pattern recognition

#### 5.1 **viable-systems/vsm-vector-store** 🔍
**Dependencies**: vsm-core

Extract from `vsm/s4/intelligence/`:
- HNSW implementation
- Vector quantization
- K-means clustering
- Pure Elixir ML

#### 5.2 **viable-systems/vsm-pattern-engine** 🎯
**Dependencies**: vsm-core, vsm-vector-store

Extract pattern recognition, anomaly detection

#### 5.3 **viable-systems/vsm-metrics** 📈
**Dependencies**: vsm-core, vsm-event-bus

Extract from `metrics/`:
- Multi-tier storage
- CRDT aggregation
- Variety engineering metrics

---

## Phase 6: Advanced Features (Week 10-11)

### Objective: Extract LLM integration and consciousness

#### 6.1 **viable-systems/vsm-mcp** 🤖
**Dependencies**: vsm-core, vsm-connections

Extract from `mcp/`:
- Model Context Protocol
- Tool definitions
- Resource management

#### 6.2 **viable-systems/vsm-amcp** 🧬
**Dependencies**: vsm-mcp, vsm-core

Extract from `amcp/`:
- Advanced MCP
- Semantic fusion
- CRDT memory

#### 6.3 **viable-systems/vsm-consciousness** 🌟
**Dependencies**: ALL core packages
**EXTRACT LAST - Most complex**

Extract from `consciousness/`:
- Recursive self-awareness
- Philosophical synthesis
- Phenomenological states
- Inner dialog generation

---

## Phase 7: Gateway & Distribution (Week 12)

### Objective: Extract web gateway and distributed features

#### 7.1 **viable-systems/vsm-web-gateway** 🌐
Extract from `web_gateway/`:
- Multi-transport system
- Protocol selection
- Adaptive routing

#### 7.2 **viable-systems/vsm-distributed** 🌍
Extract distributed consensus, CRDTs, partition detection

---

## Phase 8: Optional Extractions (Week 13)

### Objective: Decide whether to extract or keep in core

#### 8.1 **viable-systems/vsm-temporal-variety** ⏰
Currently 1,368 lines in vsm-core - could remain there

#### 8.2 **viable-systems/vsm-algedonic** 💔❤️
Currently 814 lines in vsm-core - could remain there

#### 8.3 **viable-systems/vsm-legacy-adapters** 🔄
V1 compatibility layers (40-50% of system!)

#### 8.4 **viable-systems/vsm-crdt** 🔗
CRDT implementations if not in vsm-distributed

---

## Phase 9: Main Applications (Week 14-15)

### Objective: Build applications using hex packages

#### 9.1 **viable-systems/viable-system** 🏢
The main platform - uses ALL packages
```elixir
# mix.exs deps
{:vsm_core, "~> 0.1"},
{:vsm_event_bus, "~> 0.1"},
{:vsm_consciousness, "~> 0.1"},
# ... all 13+ packages
{:phoenix, "~> 1.7"},
{:phoenix_live_view, "~> 0.20"}
```

#### 9.2 **viable-systems/variety-engineering** 📝
Blog platform focused on VSM education
- Phoenix app
- Uses vsm_core, vsm_consciousness
- Markdown blog engine

#### 9.3 **viable-systems/adaptive-control** 💼
Consulting platform
- Client portal
- Case study management
- Uses vsm_core, vsm_metrics

#### 9.4 **viable-systems/distributed-vsm** 🔮
Future IoT/Edge product
- Uses vsm_distributed, vsm_connections
- Kubernetes operators

---

## Phase 10: Support & Tools (Week 16)

### Objective: Developer experience and tooling

#### 10.1 **viable-systems/vsm-cli** 🛠️
```bash
vsm new my_project
vsm generate subsystem s1
vsm test consciousness
```

#### 10.2 **viable-systems/vsm-examples** 💡
- Simple VSM
- VSM with consciousness
- Distributed VSM
- IoT VSM

#### 10.3 **viable-systems/vsm-benchmarks** ⚡
Performance testing suite

#### 10.4 **viable-systems/vsm-dashboard** 📊
Phoenix LiveDashboard custom pages

#### 10.5 **viable-systems/vsm-devtools** 🔧
Development utilities and debugging tools

---

## Dependency Order (Critical Path)

```
Level 0 (No deps):
├── vsm-telemetry
├── vsm-goldrush
└── vsm-rate-limiter

Level 1 (Depends on Level 0):
└── vsm-core

Level 2 (Depends on vsm-core):
├── vsm-event-bus
├── vsm-vector-store
├── vsm-metrics
└── vsm-security

Level 3 (Depends on Level 2):
├── vsm-connections (needs event-bus)
├── vsm-pattern-engine (needs vector-store)
├── vsm-external-interfaces
├── vsm-web-gateway
└── vsm-distributed

Level 4 (Depends on Level 3):
├── vsm-mcp (needs connections)
└── vsm-amcp (needs mcp)

Level 5 (Depends on ALL):
└── vsm-consciousness
```

---

## Migration Checklist for Each Package

- [ ] Create repository from vsm-starter template
- [ ] Extract code from monolith
- [ ] Update module names (AutonomousOpponent → Vsm)
- [ ] Create comprehensive README.md
- [ ] Write package documentation
- [ ] Add examples/ directory
- [ ] Setup CI/CD (test, format, dialyzer, credo)
- [ ] Add CHANGELOG.md
- [ ] Publish to Hex.pm (start at 0.1.0)
- [ ] Update vsm-docs with package info
- [ ] Create GitHub release

---

## Success Metrics

1. **Test Coverage**: Each package maintains 80%+ coverage
2. **Documentation**: 100% public functions documented
3. **Examples**: At least 3 examples per package
4. **CI/CD**: All checks passing before publish
5. **Adoption**: Track Hex.pm downloads

---

## Risk Mitigation

1. **Circular Dependencies**: Carefully planned extraction order
2. **Breaking Changes**: Maintain compatibility layer for 6 months
3. **Missing Functionality**: Keep integration tests in main app
4. **Version Conflicts**: Use exact versions during migration
5. **Documentation Gaps**: Document as you extract

---

## Timeline Summary

| Phase | Week | Deliverables | Repository Count |
|-------|------|-------------|------------------|
| 1 | 1 | Foundation | 2 |
| 2 | 2-3 | Core Dependencies | 5 |
| 3 | 4-5 | VSM Core | 7 |
| 4 | 6-7 | Infrastructure | 10 |
| 5 | 8-9 | Intelligence | 13 |
| 6 | 10-11 | Advanced | 16 |
| 7 | 12 | Gateway/Distributed | 18 |
| 8 | 13 | Optional | 22 |
| 9 | 14-15 | Applications | 26 |
| 10 | 16 | Support Tools | 31 |

**Total Duration**: 16 weeks
**Total Repositories**: 31

---

## Post-Migration

1. Archive `autonomous-opponent-v2` with redirect notice
2. Update all documentation to reference new packages
3. Create migration guide for existing users
4. Announce on Elixir Forum and social media
5. Submit talks to ElixirConf about VSM implementation