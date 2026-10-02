# Issue tracking

Use [wrk](https://github.com/calebmchenry/wrk) to track project work. Tickets and
configuration live in `.wrk/` and are committed alongside the code. Install the
CLI using its [build and install instructions](https://github.com/calebmchenry/wrk#build-and-install)
and make sure `wrk` is on your `PATH`.

Run commands from the project root. If `.wrk/` does not exist, run `wrk init`
once before using the tracker.

## Daily workflow

1. Run `wrk list` to find existing work and `wrk show <id>` to read a ticket.
   Reuse a ticket that covers the task, or create one with `wrk new "Task title"`.
   `wrk list --ready` shows unblocked work that has not started.
2. Before implementation, run `wrk update <id> --status in-progress`.
3. Keep the ticket body current with scope, acceptance criteria, relevant docs,
   decisions, verification results, and remaining work. Edit the Markdown body
   directly, leaving the YAML frontmatter to the CLI.
4. Run the project's relevant checks and record the results. When the acceptance
   criteria are met, run `wrk update <id> --status done`. Leave unfinished work
   clearly described for the next person or agent.
5. Run `wrk validate` before handing off, and include ticket changes with the
   related code and documentation changes.

Replace `<id>` with the ticket ID printed by `wrk new` or `wrk list`.

## Editing and troubleshooting

Create tickets and change supported metadata through the CLI. Never hand-edit
frontmatter to work around a missing command. Keep direct ticket-body or config
edits and Git operations separate from running CLI mutations.

If commands report an invalid project, run `wrk validate` for diagnostics and
consult the upstream [CLI contract](https://github.com/calebmchenry/wrk/blob/main/docs/cli.md).
If `wrk` is not found, check installation and `PATH`. Commit tickets and
configuration, but leave runtime locks and staging files ignored as configured
in `.gitignore`.
