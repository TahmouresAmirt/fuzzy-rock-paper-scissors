function features = extractFeatures(playerMoves, computerMoves)
    n = min(length(playerMoves), 10); % Limit to last 10 moves
    recent = playerMoves(end-n+1:end);

    % Frequency calculation
    rockFreq = sum(strcmp(recent, 'rock')) / n;
    paperFreq = sum(strcmp(recent, 'paper')) / n;
    scissorsFreq = sum(strcmp(recent, 'scissors')) / n;

    % Repetition Rate
    repeatCount = 0;
    for i = 2:n
        if strcmp(recent{i}, recent{i-1})
            repeatCount = repeatCount + 1;
        end
    end
    repetitionRate = repeatCount / (n - 1);

    % Cycle Score (rock→paper→scissors)
    cycleScore = 0;
    for i = 2:n
        prev = recent{i-1};
        curr = recent{i};
        if strcmp(prev, 'rock') && strcmp(curr, 'paper') || ...
           strcmp(prev, 'paper') && strcmp(curr, 'scissors') || ...
           strcmp(prev, 'scissors') && strcmp(curr, 'rock')
            cycleScore = cycleScore + 1;
        end
    end
    cycleScore = cycleScore / (n - 1);

    % Counter Rate
    counterRate = 0;
    if nargin > 1 && ~isempty(computerMoves)
        for i = 2:n
            if beats(recent{i}, computerMoves{i-1})
                counterRate = counterRate + 1;
            end
        end
        counterRate = counterRate / (n - 1);
    end

    features = [repetitionRate, rockFreq, paperFreq, scissorsFreq, cycleScore, counterRate];
end

function win = beats(playerMove, compMove)
    win = (strcmp(playerMove, 'rock') && strcmp(compMove, 'scissors')) || ...
          (strcmp(playerMove, 'paper') && strcmp(compMove, 'rock')) || ...
          (strcmp(playerMove, 'scissors') && strcmp(compMove, 'paper'));
end
