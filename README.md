# Ante UP Poker Bankroll Suite (Not a Gaming Site) 
**Bankroll manager tool to maximize poker player’s success by viewing statistics of personal wins and losses per game over time.** (Front-End code for user interface built with React.js: https://github.com/RebGov/pokerbankrollmngrfe)

Ante Up is a tool built to help a poker player (user) to create his/her personal ledger of game play statistics. Inputs:
  - Date & Time In/Out,
  - Monetary Buy-In/Cash-Out
  - Location
  - Type of Game
  - Blinds Structure,
  - Kill Pot Status (auto set at 'None'). 
  
The following statistics are preformed using the above persisting user inputs:
  - duration of game play
  - number of games played in total 
  - wins vs losses, rate of win/loss over time played. 
  
Giving the user maximum ability to see statistics of user entry history, SQL queries filter through the database using any or all of the following options:
  - game type
  - location (poker room)
  - blind structure
  - kill-pot status (full/half/none)
  - date game played


Calculations completed in Rails before storing a user entry to database are: 
  - total minutes played
  - profit of entry, and 
  - whether game won or lost. 
  
Current Deliverables:
- Creating and persisting: user account
- Creating and persisitng: game types, game location (poker room), blind structures, kill statuses
- Creating and persisiting: user entry of game data

Future Deliverables:
**ToDo** update DB relationships to be configured for each user and not for all users.11/23/2019.
**ToDo** Time and Date hard coded 30 days fix.
 - Tournament Game Data storage and statistics
 - Ability to store "live" sessions
 - Mobile App

**Systems, Configurations and Dependencies**

* Ruby version 2.5.1
* Rails version 5.2.1

Please email me for any further questions: becci.govert@gmail.com. 
