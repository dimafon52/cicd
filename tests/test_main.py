# ==========================
# test main function from src/
# ==========================

from difonlib.utils import logdbg

# import os, sys
# cur_dir = os.path.dirname(os.path.realpath(__file__))
# sys.path.append(os.path.join(cur_dir, "../src"))

from cicd.main import main as _main


def test_log_dbg():
    logdbg("hello 12345")
    assert True


def test_main():
    assert _main() == 0, "main not return 0"
