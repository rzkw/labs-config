# Git Divergence Resolution Summary 22/05/2026

**Problem**
A local feature branch diverged from its remote counterpart (3 local commits ahead, 4 unwanted remote commits ahead). The goal was to align the local work with the latest upstream main and push the local state to the remote feature branch, entirely discarding the 4 unwanted remote commits.

**Constraints**
- Do not delete the remote tracking branch.
- Do not start a new local working branch from scratch.
- The upstream main branch must remain completely untouched and safe.

**Complication**
An accidental `git pull` had already merged the unwanted remote commits into the local history. Furthermore, a syntax confusion (`git rebase origin main` instead of `git rebase origin/main`) caused the rebase attempt to target the wrong base, resulting in a no-op.

**Solution**
1. **Rollback:** Use `git reflog` to locate the local state immediately prior to the accidental pull, then run `git reset --hard HEAD@{X}` to strip the unwanted merge from local history.
2. **Update Cache:** Run `git fetch origin main` to download the latest state of the main branch from the server.
3. **Replay Commits:** Run `git rebase origin/main` (using the slash) to replay the clean local commits on top of the newly fetched main branch tracking reference.
4. **Overwrite Remote:** Execute `git push origin <feature-branch> --force-with-lease` to safely overwrite the remote feature branch with the newly rebased local history.