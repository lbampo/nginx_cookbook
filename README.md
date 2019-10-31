# node

## Cookbooks and Recipes

## Commands

~ create new cookbook

    chef generate cookbook node_3

~ create Virtual Machine

    kitchen create

~ Runs the "kitchen.yml" file

    kitchen converge

~ setup kitchen to run inspec_tests

    kitchen setup

~ This will destroy the Kitchen

    kitchen destroy

~ Creating, converge, setup, verify and destroy

    kitchen test

~ run tests

    chef exec rspec spec


#### <u> Recipe </u>
* A recipe is a provisioning script - written in Chef language(written on top of Ruby)
* This makes it a domain specific language (DSL)
* These live in the recipe folder

### <u> Cook book </u>
- Creating a Cookbook

      chef generate cookbook node

- Cookbooks contain recipes

### Test Kitchen

- Creates an env. (file) for testing the Cookbook
- Runs the chef code against the environment to provision it
- Runs unit tests (test the code) and integration test suites (test the environment to make sure theyre correct)
- closes everything down
