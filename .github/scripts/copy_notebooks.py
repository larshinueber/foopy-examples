# Standard library imports
import glob
import sys
from pathlib import Path

"""
Use the find command line utility to find the paths of all
notebooks in this repository and store them in a list
"""

source_dir = Path(sys.argv[1])
target_dir = Path(sys.argv[2])

print(f"Copying notebooks from {source_dir} to {target_dir}")

from shutil import copy, copy2, copytree, ignore_patterns

# match any file that does not end with .py
example_notebooks = Path(source_dir).rglob("*.*")
print(example_notebooks)

example_notebooks = [path for path in example_notebooks if path.suffix != ".py"]
print(example_notebooks)
# print([path.relative_to(source_dir) for path in example_notebooks])

for notebook in example_notebooks:

    target_path = target_dir / notebook.relative_to(source_dir)
    print(f"Copying {notebook} to {target_path}")

    target_path.parent.mkdir(parents=True, exist_ok=True)

    copy(notebook, target_path)

# example_notebooks = glob.glob("**/*.ipynb", recursive=True)
