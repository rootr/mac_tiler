#!/usr/local/bin/python3
# Script taken from https://apple.stackexchange.com/questions/429046/bigsur-querying-the-bounds-of-any-visible-window
import os
import sys
import json
import applescript

prog = None
cmd = 'tell Application "System Events" to get the {name,position,size} of every window of every process'


def main():
    s = applescript.AppleScript(cmd)
    output = s.run()
    windows = zip(*output)
    info = []
    unnamed = 0
    for row in windows:
        for item in zip(*row):
            if item[0]:
                name = item[0]
            else:
                name = f'unnamed-{unnamed:0>3}'
                unnamed += 1
            x = item[1][0]
            y = item[1][1]
            w = item[2][0]
            h = item[2][1]
            info.append(
                dict(
                    name=name,
                    x=x,
                    y=y,
                    w=w,
                    h=h
                )
            )
    print(json.dumps(info, indent=2))
    return 0


if __name__ == '__main__':
    prog = os.path.basename(sys.argv[0])
    sys.exit(main())
