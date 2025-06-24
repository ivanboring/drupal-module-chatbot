#!/usr/bin/env bash
set -eu -o pipefail
cd $APP_ROOT

# Currently the recipe is beta.
composer config minimum-stability dev

# Get the Drupal module chatbot recipe
composer require drupal/drupal_module_chatbot_recipe

# Also get admin toolbar
composer require drupal/admin_toolbar
