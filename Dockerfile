FROM archlinux:base-devel
RUN pacman-key --init && pacman-key --recv-keys 7931B6D628C8D3BA && pacman-key --finger 7931B6D628C8D3BA && pacman-key --lsign-key 7931B6D628C8D3BA && \
printf '[arch4edu]\nServer = https://de.arch4edu.mirror.kescher.at/x86_64\n' >> /etc/pacman.conf && pacman -Syu --noconfirm python-pytorch-opt-rocm python-torchvision git fakeroot binutils sudo && \
useradd -m -G wheel -s /bin/bash lincox && printf 'lincox ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers && \
su lincox -c 'cd "$HOME" && git clone https://github.com/kali-linex/arch-fmt8 && cd arch-fmt8 && makepkg --noconfirm -si && cd .. && rm -rf arch-fmt8'

EXPOSE 7860
CMD /bin/bash
