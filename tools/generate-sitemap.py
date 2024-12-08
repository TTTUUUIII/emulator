#!/usr/bin/env python
import os
import json
import sys
from datetime import datetime, timezone

OUT_DIR=os.path.dirname(os.path.dirname(__file__))

def parse_gameids():
    with open(os.path.join(os.path.dirname(os.path.dirname(__file__)), "data", "datamap.json"), "r", encoding="utf8") as fp:
        data = json.load(fp)
    gameids = []
    for platform in data["data"]:
        for developer in platform["data"]:
            for game in developer["games"]:
                gameids.append(game["id"])
    return gameids

def write_datamap(gameids):
    with open(os.path.join(OUT_DIR, "sitemap.xml"), 'w') as fp:
        fp.write('<?xml version="1.0" encoding="UTF-8"?>\n')
        fp.write('<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n')
        for id in gameids:
            fp.write("\t<url>\n")
            fp.write(f"\t\t<loc>https://emulator.snowland.ink/?id={id}</loc>\n")
            fp.write(f"\t\t<lastmod>{datetime.now(timezone.utc).isoformat()}</lastmod>\n")
            fp.write("\t\t<changefreq>weekly</changefreq>\n")
            fp.write("\t\t<priority>0.5</priority>\n")
            fp.write("\t</url>\n")
        fp.write('</urlset>\n')

if __name__ == "__main__":
    if len(sys.argv) > 1:
        OUT_DIR=sys.argv[1]

    write_datamap(parse_gameids())