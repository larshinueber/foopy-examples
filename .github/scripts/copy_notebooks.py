import sys
from pathlib import Path

"""
Use the find command line utility to find the paths of all
notebooks in this repository and store them in a list
"""

source_dir = Path(sys.argv[1])
target_dir = Path(sys.argv[2])

print(f"Copying files from {source_dir} to {target_dir}")

from shutil import copy

# match all files in source_dir
example_files = Path(source_dir).rglob("*.*")
print(example_files)

# ignore files with the following extensions
files_types_to_ignore = [".py"]
example_files = [
    path for path in example_files if path.suffix not in files_types_to_ignore
]

# copy files to target_dir
for file in example_files:

    target_path = target_dir / file.relative_to(source_dir)
    target_path.parent.mkdir(parents=True, exist_ok=True)

    print(f"Copying {file} to {target_path}")
    copy(file, target_path)
