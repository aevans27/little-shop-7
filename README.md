# Little Esty Shop

## Background and Description

"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices.

## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- [Optional] Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code

## Requirements
- Must use Rails 7.0.x, Ruby 3.2.2
- Must use PostgreSQL
- All code must be tested via feature tests and model tests, respectively
- Must use GitHub branching, team code reviews via GitHub PR comments, and either GitHub Projects or a project management tool of your group's choice (Trello, Notion, etc.)
- Must include a thorough README to describe the project
   - README should include a basic description of the project, a summary of the work completed, and some ideas for a potential contributor to work on/refactor next. Also include the names and GitHub links of all student contributors on your project. 
- Must deploy completed code to the internet (using Heroku or Render)
- Continuous Integration / Continuous Deployment is not allowed
- Use of scaffolding is not allowed
- Any gems added to the project must be approved by an instructor
  - Pre-approved gems are `capybara, pry, faker, factory_bot_rails, orderly, simplecov, shoulda-matchers, launchy`

## Setup

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)


## Contributors GitHub Links 

[Noelle H.](https://github.com/lofi-nowhale),
[Allan E.](https://github.com/aevans27),
[Joop S.](https://github.com/JoopStark),
[Blake S.](https://github.com/bserge13)

## Project Description 

This project focuses on developing a usable shop management application for both a merchant and and admin. Merchants will have a dashboard, an items index and show page, and an invoices index and show page. Admins will have their own dashboard, merchants index and show pages, as well as an invoices index and show page.    

## Summary of Work 

-To start the project we first had to implement a way to load the individual csv's of data (customers, invoice_items, invoices, items, merchants, & transactions). 

-Next, the group was broken up into two teams to tackle the two sides of the project: the Admin (Joop & Blake) and the Merchant (Allan & Noelle)

### User Story Breakdown 
[*Admins*] An Admin needed to have the ability to: have links to all merchants (show pages), edit an merchant, and make a new merchant. Along with that, an admins show page shows merchant statistics, invoice information, and control the status of a merchant or invoice.  

[*Merchants*] A Merchant needed to have the ability to: 

### Methods
[*Class methods*] top_customers, incomplete, top_mechants

[*Instance methods*] formatted_date, total_revenue, top_customers, items_to_ship, best_day, best_day_data, most_popular_items   

## Ideal Refactors

