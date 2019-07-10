#!/bin/sh

middle="";
((`printf "%(%-S)T"` % 2)) && middle=":" || middle=" ";

format="%H$middle%M"; 
echo $(date +"$format");
