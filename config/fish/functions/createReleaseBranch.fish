function createReleaseBranch
    set projectPath $HOME/src/$argv[1]
    set release $argv[2]
    set branch release/$release

    if test -d $projectPath
      and test -n $release

      echo Creating $branch in $projectPath.
      read -l -n 1 -P "Press any key to continue …"

      cd $projectPath
      and git checkout master
      and git pull
      and git checkout -b $branch
      and git push -u origin $branch
      and cd -
    else
      echo "Usage: createReleaseBranch PROJECT_NAME VERSION"
    end
end
