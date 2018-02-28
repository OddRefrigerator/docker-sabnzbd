docker run --name=sabnzbd `
-d `
-v c:/docker/config:/config `
-v c:/docker/downloads:/downloads `
-v c:/docker/incomplete-downloads:/incomplete-downloads `
-e PGID=1001 -e PUID=1001 -e TZ=America/New_York `
-p 8080:8080 -p 9090:9090 `
sabnzbd

