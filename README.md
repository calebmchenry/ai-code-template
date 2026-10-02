# AI code template

A starting point for new projects: file-based issue tracking, a documentation
structure, and a small `AGENTS.md` that directs agents to the right context.

## Start a project

Install [wrk](https://github.com/calebmchenry/wrk#build-and-install) and make sure
`wrk` is on your `PATH`. The initializer uses Bash and standard Unix tools on
macOS or Linux; it checks for required tools before creating project files.

From this repository, run:

```sh
./init.sh ../my-project
```

The destination must be new or empty. The script copies `template/` (including
dotfiles), runs `wrk init` in the new project, and validates the tracker. It does
not install tools. If initialization fails after copying, the files remain in the
destination so you can inspect the error and finish setup there.

Then update the new project's `README.md` and add its setup and development
instructions to `docs/wiki/`, linking them from `docs/wiki/index.md`. Initialize
Git when ready, and commit `.wrk/` along with the project; its temporary runtime
files are already ignored.

## Template contents

| Path | Purpose |
| --- | --- |
| `template/AGENTS.md` | Short entry point for agents, with essential workflow rules and links. |
| `template/docs/decisions/` | Decisions and the reasoning behind them. |
| `template/docs/artifacts/` | Screenshots, mockups, diagrams, and other supporting files. |
| `template/docs/prds/` | Product requirements describing what to build and how it should behave. |
| `template/docs/wiki/` | Practical project knowledge, discoverable through `index.md`. |

Edit `template/` to change what future projects receive. Tool checks and
initialization commands live in `init.sh`.
