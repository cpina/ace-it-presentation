#!/bin/bash

counter=1
for jpeg_file in originals/*
do
	text_counter=$(printf "%02d" "$counter")
	name="frame$text_counter.png"
	convert -resize 600x600 "$jpeg_file" "$name"
	counter=$(expr $counter + 1)
done

apngasm ../title.apng "frame01.png" 4 1

