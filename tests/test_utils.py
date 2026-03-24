from project.utils import ROOT_DIR


def test_root_dir_exists():
    assert ROOT_DIR.exists()
