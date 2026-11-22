# Principles of Programming Languages - Assignment 2

Group 50 | CS F301 Principles of Programming Languages

## Problems

| Problem | Topic | Solution | Tests | Prompt record |
|---|---|---|---|---|
| P1 | Department assignment puzzle | `code/50_q1.pl` | `tests/50_q1_tests.pl` | `prompts/P1.md` |
| P2 | Arithmetic equations | `code/50_q2.pl` | `tests/50_q2_tests.pl` | `prompts/P2.md` |
| S1 | Binary tree traversals | `code/50_q3.rkt` | `tests/50_q3_tests.rkt` | `prompts/S1.md` |
| S2 | Conditional insertion into nested lists | `code/50_q4.rkt` | `tests/50_q4_tests.rkt` | `prompts/S2.md` |

`skills/` contains the Prolog and Scheme development instructions. `P1_REPORT.md` describes the P1 solution count and the proposed ninth clue. The prompt records explain how they were reconstructed.

## Requirements

Use SWI-Prolog 9.x and Racket 8.x. Run the commands from the repository root. The solution files contain definitions and do not run tests at load time. Consult the assignment for the full rules and the permitted Scheme built-ins.

Run P1's main predicate:

```sh
swipl -q -f code/50_q1.pl -g main -t halt
```

Run the Prolog tests:

```sh
swipl -q -s tests/50_q1_tests.pl -g run_tests -t halt
swipl -q -s tests/50_q2_tests.pl -g run_tests -t halt
```

The Scheme tests are snippets appended to a temporary copy of the corresponding solution, following the grader's approach. In PowerShell:

```powershell
$testCopy = Join-Path $env:TEMP "ppl-50-q3-test.rkt"
Get-Content code/50_q3.rkt, tests/50_q3_tests.rkt | Set-Content -Encoding utf8 $testCopy
racket $testCopy
Remove-Item -LiteralPath $testCopy

$testCopy = Join-Path $env:TEMP "ppl-50-q4-test.rkt"
Get-Content code/50_q4.rkt, tests/50_q4_tests.rkt | Set-Content -Encoding utf8 $testCopy
racket $testCopy
Remove-Item -LiteralPath $testCopy
```

Compare S1 output with the expected lines in its test file; S2 prints `#t` for each check. If the runtimes are not on `PATH`, use the full path to each executable.
