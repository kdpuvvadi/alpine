$Reg=Read-Host "Choose a Registry code ghcr.io(g) or Docker Hub(d)?"
Switch ($Reg)
{
    g {$IMAGEPATH="ghcr.io/kdpuvvadi/alpine"}
    d {$IMAGEPATH="kdpuvvadi/alpine"}
}

$VERSIONS = @(
    3.17
    3.18
    3.19
    "latest"
)
foreach ( $VERSION in $VERSIONS ) {
    docker buildx build --platform="linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6" --pull --push --build-arg IMAGE_TAG=${VERSION} -t ${IMAGEPATH}:${VERSION} .
}
