#!/usr/bin/env bash

ALLSKY_HOST="https://vbas-allsky.s3.amazonaws.com"
TODAYS_DATE=$(date '+%Y%m%d')

echo "Downloading data.json..."
curl --retry 3 -o data.json -sL "${ALLSKY_HOST}/images/data.json" &

array=(one two three four five six seven eight nine ten)
for i in ${!array[@]}; do
  datestr=$(($TODAYS_DATE-$i))

  video="videos/allsky-$datestr.mp4"
  echo "Downloading $video..."
  curl --retry 3 -o $video -sfL "${ALLSKY_HOST}/$video" &

  keogram="keograms/keogram-$datestr.jpg"
  echo "Downloading $keogram..."
  curl --retry 3 -o $keogram -sfL "${ALLSKY_HOST}/$keogram" &

  startrails="startrails/startrails-$datestr.jpg"
  echo "Downloading $startrails..."
  curl --retry 3 -o $startrails -sfL "${ALLSKY_HOST}/$startrails" &
done
