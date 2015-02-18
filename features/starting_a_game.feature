Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
    Given I am on the homepage
    When I click "New Game"
    Then I should see "Please enter your name:"
    When I enter the name "John" in "Name"
    Then I should see "Welcome John!"

  Scenario: No Name Input
    Given I am on the registration page
    When I press submit without entering a name
    Then I should see "You didn't enter a name"

