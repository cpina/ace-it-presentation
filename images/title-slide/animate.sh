#!/bin/bash

counter=1
for jpeg_file in originals/*
do
	text_counter=$(printf "%02d" "$counter")
	name="frame$text_counter.png"
	convert "$jpeg_file" "$name"
	counter=$(expr $counter + 1)
	echo "$jpeg_file"
done

# apngasm ../title.apng "frame01.png" 4 1
convert -delay 200 *.png test.mp4

