![tera_type_stellar_symbol_paldea_by_jormxdos_dg5qm2y-fullview](https://github.com/user-attachments/assets/41fd7242-c9dc-44ff-9ebd-812c4f9ac4a6)
# stellarOS


![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/main/images/archlinux-badge.svg)
![Bash](https://raw.githubusercontent.com/picodotdev/alis/main/images/sh-bash-badge.svg)
![Shellcheck](https://github.com/picodotdev/alis/actions/workflows/shellcheck.yml/badge.svg)

[![Arch Linux](https://raw.githubusercontent.com/picodotdev/alis/main/images/archlinux.svg "Arch Linux")](https://www.archlinux.org/)

## Principles

* Use the original Arch Linux installation media
* As unattended and automated as possible, requires as little interactivity as possible
* Allow to customize the installation to cover the most common cases
* Provide support for system recovery
* Provide support for installation log
* Use sane configuration default values

## Features

* **System**: UEFI, BIOS
* **Storage**: SATA, NVMe and MMC
* **Encryption**: root partition encrypted and no encrypted
* **Partition**: no LVM, LVM, LVM on LUKS, GPT on UEFI, MBR on BIOS, custom partition scheme and mountpoints
* **File system**: ext4, btrfs (with subvols), xfs, f2fs, reiserfs
* **Kernels**: linux, linux-lts, linux-hardened, linux-zen. Supports Unified Kernel Image (UKI).
* **Desktop environment**: Budgie
* **Display managers**: SDDM
* **Graphics controller**: intel, nvidia and amd with optionally early KMS start. With intel optionally fastboot, hardware video acceleration and framebuffer compression.
* **Bootloader**: GRUB, rEFInd, systemd-boot, efistub
* **Custom shell**: bash, zsh, dash, fish
* **WPA WIFI network** installation
* **Periodic TRIM** for SSD storage
* Intel and AMD **processors microcode**
* Optional **swap file**
* **PipeWire** support
* **Secure Boot** support
* **Kernel compression** and **custom parameters**
* **Users creation** and **add to sudoers**
* **systemd units enable or disable**
* **systemd-homed** support
* **systemd GPT partition automounting** support
* **Multilib** support
* **Files provision** support
* **VirtualBox guest additions** and **VMware tools** support
* **SSH install** and **cloud-init** support
* Arch Linux custom **packages installation** and **repositories installation**
* Flatpak utility installation and **Flatpak packages installation**
* SDKMAN utility installation and **SDKMAN packages installation**
* **AUR utility** installation (paru, yay, aurman) and **AUR packages installation**
* **Packages installation after base system installation** (preferred way of packages installation)
* Script for download installation and **recovery scripts** and configuration files
* **Retry packages download** on connection/mirror error
* **Packer support** for testing in VirtualBox
* **Installation log** with all commands executed and output in a file and/or **asciinema video**
* Wait after installation for an **abortable reboot**
* **Use your own configuration**
* Bash scripts validated by [Shellcheck](https://www.shellcheck.net/)

## System installation

Download and boot from the latest <a href="https://www.archlinux.org/download/">original Arch Linux installation media</a>. After boot use the following commands to start the installation.

Follow the <a href="https://wiki.archlinux.org/title/Arch_Linux">Arch Way</a> of doing things and learn what this script does. This will allow you to know what is happening.

Internet connection is required, with wireless WIFI connection see <a href="https://wiki.archlinux.org/title/Wireless_network_configuration#Wi-Fi_Protected_Access">Wireless_network_configuration</a> to bring up WIFI connection before start the installation.

**Minimum usage**

```
#                         # Start the system with latest Arch Linux installation media
# loadkeys [keymap]       # Load keyboard keymap, eg. loadkeys us, loadkeys ro, loadkeys ru
# curl -sL https://raw.githubusercontent.com/NoltixOS/stellar-os/main/download.sh | bash       # Download scripts
# ./alis.sh               # Start installation
```

## Package installation

After the base system is installed, stellarOS can install packages with pacman, Flatpak, SDKMAN and from AUR.

```
#                                  # After system installation start a user session
# curl -sL https://raw.githubusercontent.com/picodotdev/alis/main/download.sh | bash       # Download alis scripts
# # curl -sL https://git.io/JeaH6 | bash                                                   # Alternative download URL with URL shortener
# ./alis-packages-asciinema.sh     # (Optional) Start asciinema video recording
# vim alis-packages.conf           # Edit configuration and change variables values with your preferences (packages to install)
# ./alis-packages.sh               # Start packages installation
```

```

## Desktop

stellarOS's default desktop is Budgie, a very modern and powerful GNOME based DE.

## How you can help

* Test in VirtualBox and create an issue if something does not work, attach the main parts of the used configuration file and the error message
* Create issues with new features
* Send pull requests  jhhmn

Also, if you prefer to install an Arch Linux using a guided graphical installer you can choose an [Arch based distribution](https://wiki.archlinux.org/title/Arch-based_distributions#Active). 

* [ArcoLinux](https://arcolinux.com/)
* [Manjaro](https://manjaro.org/)
* [EndeavourOS](https://endeavouros.com/)
* [GarudaLinux](https://garudalinux.org/)
* [Archlabs](https://archlabslinux.com/)
* [RebornOS](https://rebornos.org/)
* [BlackArch](https://blackarch.org/)

Also and recommended for new Arch Linux newcomers to follow the Arch Way of doing things is a good way to use and learn about Arch. There are many guides out there, the official Arch Linux installation guide the first one. These are other good ones that explains step by step from instalation media creation to first boot and programs installation, all the necessary to start.

* [The Arch Linux Handbook](https://www.freecodecamp.org/news/how-to-install-arch-linux/)

## Test in VirtualBox with Packer

VirtualBox and [Packer](https://packer.io/) are required.

* Firmware: efi, bios
* File system: ext4, btrfs, f2fs, xfs
* Partition: luks, lvm
* Bootloader: grub, refind, systemd
* Desktop environment: gnome, kde, xfce, ...

```
$ packer plugins install github.com/hashicorp/virtualbox
$ ./alis-packer.sh -c alis-packer-efi-ext4-systemd.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-systemd-gnome.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-luks-lvm-grub.sh
$ ./alis-packer.sh -c alis-packer-efi-btrfs-luks-lvm-systemd.sh
$ ./alis-packer.sh -c alis-packer-efi-f2fs-luks-lvm-systemd.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-grub-gnome.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-grub-kde.sh
$ ./alis-packer.sh -c alis-packer-efi-ext4-grub-xfce.sh
```

## Arch Linux Installation Media

https://www.archlinux.org/download/

## Reference

* https://archlinux.org/pacman/pacman.conf.5.html#_repository_sections
* https://gitlab.archlinux.org/archlinux/archiso/-/blob/master/configs/releng/packages.x86_64
* https://tldp.org/LDP/abs/html/
* https://tldp.org/LDP/Bash-Beginners-Guide/html/
* https://wiki.archlinux.org/title/AMDGPU
* https://wiki.archlinux.org/title/Arch_User_Repository
* https://wiki.archlinux.org/title/ATI
* https://wiki.archlinux.org/title/Awesome
* https://wiki.archlinux.org/title/Bluetooth
* https://wiki.archlinux.org/title/Bspwm
* https://wiki.archlinux.org/title/Btrfs
* https://wiki.archlinux.org/title/Budgie
* https://wiki.archlinux.org/title/Category:Boot_loaders
* https://wiki.archlinux.org/title/Cloud-init
* https://wiki.archlinux.org/title/Command-line_shell
* https://wiki.archlinux.org/title/Deepin_Desktop_Environment
* https://wiki.archlinux.org/title/Desktop_environment
* https://wiki.archlinux.org/title/Dm-crypt
* https://wiki.archlinux.org/title/Dm-crypt/Device_encryption
* https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system
* https://github.com/bakkeby/dusk
* https://wiki.archlinux.org/title/EFI_System_Partition
* https://wiki.archlinux.org/title/Ext4
* https://wiki.archlinux.org/title/F2FS
* https://wiki.archlinux.org/title/File_systems
* https://wiki.archlinux.org/title/Fstab
* https://wiki.archlinux.org/title/General_recommendations
* https://wiki.archlinux.org/title/GNOME
* https://wiki.archlinux.org/title/GRUB
* https://wiki.archlinux.org/title/Hardware_video_acceleration
* https://wiki.archlinux.org/title/I3
* https://wiki.archlinux.org/title/Install_Arch_Linux_via_SSH
* https://wiki.archlinux.org/title/Installation_guide
* https://wiki.archlinux.org/title/Intel_graphics
* https://wiki.archlinux.org/title/Intel_NUC
* https://wiki.archlinux.org/title/KDE
* https://wiki.archlinux.org/title/Kernel_mode_setting
* https://wiki.archlinux.org/title/Kernel_parameters
* https://wiki.archlinux.org/title/Kernels
* https://wiki.archlinux.org/title/LeftWM
* https://wiki.archlinux.org/title/List_of_applications
* https://wiki.archlinux.org/title/LVM
* https://wiki.archlinux.org/title/Main_page
* https://wiki.archlinux.org/title/Microcode
* https://wiki.archlinux.org/title/Mirrors
* https://wiki.archlinux.org/title/Mkinitcpio
* https://wiki.archlinux.org/title/Network_configuration
* https://wiki.archlinux.org/title/NetworkManager
* https://wiki.archlinux.org/title/Nouveau
* https://wiki.archlinux.org/title/NVIDIA
* https://wiki.archlinux.org/title/Openbox
* https://wiki.archlinux.org/title/Pacman
* https://wiki.archlinux.org/title/Partitioning
* https://wiki.archlinux.org/title/Persistent_block_device_naming
* https://wiki.archlinux.org/title/PipeWire
* https://wiki.archlinux.org/title/Qtile
* https://wiki.archlinux.org/title/REFInd
* https://wiki.archlinux.org/title/Reflector
* https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot
* https://wiki.archlinux.org/title/Solid_state_drive/NVMe
* https://wiki.archlinux.org/title/Solid_State_Drives
* https://wiki.archlinux.org/title/Swap
* https://wiki.archlinux.org/title/Systemd
* https://wiki.archlinux.org/title/Systemd#GPT_partition_automounting
* https://wiki.archlinux.org/title/Systemd-boot
* https://wiki.archlinux.org/title/Systemd-homed
* https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface
* https://wiki.archlinux.org/title/VirtualBox
* https://wiki.archlinux.org/title/Wayland
* https://wiki.archlinux.org/title/Wireless_network_configuration
* https://wiki.archlinux.org/title/Wireless_network_configuration#Connect_to_an_access_point
* https://wiki.archlinux.org/title/Xfce
* https://wiki.archlinux.org/title/XFS
* https://wiki.archlinux.org/title/Xorg

