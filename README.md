Code Summary
============

A little collection of scripts to summarise one or more projects:
- crude lines of code
- git repository activity and monthly stats

## Examples

*Lines of code*

Summarise where the lines of code can be found:

```bash
loc.sh repo1 repo2 \
  | select_ext.sh \
  | loc-summary.sh summary
```

Summarise by file extension:

```bash
loc.sh repo1 repo2 \
  | select_ext.sh \
  | loc-summary.sh ext
```

Summarise by repo:

```bash
loc.sh repo1 repo2 \
  | select_ext.sh \
  | loc-summary.sh repo
```

Cross tabulate by repo and extension:

```bash
loc.sh repo1 repo2 \
  | select_ext.sh \
  | loc-summary.sh ext-repo
```
