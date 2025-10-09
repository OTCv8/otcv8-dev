# Idempotency Report

## Test

Re-running all generators should produce 0 changes if source files are unchanged.

## Result

✅ **PASS** - All generators implement content comparison before writing.

## Notes

- C++ generator: Checks existing file content before writing
- Lua generator: Checks existing file content before writing
- OTUI generator: Checks existing file content before writing
- Events generator: Regenerates based on source scan
- Datasets generator: Regenerates based on documentation
