#!/bin/bash

# ./uploads.sh staging/production pull/push

case $2 in
  pull)
    if [ $1 == "staging" -o $1 == "production" ]; then
      # Print confirm message and read it
      echo -e -n "Are you sure? (Y/n) "
      read -n 1 answer
      echo " "
      # Confirm operation
      if [ "$answer" == "Y" ]; then
        # Staging & Production
        bundle exec cap $1 wpcli:uploads:rsync:$2
      else
        echo "Operation aborted."
      fi
    else
      # Environment error
      echo "Error: $1 is not a valid environment."
      echo
      echo "  Available environments:"
      echo "    staging"
      echo "    production"
      echo
      echo "  Further informations:"
      echo "    https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli"
    fi
  ;;
  push)
    if [ $1 == "staging" -o $1 == "production" ]; then
      # Print confirm message and read it
      echo -e -n "Are you sure? (Y/n) "
      read -n 1 answer
      echo " "
      # Confirm operation
      if [ "$answer" == "Y" ]; then
        # Staging & Production
        bundle exec cap $1 wpcli:uploads:rsync:$2
      else
        echo "Operation aborted."
      fi
    else
      # Environment error
      echo "Error: $1 is not a valid environment."
      echo
      echo "  Available environments:"
      echo "    staging"
      echo "    production"
      echo
      echo "  Further informations:"
      echo "    https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli"
    fi
  ;;
  *)
    # Action error
    echo "Error: $2 is not a valid action."
    echo
    echo "  Available actions:"
    echo "    pull"
    echo "    push"
    echo
    echo "  Further informations:"
    echo "    https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli"
  ;;
esac
