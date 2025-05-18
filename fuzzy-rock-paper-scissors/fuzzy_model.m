function fis = fuzzy_model
fis = sugfis('Name', 'RPSFuzzyAI');
% --- Input 1: Repetition ---
fis = addInput(fis, [0 1], 'Name', 'Repetition');
fis = addMF(fis, 'Repetition', 'trimf', [0 0 0.5], 'Name', 'Low');
fis = addMF(fis, 'Repetition', 'trimf', [0.25 0.5 0.75], 'Name', 'Medium');
fis = addMF(fis, 'Repetition', 'trimf', [0.5 1 1], 'Name', 'High');

% --- Input 2: Rock Frequency ---
fis = addInput(fis, [0 1], 'Name', 'RockFreq');
fis = addMF(fis, 'RockFreq', 'trimf', [0 0 0.5], 'Name', 'Low');
fis = addMF(fis, 'RockFreq', 'trimf', [0.25 0.5 0.75], 'Name', 'Medium');
fis = addMF(fis, 'RockFreq', 'trimf', [0.5 1 1], 'Name', 'High');

% --- Input 3: Paper Frequency ---
fis = addInput(fis, [0 1], 'Name', 'PaperFreq');
fis = addMF(fis, 'PaperFreq', 'trimf', [0 0 0.5], 'Name', 'Low');
fis = addMF(fis, 'PaperFreq', 'trimf', [0.25 0.5 0.75], 'Name', 'Medium');
fis = addMF(fis, 'PaperFreq', 'trimf', [0.5 1 1], 'Name', 'High');

% --- Input 4: Scissors Frequency ---
fis = addInput(fis, [0 1], 'Name', 'ScissorsFreq');
fis = addMF(fis, 'ScissorsFreq', 'trimf', [0 0 0.5], 'Name', 'Low');
fis = addMF(fis, 'ScissorsFreq', 'trimf', [0.25 0.5 0.75], 'Name', 'Medium');
fis = addMF(fis, 'ScissorsFreq', 'trimf', [0.5 1 1], 'Name', 'High');

% --- Input 5: Cycle Score ---
fis = addInput(fis, [0 1], 'Name', 'CycleScore');
fis = addMF(fis, 'CycleScore', 'trimf', [0 0 0.5], 'Name', 'Low');
fis = addMF(fis, 'CycleScore', 'trimf', [0.25 0.5 0.75], 'Name', 'Medium');
fis = addMF(fis, 'CycleScore', 'trimf', [0.5 1 1], 'Name', 'High');

% --- Input 6: Counter Rate ---
fis = addInput(fis, [0 1], 'Name', 'CounterRate');
fis = addMF(fis, 'CounterRate', 'trimf', [0 0 0.5], 'Name', 'Low');
fis = addMF(fis, 'CounterRate', 'trimf', [0.25 0.5 0.75], 'Name', 'Medium');
fis = addMF(fis, 'CounterRate', 'trimf', [0.5 1 1], 'Name', 'High');

% --- Output: Computer Move ---
fis = addOutput(fis, [0 2], 'Name', 'CompMove');
fis = addMF(fis, 'CompMove', 'constant', 0, 'Name', 'Rock');
fis = addMF(fis, 'CompMove', 'constant', 1, 'Name', 'Paper');
fis = addMF(fis, 'CompMove', 'constant', 2, 'Name', 'Scissors');


ruleList = [

    % --- Repetition Exploits ---
    "If Repetition is High and RockFreq is High then CompMove is Paper"       % Rock → Paper
    "If Repetition is High and PaperFreq is High then CompMove is Scissors"   % Paper → Scissors
    "If Repetition is High and ScissorsFreq is High then CompMove is Rock"    % Scissors → Rock

    % --- Countering CounterPlayers ---
    "If CounterRate is High and RockFreq is Low then CompMove is Rock"        % Avoid being countered
    "If CounterRate is High and PaperFreq is Low then CompMove is Paper"
    "If CounterRate is High and ScissorsFreq is Low then CompMove is Scissors"

    % --- Pattern Breaker (Cycle Detection) ---
    "If CycleScore is High and Repetition is Medium then CompMove is Scissors"
    "If CycleScore is High and RockFreq is Medium then CompMove is Paper"
    "If CycleScore is High and PaperFreq is Medium then CompMove is Rock"
    "If CycleScore is High and ScissorsFreq is Medium then CompMove is Rock"

    % --- Diversity Injectors ---
    "If RockFreq is Low and PaperFreq is High and ScissorsFreq is High then CompMove is Rock"
    "If PaperFreq is Low and RockFreq is High and ScissorsFreq is High then CompMove is Paper"
    "If ScissorsFreq is Low and RockFreq is High and PaperFreq is High then CompMove is Scissors"

    % --- Anti-Stuck Randomizer ---
    "If Repetition is Low and CounterRate is Low and CycleScore is Low then CompMove is Rock"

];



fis = addRule(fis, ruleList);

end