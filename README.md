# nornsvember

A monome norns script.

## Description

This is a skeletal norns script ready for development.

## Features

- Basic parameter system
- Screen redraw loop
- Encoder and key handlers
- PolyPerc engine integration
- Helper library module

## Installation

From maiden:
```
;install https://github.com/yourusername/nornsvember
```

Or manually copy the `nornsvember` folder to `~/dust/code/`.

## Usage

- E1: Adjust level
- E2: Change note
- K2: Play note
- K3: (unused)

## Structure

```
nornsvember/
├── nornsvember.lua    # main script
├── lib/
│   └── helpers.lua    # utility functions
└── README.md
```

## Development

The main script includes:
- `init()` - initialization and parameter setup
- `enc()` - encoder input handling
- `key()` - key input handling
- `redraw()` - screen drawing
- `cleanup()` - cleanup on script exit

## License

Your license here
