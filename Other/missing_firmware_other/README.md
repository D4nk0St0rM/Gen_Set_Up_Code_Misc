### Various 'Possible Missing' issues  on installs

#### Kali 2022.2

```
update-initramfs: Generating /boot/initrd.img-5.18.0-kali5-amd64
W: Possible missing firmware /lib/firmware/i915/skl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/bxt_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/kbl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/glk_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/kbl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/kbl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/cml_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/icl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/ehl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/ehl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/tgl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/tgl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/dg1_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/tgl_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/adlp_guc_69.0.3.bin for module i915
W: Possible missing firmware /lib/firmware/i915/adlp_dmc_ver2_14.bin for module i915

```
[Main source for solution](https://askubuntu.com/questions/832524/possible-missing-firmware-lib-firmware-i915/832528#832528)

- [Blobs Download](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915)

**NB**: firmware drivers are now known as BLOBS - **B**inary **L**arge **OB**ject

  - bxt Broxton, Canceled in 2016 & successor to Cherry Trail processors
  - kbl Kabylake 7th generation, eg i7-7700
  - skl Skylake 6th generation, eg i7-6700
  - Subgroups
    - GuC is designed to perform graphics workload scheduling on the various graphics parallel engines.
    - DMC provides additional graphics low-power idle states.
    - HuC is designed to offload some of the media functions from the CPU to GPU.

