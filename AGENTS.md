# Global Agent Work Governance

GLOBAL_WORK_POLICY: v1.0
OWNER_INTENT: Applies to every development project unless the user explicitly overrides a rule.

## 1. Mandatory visible cadence

- Work in bounded cycles of 8 minutes, with an absolute maximum of 12 minutes before returning a visible progress update to the user.
- Never keep working silently beyond 12 minutes.
- If a task will exceed one cycle, stop at a safe checkpoint, report progress, then continue in the next cycle.
- Each progress update must state: what changed, concrete evidence/result, what is still running or blocked, and the next action.
- Waiting for CI, builds, runners, downloads, or external services does not justify silence. Use the wait to do useful independent work, or report that the cycle is waiting.
- Do not repeatedly poll status. After at most two consecutive status-only checks, either do useful work or report progress.
- If blocked, degraded, disconnected, or uncertain, report it inside the current cycle instead of silently retrying for a long time.

## 2. External evidence over memory

- Do not rely on chat memory alone for project state or work rules.
- Read the repository's AGENTS.md, START_HERE.md, PROJECT_STATE.md, handoff/state files, and active PR/issue state when relevant.
- Prefer durable repository state, CI results, commits, tests, and artifacts over assumptions.
- Keep important cross-chat decisions in versioned project files.

## 3. Technical strategy before implementation

- Before a material technical choice, inspect the existing project and, when current external knowledge matters, check authoritative documentation or current best practice.
- Reuse proven project patterns before inventing new infrastructure.
- Prefer the minimum infrastructure needed for the next concrete progress.
- Do not generalize or automate early unless the capability is already repeatedly useful across projects.
- When a reusable tool clearly benefits multiple projects, isolate it into a reusable component or dedicated repository instead of burying it in one product.

## 4. Parallel work and runners

- Use parallel runners only for independent useful work.
- Do not create fake work merely to occupy runners.
- If useful tasks are pending and runners are free, parallelize them when merge ordering and shared state remain safe.
- Preserve initial dependency and merge order so older work cannot overwrite newer validated work.

## 5. Git and merge discipline

- Start from the latest intended base.
- Keep each branch/task scoped.
- Validate the exact head that will be merged.
- Do not merge stale, failing, cancelled, or superseded validation.
- Prefer exact-head merge after required checks are green.
- Never force-push or rewrite shared history unless the user explicitly requests it and the risk is understood.
- Keep secrets out of tracked files and logs.

## 6. QA and visual verification

- For web applications, use deterministic browser QA where practical: desktop/mobile, scroll, focus, navigation, form states, errors, empty states, and representative end-to-end paths.
- Distinguish genuine product defects from screenshot/focus/scroll artifacts before changing product code.
- Use synthetic test data by default. Do not contact real customers, send real email/SMS, move money, or mutate production business data unless explicitly authorized for that specific action.
- Keep temporary screenshots and test fixtures disposable unless they are intentionally retained as artifacts.

## 7. Deployments and external side effects

- Development, tests, and local/staging validation may proceed autonomously when already authorized.
- Production deployment, paid provider activation, real customer communication, financial movement, destructive data changes, or other irreversible external effects require the project's explicit standing authorization or a direct user request.
- Project-specific deployment restrictions always remain in force.

## 8. Handoffs and continuity

- Maintain a concise durable state for long projects: current objective, last verified commit/PR, active blockers, next action, and project-specific constraints.
- A new chat must be able to resume from repository state without reconstructing the project from memory.
- If conversation context and repository state disagree, verify the repository before acting.

## 9. Conflict rule

- System, developer, safety, and direct current-user instructions take precedence.
- Project-specific AGENTS.md may add stricter rules or product constraints.
- Project-specific rules must not silently weaken the 8-12 minute visible cadence unless the user explicitly changes that cadence.
