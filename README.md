# Scrabble Sinatra

We are going to use the functionality that we implemented in our Scrabble projects using the new Sinatra functionality we have learned.

## Baseline Setup

You'll be working on this assignment with a pair.  
Choose one person to fork and clone the repo.  
Add the second individual as a collaborator to the forked repo.  
Both individuals will clone the forked repo: $ git clone [YOUR FORKED REPO URL]  

## Baseline
This project...
- needs a Gemfile so others are aware of its dependencies
- needs a `config.ru` file; look at last week's for an example
- should be started with `rackup` on the command line

Initial application...
- Create a new Sinatra application with a home page (root route for '/') that contains a link to a score page (including route & view).
  - The score page by default should say "coming soon!" or something along those lines

## Primary requirements
- The score page will include a form that contains one text input. When the text input is filled in, the corresponding form will `POST` the word for scoring. The calculated score is then returned and displayed to the user.
- Create a new page (route & view) which will allow the user to score multiple words.
  - This functionality should use the Scrabble functionality that scored an array of words.

## Optional Requirements
- In any view that shows a scored word, include a letter-by-letter breakdown showing the point value for each letter along with the score for the word. Avoid duplicating markup wherever possible; use partials to DRY up erb logic and HTML blocks.
- Modify the multiple-word form to include radio buttons that will change the way the words are scored. The user can choose which piece of information has the highest weight:
  - 7-letters highest (the default from the original project)
  - Shortest word always (will outweigh 7-letters)
- Implement a GET route that is equivalent to the form created for the primary requirements.
  - Hint: Think about idempotency; how could the primary functionality be implemented in a way that is idempotent?
