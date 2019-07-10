#!/bin/sh

engine=$(ibus engine)

if [ $engine == "xkb:ru::rus" ]; then
    echo "ru";
else
    echo "en";
fi
