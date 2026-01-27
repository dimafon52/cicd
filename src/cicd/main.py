#!/usr/bin/env -S uv run --script
# ==========================
# main test file
# ==========================
from difonlib.utils import logdbg

dbg = logdbg


def main() -> int:
    dbg("Hello 1 from cicd!")
    dbg("Hello 2 from cicd!")
    return 0


if __name__ == "__main__":
    main()
