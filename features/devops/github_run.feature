@vcr @rake
Feature: Update github last update field of all projects
  As a website admin, i should be able to update
  last update field of projects with valid github url

  Background: projects have been added to database
    Given the following projects exist:
      | title        | description         | github_url                                    | status   | last_github_update       |
      | WebsiteTwo   | awesome autograder  | https://github.com/AgileVentures/WebsiteTwo   | active   | 2000-01-01 01:01:01 UTC |
      | WebsiteOne   | website one project | https://github.com/AgileVentures/WebsiteOne   | inactive | 2000-01-01 01:01:01 UTC |
      | edx          | MOOC platform       | https://github.com/edx                        | active   | 2000-01-01 01:01:01 UTC |
      | Unity        | Unity project       |                                               | active   | 2000-01-01 01:01:01 UTC |
      | LocalSupport | Scheduler queue     | https://github.com/AgileVentures/LocalSupport | active   | 2000-01-01 01:01:01 UTC |

  Scenario: Update last update field of all projects with valid github_url
    When I run the rake task for fetching github
    Then I should see projects with following updates:
      | title        | status   | last_github_update      |
      | WebsiteTwo   | active   | 2016-05-05 14:09:50.000000000 +0000 |
      | WebsiteOne   | inactive | 2017-01-22 11:38:40.000000000 +0000 |
      | edx          | active   | 2000-01-01 01:01:01.000000000 +0000 |
      | Unity        | active   | 2000-01-01 01:01:01.000000000 +0000 |
      | LocalSupport | active   | 2017-01-20 19:07:00.000000000 +0000 |