Code Summary
============

A little collection of scripts to summarise one or more projects:
- crude lines of code
- git repository activity and monthly stats

## Examples

*Lines of code*

Summarise where the lines of code can be found:

```bash
loc repo1 repo2 \
  | select_ext \
  | loc-summary summary
```

Summarise by file extension:

```bash
loc repo1 repo2 \
  | select_ext \
  | loc-summary ext
```

Summarise by repo:

```bash
loc repo1 repo2 \
  | select_ext \
  | loc-summary repo
```

Cross tabulate by repo and extension:

```bash
loc repo1 repo2 \
  | select_ext \
  | loc-summary ext-repo
```
