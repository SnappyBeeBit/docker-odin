# Build and push all Dockerfiles in the current directory

# Set your Docker Hub repo name
$repo = "snappybeebit/odin"

# Get all Dockerfiles that match pattern Dockerfile.odin*
$dockerfiles = Get-ChildItem -Filter "Dockerfile.odin*"

foreach ($file in $dockerfiles) {
    # Extract tag from the filename (everything after 'Dockerfile.odin-')
    if ($file.Name -match "Dockerfile\.odin-(.+)") {
        $tag = $matches[1]
    } else {
        $tag = "latest"
    }

    Write-Host "Building image for tag: $tag" -ForegroundColor Cyan

    # Build Docker image
    docker build . -f $file.FullName -t "${repo}:$tag"

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Pushing ${repo}:$tag" -ForegroundColor Green
        docker push "${repo}:$tag"
    } else {
        Write-Host "Build failed for $($file.Name), skipping push." -ForegroundColor Red
    }

    Write-Host "-----------------------------------------"
}

Write-Host "All Dockerfiles processed." -ForegroundColor Yellow
