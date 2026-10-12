# AERA Recovery for Nubia Z60 Ultra (NX721J / cerro)

Device tree + GitHub Actions workflow. Run **Actions -> Build AERA recovery -> Run workflow**.
The resulting `recovery.img` is ramdisk-only (kernel comes from `boot`). Flash to the **inactive** slot only:

    fastboot flash recovery_b recovery.img

`recovery/root/vendor` holds blobs (keymint/gatekeeper/qseecomd) taken from the device's own recovery. Keep this repo private.
