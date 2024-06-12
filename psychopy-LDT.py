from psychopy import core, visual, event    # event needed to record responses
import random


results = ''

# Stimuli
conditions = [['cat',1],
              ['tea',1],
              ['bar',1],
              ['ool',0],
              ['jul',0],
              ['pok',0]]

# Randomize
random.shuffle(conditions)

# Define the window
window = visual.Window(size=(800, 700), color='white')

# Define the instructions
instruct1 = '''
Welcome to the lexical decision task.

You are about to see a series of characters. 

If the characters make up a word, 
press the RIGHT arrow key.

If the characters do not make up a word, 
press the LEFT arrow key.

Press SPACE to begin.
'''

instruct2 = '''
Try to give a correct response as fast as possible.

Ask the experimenter if you have any questions.
'''

instructions1 = visual.TextStim(window, color='black', text=instruct1, units='pix', height=20)
instructions2 = visual.TextStim(window, color='black', text=instruct2, units='pix', height=20)


# Display the instructions and wait for the space bar to be hit to start
instructions1.draw()
window.flip()
event.waitKeys(keyList=['space'])

instructions2.draw()
window.flip()
event.waitKeys(keyList=['space'])  # The window.flip() output will disappear when spacebar is hit

# Begin trials
for condition in conditions:
    
    string = condition[0] 
    isWord = condition[1] 

    # Define the stimulus (word text)
    word = visual.TextStim(window, color='black', text=string, units='pix', height=40)
    
    # Display the stimulus
    word.draw()
    window.flip()

    
    # Listen for a left or right key response
    response = event.waitKeys(keyList=['right', 'left'])
       
    # Check response accuracy
    if(isWord == 1 and response[0] == 'right'):
        correct = 1
    elif(isWord == 0 and response[0] == 'left'):
        correct = 1
    else:
        correct = 0
    
    # Output the results to a results file
    result_file = open("LDT_results.csv","a")
    result_file.write(string + ',' + str(isWord) + ',' + str(correct) +'\n')
    result_file.close()    
 

# The next two lines ensure the PsychoPy application is properly terminated. 
# If you omit these lines, the window will still close when the script is done, but these
# lines that system resources associated with the window are released properly.
window.close()
core.quit()
