---
name: prolog-dev
description: Develop and review the assignment's SWI-Prolog 9.x predicates.
---

# Environment and conventions

Use SWI-Prolog 9.x and the exact file and predicate names specified in the assignment. Use descriptive snake_case names, document intended argument modes where useful, and explain each predicate declaratively: what relationship holds when it succeeds. Keep helpers small. Generate candidate values before applying ground-only checks such as `\=/2`; do not assume negation constrains an unbound variable.

Use only the permitted libraries (`lists`, `apply`, `yall`, `aggregate`). Do not use assert, retract, mutable global variables, initialization directives, or `halt/0`. Keep solution files silent on load and print only the output explicitly required. Keep tests in separate files. Work one predicate, test file, or review per prompt; save actual prompts verbatim.

# Run and test

From the repository root, use `swipl -q -f code/50_q1.pl -g main -t halt` for P1 output, or replace `main` with a quoted goal for other predicates. Run a separate test file with `swipl -q -s tests/50_q1_tests.pl -g run_tests -t halt`; use the corresponding P2 filename for P2. Verify on 9.x even if a newer version passes.

# Self-review checklist

- Check exact predicate names, atoms, strings, ordering, formatting, and silent loading against the assignment.
- Check each relation on satisfying and failing cases, empty and singleton inputs, and relevant boundary values.
- Check that search terminates, enumerates every intended solution, and does not count duplicate proofs as different answers.
- Check variable instantiation before negation, comparison, arithmetic, or other ground-dependent operations.
- For equations, check every nested division for a zero divisor and exact integer quotient; check negative intermediate values and parentheses on both sides.
- For puzzle clues, check each independently and confirm that any proposed uniqueness clue meets the wording; disclose ambiguity.
- State which checks actually ran, their runtime version, and any unresolved failures. Never invent test results or prompt history.

# Common AI failure modes

AI-generated Prolog can use negation on unbound variables, accidentally leave choicepoints that duplicate counts, omit valid expression trees, divide by zero, accept non-integer division, return atoms instead of strings, or print incorrect parentheses. It can also hard-code an answer, load unauthorized libraries, or add initialization code. Check the contract and examples rather than assuming plausible output establishes correctness.
