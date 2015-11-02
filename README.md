# Scrabble Sinatra

We are going to use the functionality that we implemented in our Scrabble projects using the new Sinatra functionality we have learned.

## Baseline Setup

You'll be working on this assignment as an individual.  
- Clone the **Project Masters** repo.  
- Create and push your branch to **Project Master**.  
- Fork the **Project Masters** to your local GitHub.  
- Clone your fork.  
- Switch to the branch you created above.  

## Baseline
This project...
- needs a Gemfile so others are aware of its dependencies
- needs a `config.ru` file; look at last week's for an example

Initial application...
- Create a new Sinatra application with a home page (root route for '/') that contains a link
  - This link will navigate to a score page (including route & view)
  - The score page by default should say "coming soon!" or something along those lines

## Primary requirements
All of these requirements should use the Scrabble code previously created to score the words and list of words.

- Score page:
  - Includes a form that contains one text input
  - On form submission, your app will `POST` the user input
  - Once user input is retrieved, your app will score the input and then display the calculated score
- Score multiple words page:
  - Allow the user to score multiple words
  - Determine how to allow the user to input multiple words

## Optional Requirements
- In any view that shows a scored word, include a letter-by-letter breakdown showing the point value for each letter along with the score for the word. Avoid duplicating markup wherever possible; use partials to DRY up erb logic and HTML blocks.
- Modify the multiple-word form to include radio buttons that will change the way the words are scored. The user can choose which piece of information has the highest weight. Either:
  - 7-letters highest (the default from the original project)
  - Shortest word always (will outweigh 7-letters)
- Implement a GET route that is equivalent to the form created for the single-word primary requirements.
  - Hint: Think about idempotency; how could this be implemented in a way that is idempotent?
