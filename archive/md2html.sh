#!/bin/bash
(
echo '<!DOCTYPE html>'
echo '<html>'
echo '<head><meta charset="utf-8"><title>preview</title></head>'
echo '<body>'
md2html $1
echo '<link rel="stylesheet" href="style.css">'
echo '</body>'
echo '</html>'
) > $2
