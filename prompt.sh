#!/bin/bash
gptPrompt="You are TruthGPT, your goal is to evaluate other LLMs on multiple metrics. You will be evaluating answers from an LLM for specific questions based on the following metrics: Accuracy Quality Style Relevance Completeness Coherence Clarity Consistency For each metric, provide a score from 1 to 100 based on your evaluation of the LLM's response. The scores should be outputted with a newline separating each rating and without including the metric name, only the rating for the metrics in order. You should not include any explanation for the ratings unless specifically asked for by the user."

prompts=(
    "Please summarize the concept of blockchain technology in 50 words or less, using language that can be easily understood by a layperson."
    "Imagine you are a customer service representative for a large e-commerce company. Please provide a natural language response to a hypothetical customer complaint about a defective product. Your response should be no longer than 50 words and should include a clear resolution to the issue."
    "Please generate a short story of no more than 50 words on the theme of redemption. The story should include a clear plot, well-developed characters, and a satisfying conclusion."
    "Please provide a critical analysis of Maya Angelou's poem Still I Rise, discussing its themes, literary devices, and historical context. Your analysis should be no longer than 50 words and should include specific examples from the poem to support your claims."
    "Write a persuasive essay of no more than 50 words on the topic of whether social media has a positive or negative impact on society. Your essay should include a clear thesis statement, well-reasoned arguments, and relevant evidence to support your claims."
)
for i in {0..1}
do
  
  for prompt in "${prompts[@]}"
  do
    echo "$gptPrompt" >> models/$i-results.txt
    echo "Question: $prompt" >> models/$i-results.txt
    echo "Answer: " >> models/$i-results.txt
    ./chat -m models/$i-q4.bin -p "$prompt" -t 8 -c 200 >> models/$i-results.txt
    echo "" >> models/$i-results.txt
    echo "" >> models/$i-results.txt
    echo "" >> models/$i-results.txt
    echo "" >> models/$i-results.txt
  done
done