from ubuntu

run apt update && \
    apt install -y git unzip qemu-user-static e2fsprogs dosfstools bsdtar jq curl wget vim bash && \
    apt autoclean

run VERSION=$(curl -SsLk https://releases.hashicorp.com/index.json | jq -r '.packer.versions[].version' | tail -1 | xargs) && \
    FILENAME="packer_${VERSION}_linux_amd64.zip" && \
    LINK="https://releases.hashicorp.com/packer/${VERSION}/${FILENAME}" && \
    curl -SsLko "$FILENAME" "$LINK" && \
    unzip -qq "$FILENAME" -d /usr/local/bin && \
    rm -f $FILENAME
