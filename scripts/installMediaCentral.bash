#!/bin/bash

wget https://editorialbyol.blob.core.windows.net/installers/mediacentral_platform_2019.9.5.iso -O /tmp/mediacentral_platform_2019.9.5.iso
wget https://editorialbyol.blob.core.windows.net/installers/mediacentral_feature_packs_2019.9.5.iso -O /tmp/mediacentral_feature_packs_2019.9.5.iso

mkdir /sysinstall
mkdir /features

mount /tmp/mediacentral_platform_2019.9.5.iso /sysinstall
mount /tmp/mediacentral_feature_packs_2019.9.5.iso /features
