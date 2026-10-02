# Agent guide

This repo is a reusable project template. Start with [README.md](README.md).

- `template/` is copied into new projects; keep it generic and minimal. Its contents must not reference their template origin.
- `init.sh` checks prerequisites, copies files, and initializes `wrk`. Preserve existing files.
- Keep agent instructions short; put reusable guidance in the [wiki](template/docs/wiki/index.md).
- For initializer changes, run `bash -n init.sh` and smoke-test in temporary directories.
