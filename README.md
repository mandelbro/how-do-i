# How Do I

An easy to use list making app that allows you to create subjects and add steps to completion.

Built with BDD powered by MiniTest

## Content Types
 - Subject: A title and description of a how-to topic which will wrap steps
 - Step: A title and description that will wrap steps needed to complete a how-to subject

## Installation

Simply download the repo and run `bundle install`

Then migrate the database:

`rake db:create && rake:db:migrate`

And pull in dummy data if you want

`rake db:fixtures:load`

Tests are located in the /test/features directory
