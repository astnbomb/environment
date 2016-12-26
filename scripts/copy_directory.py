#!/usr/bin/env python

import sys
import os
import shutil
import subprocess

maps = [
  ('nsm', 'vns'),
  ('Nsm', 'Vns'),
  ('NSM', 'VNS'),
]

source_dir=os.path.abspath(sys.argv[1])
dest_dir=os.path.abspath(sys.argv[2])

shutil.copytree(source_dir, dest_dir)


def do_rename(source_name):
    for name_from, name_to in maps:
        if name_from in source_name:
            return source_name.replace(name_from, name_to)

    return None


for dirpath, dirnames, filenames in os.walk(dest_dir):
    for file in dirnames:
        source_path = os.path.join(dirpath, file)

        if os.path.isfile(source_path):
            for name_from, name_to in maps:
                subprocess.check_call(
                        "sed -i 's/{}/{}/g' {}".format(
                            name_from,
                            name_to,
                            source_path
                        ),
                        shell=True,
                    )

        rename_to=do_rename(file)
        if rename_to is None:
            continue

        dest_path = os.path.join(dirpath, rename_to)

        print("Moving from %s to %s", source_path, dest_path)
        shutil.move(source_path, dest_path)

for dirpath, dirnames, filenames in os.walk(dest_dir):
    for file in filenames:
        source_path = os.path.join(dirpath, file)

        if os.path.isfile(source_path):
            for name_from, name_to in maps:
                subprocess.check_call(
                        "sed -i 's/{}/{}/g' {}".format(
                            name_from,
                            name_to,
                            source_path
                        ),
                        shell=True,
                    )

        rename_to=do_rename(file)
        if rename_to is None:
            continue

        dest_path = os.path.join(dirpath, rename_to)

        print("Moving from %s to %s", source_path, dest_path)
        shutil.move(source_path, dest_path)


