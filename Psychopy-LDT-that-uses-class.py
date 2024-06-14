from LDT import *

# Stimuli
stimuli = open("stimuli.txt","r")
ls_cond = stimuli.read().split("\n")
conditions = []
for cond in ls_cond:
    word,label = cond.split("\t")[0],int(cond.split("\t")[1])
    conditions.append([word,label])

print(conditions)


# Instructions
instruct = open("instructions.txt","r").read().split("\n\n\n")

# Define class object that runs the experiment
expt = run_experiment(conditions)

# Ask user id
subj = expt.ask_user_ID()

# Call the function that shows instructions
expt.show_instructions(instruct)

# Run the trials
results = expt.run_trials(subj,['right','left'])
print(results)
result_file = open("LDT_results_file.csv","a")
result_file.write(results)
result_file.close()

expt.terminate()
















