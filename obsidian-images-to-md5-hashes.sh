#!/usr/bin/env bash

function _usage() {
	echo "usage: ${0##*/} </path/to/vault/> <name-of-attachment-dir>"
}

case $1 in
	''|--help) _usage; exit;;
esac
[ $# -eq 2 ] || { _usage; exit; }

vault="${1%/}"
attach_dir="${2%/}"
attach_abs="$vault/$attach_dir"

if [ ! -e "$vault" ]; then
	echo "vault dir $vault not found"
	exit 1
fi

if [ ! -e "$attach_abs" ]; then
	echo "attachment dir $attach_abs not found"
	exit 1
fi

shopt -u nullglob

cd "$vault" || { echo "error: could not access vault dir"; exit 1; }

backupdir="backup-$(date +%s)"
mkdir -p "$backupdir"
while IFS= read -r IMAGENAME; do
	LOCALIZED_IMAGE="${IMAGENAME##*/}"
	EXT=$(tr '[:upper:]' '[:lower:]' <<<"${LOCALIZED_IMAGE##*.}")
	HASH=$(md5 -q "$IMAGENAME")
	if [ "$HASH.$EXT" == "$LOCALIZED_IMAGE" ]; then
		#skip - already hashed
		continue
	fi
	echo "processing $LOCALIZED_IMAGE"
	#grep --extended-regexp --files-with-matches "\!\[\[$LOCALIZED_IMAGE" ./*.md
  sed -E -i.bak "s#\!\[\[($attach_dir/)?$LOCALIZED_IMAGE\]\]#\!\[\[$HASH.$EXT\]\]#g" ./*.md
	cp -f "$IMAGENAME" "$attach_abs/$HASH.$EXT"
	mv "$IMAGENAME" "$backupdir/"
done < <(find -s -E "./$attach_dir" -type f -iregex '.*\.(PNG|JPG)$')
mv ./*.bak "$backupdir/"

shopt -s nullglob
