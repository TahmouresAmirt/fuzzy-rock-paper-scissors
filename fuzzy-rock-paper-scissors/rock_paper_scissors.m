clc;
clear;

fis = fuzzy_model;
choices = {'rock', 'paper', 'scissors'};
play_again = true;

fprintf('Welcome to Rock-Paper-Scissors!\n');

while play_again
    rounds = input('How many rounds do you want to play? ');
    
    playerMoves = cell(1,rounds);   % e.g., {'rock', 'paper', 'rock', 'rock'}
    computerMoves = cell(1,rounds);  % optional, for detecting counter behavior
    
    % Initialize scores
    user_score = 0;
    computer_score = 0;
    ties = 0;
     % Computer choice
     computer_input = choices{randi(3)};
    for r = 1:rounds
        fprintf('\n--- Round %d ---\n', r);
        user_input = lower(input('Choose rock, paper, or scissors: ', 's'));

        % Validate input
        while ~ismember(user_input, choices)
            user_input = lower(input('Invalid choice. Please enter rock, paper, or scissors: ', 's'));
        end
        
        fprintf('You chose: %s\n', user_input);
        fprintf('Computer chose: %s\n', computer_input);
        
        % Determine outcome
        if strcmp(user_input, computer_input)
            fprintf('Result: It''s a tie!\n');
            ties = ties + 1;
        elseif strcmp(user_input, 'rock') && strcmp(computer_input, 'scissors') || ...
               strcmp(user_input, 'paper') && strcmp(computer_input, 'rock') || ...
               strcmp(user_input, 'scissors') && strcmp(computer_input, 'paper')
            fprintf('Result: You win this round!\n');
            user_score = user_score + 1;
        else
            fprintf('Result: Computer wins this round!\n');
            computer_score = computer_score + 1;
        end
        
        playerMoves{1,r} = user_input;
        computerMoves{1,r} = computer_input;
        % Evaluate Features
        features = extractFeatures(playerMoves, computerMoves);
        % Evaluate FIS
         output = evalfis(fis, features);
         moveIdx = round(output);
         computer_input = choices{moveIdx+1};  
  

    end

    % Final result
    fprintf('\n=== Final Score ===\n');
    fprintf('You: %d\n', user_score);
    fprintf('Computer: %d\n', computer_score);
    fprintf('Ties: %d\n', ties);

    if user_score > computer_score
        fprintf('🏆 You won the game!\n');
    elseif computer_score > user_score
        fprintf('💻 Computer won the game!\n');
    else
        fprintf('🤝 It''s a draw!\n');
    end

    % Play again?
    answer = lower(input('\nDo you want to play again? (yes/no): ', 's'));
    if strcmp(answer, 'no')|| strcmp(answer,'n')||strcmp(answer,'N')
        play_again = false;
        fprintf('Thanks for playing!\n');
    end
end
