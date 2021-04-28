![logo](./logo.png)

## obsidian-images-to-md5-hashes

Renames randomly-named images in your [Obsidian](https://obsidian.md/) vault to the MD5 hash of the image itself (also updates the markdown files themselves). See https://forum.obsidian.md/t/rename-images-from-screen-shot-xxxx-to-its-md5-hash/17141

## Setup

1. Download [the script](https://raw.githubusercontent.com/luckman212/obsidian-images-to-md5-hashes/main/obsidian-images-to-md5-hashes.sh)
2. `chmod +x obsidian-images-to-md5-hashes.sh`
3. copy or move it to somewhere in your `$PATH`

## Usage

```shell
obsidian-images-to-md5-hashes.sh </path/to/vault/> <name-of-attachment-dir>
```

e.g.

```shell
obsidian-images-to-md5-hashes.sh "/Users/luke/Documents/My Vault2/" attach
```

This is somewhat inefficient, but it does work. May take 5 minutes or more to process a large vault. Really depends on how many images you have in your attachdir.

When complete, backups of the original filenames and markdown files will be put in a timestamped `"backup-XXXXXXXXXX"` folder within the vault dir.

**N.B.** All images/links will be consolidated into the single attachment folder. The path prefix will be stripped, so links such as `[[attach/foo.png]]` will be converted to `[[hash.png]]`.
