---
name: scheme-dev
description: Develop and review the assignment's Racket 8.x Scheme functions.
---

# Environment and conventions

Use Racket 8.x with `#lang racket/base`. Use only the forms and built-ins listed in the assignment; S2 additionally permits `read`. In particular, do not use built-in `length`, `append`, `reverse`, `map`, `filter`, `member`, mutation, vectors, strings, or loop forms. Define any needed list helpers using permitted forms.

Give helpers descriptive names and explain their recursive meaning, base case, and any accumulator invariant. Pass state through arguments; use tail recursion where natural for long flat lists. Solution files contain definitions only and are silent when loaded. Work one function, test file, or review per prompt; save actual prompts verbatim.

# Run and test

Run `racket code/50_q3.rkt` and `racket code/50_q4.rkt` to check silent loading. For functional tests, append the corresponding test snippet to a temporary copy of the solution and run that copy, matching how the grader adds calls. Check exact displayed output and trailing newlines. Keep test-only helpers out of the solution file.

# Self-review checklist

- Confirm every function name, input shape, output format and built-in against the assignment.
- Check empty, single-element, nested, symbolic and skewed cases as appropriate.
- For trees, check left-before-right traversal order, empty-tree height, and the definition of a leaf.
- For nested insertion, measure the original list's top-level length, visit empty lists and the top level, preserve order, and never recurse into a newly inserted value.
- Check `n = 0`, depth 100, and a flat list of 10,000 elements; verify the result structure, not only that evaluation completes.
- Confirm each printing function emits exactly the specified output and newline, with no load-time output.
- State which checks actually ran, their runtime version, and any unresolved failures. Never invent test results or prompt history.

# Common AI failure modes

AI-generated Scheme can confuse an empty list with an atom, use prohibited standard-library helpers, measure a transformed list instead of the original, miss the top-level or nested empty lists, reverse output accidentally, or build a long non-tail recursion chain for a flat input. It can also omit a newline or execute tests at top level. Inspect the code and verify boundary cases explicitly.
