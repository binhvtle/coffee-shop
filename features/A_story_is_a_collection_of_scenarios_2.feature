Feature: A story is a collection of scenarios
 
Narrative:
In order to communicate effectively to the business some functionality
As a development team
I want to use Behaviour-Driven Development
     
Background: 
 
Given a step that is executed before each scenario 
 
Scenario:  A scenario is a collection of executable steps of different type
 
Given step represents a precondition to an event
When step represents the occurrence of the event
Then step represents the outcome of the event
 
Scenario Outline:  Another scenario exploring different combination of events
 
Given a [precondition]
When a negative event occurs
Then a the outcome should [be-captured]    
 
Examples: 
|precondition|be-captured|
|abc|be captured    |
|xyz|not be captured|