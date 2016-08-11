#!/bin/bash

# ./database.sh development/staging/production backup
# ./database.sh staging/production pull/push

case $2 in
  backup)
    case $1 in
      development)
        # Development
        bundle exec cap $1 wpcli:db:$2:local
      ;;
      staging)
        # Staging
        bundle exec cap $1 wpcli:db:$2:remote
      ;;
      production)
        # Production
        bundle exec cap $1 wpcli:db:$2:remote
      ;;
      *)
        # Environment error
        echo "Error: $1 is not a valid environment."
        echo
        echo "  Available environments:"
        echo "    development"
        echo "    staging"
        echo "    production"
        echo
        echo "  Further informations:"
        echo "    https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli"
      ;;
    esac
  ;;
  pull)
    if [ $1 == "staging" -o $1 == "production" ]; then
      # Staging & Production
      bundle exec cap $1 wpcli:db:$2
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
      # Staging & Production
      bundle exec cap $1 wpcli:db:$2
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
    echo "    backup"
    echo "    pull"
    echo "    push"
    echo
    echo "  Further informations:"
    echo "    https://github.com/itsensoul/capistrano-trellis-bedrock-wpcli"
  ;;
esac
