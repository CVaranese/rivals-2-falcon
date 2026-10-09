# R2_Captain_Falcon

Backups of the Captain Falcon Rivals of Aether II workshop mod (mod ID `3729910023`).

- `mod/`: mirror of `R2Kit/Project/Content/ModContent/3729910023` (`UnrealAssets/`, `Scripts/`, `ModId.json`)
- `data/`: every data asset (CD_, ATT_, skins, palettes…) dumped to JSON, so values can be read and diffed

**Each commit is one backup.** It's made by `Unreal_Scripts/backup_mod.py` in
[PM_Character_Exporter](https://github.com/CVaranese/PM_Character_Exporter). Run it before every publish.

## Restoring

1. Close R2Kit.
2. Copy `mod/UnrealAssets` (and `mod/Scripts`) from the commit you want back into the mod folder above.
3. Open R2Kit and check, then playtest.

Don't restore over a mod folder that contains `PublishedAssets/`. See the exporter repo's `docs/RECOVERY.md`.
