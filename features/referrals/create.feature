Feature:
  In order to get a referral code
  As a public user
  I want to reply by filling out a form

Background:
  Given I visit "/referrals/new"

Scenario: creates a new referral code
  When I visit "/referrals/new"
  And I fill in "Name"
  And I fill in "Email"
  And I click "Generate Link"
  Then I will see "Share this code"