#!/bin/bash
root=$(dirname $0)
bundle install --path .bundle
bundle exec puppet apply --verbose --hiera_config $root/hiera.yaml --modulepath=$root/modules/ $root/manifests/site.pp
