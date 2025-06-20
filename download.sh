#!/usr/bin/env bash
#shellcheck disable=SC2034
#SC2034: foo appears unused. Verify it or export it.
set -eu

# Arch Linux Install Script (alis) installs unattended, automated
# and customized Arch Linux system.
# Copyright (C) 2022 picodotdev

function warning() {
     echo -e "${PURPLE}Welcome to the stellarOS installation${NC}"
        echo -e "${BLUE}this will patch Arch Linux to run stellarOS${NC}"
        echo -e "${BLUE}It will load an automated script.${NC}"
        echo -e "${BLUE}After this, edit the alis.conf file so that you can customize (For example, choosing what DE the script will install, the account etc.)${NC}"
        echo -e "${BLUE}then run ./alsi.sh${NC}"
    echo ""
    echo -e "${RED}Warning"'!'"${NC}"
    echo -e "${RED}This script can delete all partitions of the persistent${NC}"
    echo -e "${RED}storage and continuing all your data can be lost.${NC}"
    echo ""
    echo -e "Install device: $DEVICE."
    echo -e "Mount points: ${PARTITION_MOUNT_POINTS[*]}."
    echo ""
read -p "Press [Enter] to install scripts..."
GITHUB_USER="NoltixOS"
BRANCH="main"
HASH=""
ARTIFACT="stellar-os-${BRANCH}"

while getopts "b:h:u:" arg; do
  case ${arg} in
    b)
      BRANCH="${OPTARG}"
      ARTIFACT="alis-${BRANCH}"
      ;;
    h)
      HASH="${OPTARG}"
      ARTIFACT="alis-${HASH}"
      ;;
    u)
      GITHUB_USER=${OPTARG}
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

set -o xtrace
if [ -n "$HASH" ]; then
  curl -sL -o "${ARTIFACT}.zip" "https://github.com/${GITHUB_USER}/alis/archive/${HASH}.zip"
  bsdtar -x -f "${ARTIFACT}.zip"
  cp -R "${ARTIFACT}"/*.sh "${ARTIFACT}"/*.conf "${ARTIFACT}"/files/ "${ARTIFACT}"/configs/ ./
else
  curl -sL -o "${ARTIFACT}.zip" "https://github.com/${GITHUB_USER}/alis/archive/refs/heads/${BRANCH}.zip"
  bsdtar -x -f "${ARTIFACT}.zip"
  cp -R "${ARTIFACT}"/*.sh "${ARTIFACT}"/*.conf "${ARTIFACT}"/files/ "${ARTIFACT}"/configs/ ./
fi
chmod +x configs/*.sh
chmod +x ./*.sh
