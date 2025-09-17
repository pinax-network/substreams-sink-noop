# ⚠️ DEPRECATED - Substreams Sink NoOp

> **This repository is deprecated. Please use the `substreams sink noop` subcommand from the main [Substreams](https://github.com/streamingfast/substreams) program instead.**

## Migration Instructions

Instead of using this standalone tool like this:

```bash
substreams-sink-noop mainnet.eth.streamingfast.io:443  /path/to/substreams.spkg outputmodule 0:100000 --noop-mode
```

Get the substreams binary from https://github.com/streamingfast/substreams

Run this

```bash
substreams sink noop mainnet.eth.streamingfast.io:443 /path/to/substreams.spkg outputmodule -s 0 -t 100000
```

For more information and documentation, please visit: https://github.com/streamingfast/substreams

---

## Legacy Documentation (for reference only)

### About

A small sink that can be used to "bootstrap" a Substreams consuming it at the gRPC level discarding the data right away while recording keys metrics of the sink.

You can use that tool to have a Substreams fully synced and which keeps up with live block.

The tool while it runs exposes a bunch of metrics (`0.0.0.0:9102` by default) about the consumption process as well as tracking the cursor and some key metrics of a particular Substreams run.

### Legacy Usage

Install the binary:

- From a pre-compiled release at https://github.com/streamingfast/substreams-sink-noop/releases
- On MacOS use `brew install streamingfast/tap/substreams-sink-noop`
- From source if you have Golang installed with `go install github.com/streamingfast/substreams-sink-noop/cmd/substreams-sink-noop@latest`

```bash
substreams-sink-noop mainnet.eth.streamingfast.io:443 https://github.com/streamingfast/substreams-eth-block-meta/releases/download/v0.4.1/substreams-eth-block-meta-v0.4.1.spkg graph_out
```

> **Note** By default, a subsequent run will restart from last saved cursor found by default in file `pwd`/state.yaml, you can pass `--clean` to start from scratch each time.

### Management API

You can use the management API while the application is running to clean the state on next restart.

#### Reset state on next restart

```shell
# Reset state on next restart
curl -XPOST -d '{}' localhost:8080/reset_state

# Cancel state reset on next restart
curl -XPOST -d '{}' localhost:8080/cancel_reset_state

# Clean shutdown
curl -XPOST -d '{}' localhost:8080/shutdown
```
