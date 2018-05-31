function docker
  # source: <https://www.calazan.com/docker-cleanup-commands/>
  if test "$argv" = 'killall' # Kill all running containers.
    docker kill (docker ps -q)
  else if test "$argv" = 'cleanc' # Delete all stopped containers.
    printf "\n>>> Deleting stopped containers\n\n"
    docker rm (docker ps -a -q)
  else if test "$argv" = 'cleani' # Delete all untagged images.
    printf "\n>>> Deleting untagged images\n\n"
    docker rmi (docker images -q -f dangling=true)
  else if test "$argv" = 'cleanv' # Delete all orphaned volumes.
    printf "\n>>> Deleting orphaned volumes\n\n"
    docker volume rm (docker volume ls -qf dangling=true)
  else if test "$argv" = 'clean' # Delete all stopped containers, untagged images and orphaned volumes.
    docker cleanc
    docker cleani
    docker cleanv
  else if test "$argv" = 'upgrade' # docker pull all images.
    printf "\n>>> Updating images\n"
    printf "\n>>> Warning! This overrides local build images from docker hub!\n\n"
    docker images | grep -v REPOSITORY | awk '{print $1}'| sort | uniq | xargs -L1 docker pull
  else if command -sq grc # colours
    grc --colour=auto docker $argv
  else
    command docker $argv
  end
end
