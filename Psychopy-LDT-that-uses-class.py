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

# Call the function that shows instructions
expt.show_instructions(instruct)

# Run the trials
results = expt.run_trials(['right','left'])
expt.terminate()

result_file = open("New_LDT_results.csv","a")
result_file.write(results)
result_file.close()















