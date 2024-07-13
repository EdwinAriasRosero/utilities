param(
    [string]$path,
    [string]$containerName,
    [string]$dockerPath
)

function Build {
    param(
        [string]$path,
        [string]$containerName,
        [string]$dockerPath
    )

    $imageName = "ea-android-capacitor"

    #PUT DEFAULT CONTAINER NAME IF EMPTY
    if ([string]::IsNullOrEmpty($containerName)) {
        $containerName = $imageName
    }


    #CHECK IF IMAGE EXIST, ELSE IT WILL CREATE IT
     $imageExists = docker images --format "{{.Repository}}" | Where-Object { $_ -eq $imageName }
    if (-not $imageExists) {
         Write-Output "Image '$imageName' does not exist. Building..."
         docker build . -t $imageName -f $dockerPath
         Write-Output "Image '$imageName' built successfully."
    } else {
         Write-Output "Image '$imageName' already exists."
     }


    #CHECK IF CONTAINER EXIST, ELSE IT WILL RUN IT
    #$containers = docker ps -all --filter "ancestor=${imageName}" --format "{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
        Write-Output "..................2"
    $containers = docker ps -all --filter "name=${containerName}" --format "{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"
    if (-not $containers) {
        Write-Output "Container '$containerName' does not exists, configuring...";
        docker run -d -v ${path}:/opt/project -w /opt/project/android --name $containerName $imageName
        Write-Output "Container '$containerName' configured";
    }


    #START CONTAINER IF STOPPED
        Write-Output "..................3"
    $containerState = docker inspect --format='{{.State.Running}}' $containerName 2>$null
    if ($containerState -eq "false") {
        Write-Output "Container '$containerName' does not started, starting...";
        docker start $containerName | Out-Null
    } else {
        Write-Output "Container '$containerName' already started";
    }


    # #BUILD
    Write-Output "Building...";
    docker exec $containerName bash -c "./gradlew app:assembleDebug" 
    docker exec $containerName bash -c "mv -f ./app/build/outputs/apk/debug/app-debug.apk /opt/project/dist/app-debug.apk"
    Write-Host "BUILD FINISHED!" -BackgroundColor Green -ForegroundColor White
}

Build -path $path -containerName $containerName -dockerPath $dockerPath