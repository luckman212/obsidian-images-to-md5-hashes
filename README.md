## obsidian-images-to-md5-hashes

See https://forum.obsidian.md/t/rename-images-from-screen-shot-xxxx-to-its-md5-hash/17141

## Usage

obsidian-images-to-md5-hashes.sh </path/to/vault/> <name-of-attachment-dir>

e.g.

```
obsidian-images-to-md5-hashes.sh "/Users/luke/Documents/My Vault2/" attach
```

This is somewhat inefficient, but it does work. May take 5 minutes or more to process a large vault. Really depends on how many images you have in your attachdir.

When complete, backups of the original filenames and markdown files will be put in a timestamped `"backup-XXXXXXXXXX"` folder within the vault dir.
