#!/usr/bin/env python3

import os

# Read default config lines
with open('config_default.conf', 'r') as f:
    default_lines = f.readlines()

# Files to check
files_to_check = ['bind.conf', 'config.conf', 'env.conf', 'rule.conf']

for file in files_to_check:
    if not os.path.exists(file):
        continue
    with open(file, 'r') as f:
        lines = f.readlines()
    new_lines = []
    for line in lines:
        # if line in default_lines and line.strip() and not line.strip().startswith('#'):
        #     new_lines.append('\n# ------ #\n# this is default config\n')
        #     new_lines.append(f'# {line}')
        #     new_lines.append('# ----- # \n\n')
        new_lines.append(f' {line}')
    with open(file, 'w') as f:
        f.writelines(new_lines)
