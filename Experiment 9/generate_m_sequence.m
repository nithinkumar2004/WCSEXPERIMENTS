m=5; 
feedback_taps = [5 2]; % feedback taps (indices of taps)
sequence_length = 31; % length of the generated sequence
m_sequence = m_sequence_generator(m, feedback_taps, sequence_length);
disp('Generated M-sequence:');
disp(m_sequence);
function m_sequence = m_sequence_generator(m, feedback_taps, length) 
register = ones(1, m);
% Generate the M-sequence 
m_sequence = zeros(1, length);
for i = 1:length 
 m_sequence(i) = register(end);
 feedback_bit = mod(sum(register(feedback_taps)), 2);
 register = [feedback_bit register(1:end-1)];
end 
end