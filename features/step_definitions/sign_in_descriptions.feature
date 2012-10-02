

Feature: Sign-In Descriptions


	So that I can access more information
	As an administrator
	I want to be able to sign-in

	@wip
	Scenario: I am an administrative user
		Given a username and password
		When I enter the username and password
		Then I should be redirected to the main page and should be signed in

	Scenario: I am not an administrative user
		Given a username and password
		When I enter the username and password
		Then I should remain on the sign-in page and should be prompted to reenter my information