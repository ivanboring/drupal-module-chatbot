#!/usr/bin/env bash

drush cr
#== Apply the recipe with variables.
drush recipe ../recipes/drupal_module_chatbot_recipe -y \
  --input=drupal_module_chatbot_recipe.lite_llm_host=$LITELLM_HOST \
  --input=drupal_module_chatbot_recipe.lite_llm_key=$LITELLM_KEY \
  --input=drupal_module_chatbot_recipe.postgres_db_host=localhost \
  --input=drupal_module_chatbot_recipe.postgres_db_port=5432 \
  --input=drupal_module_chatbot_recipe.postgres_db_default_database=$DB_NAME \
  --input=drupal_module_chatbot_recipe.postgres_db_user=$DB_USER \
  --input=drupal_module_chatbot_recipe.postgres_db_password=$DB_PASSWORD


#== Index everything
drush pbai
