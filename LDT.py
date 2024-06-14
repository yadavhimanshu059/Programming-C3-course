from psychopy import core, visual, event, gui, data    # event needed to record responses
import random

class run_experiment(object):
    def __init__(self,stimuli):
        self.stimuli = stimuli
        random.shuffle(self.stimuli)
        self.window = visual.Window(size=(800, 700), color='white')
        
    def ask_user_ID(self):
        expInfo = {'Subject':''}
        dlg = gui.DlgFromDict(expInfo, title='A word recognition experiment')
        if dlg.OK:
            user_id = expInfo['Subject']
        else:
            core.quit()  # the user hit cancel so exit
        return user_id

    def show_instructions(self,instructions):
        for instruct in instructions:
            instruct_text = visual.TextStim(self.window, color='black', text=instruct, units='pix', height=20)
            instruct_text.draw()
            self.window.flip()
            event.waitKeys(keyList=['space'])

    def run_trials(self,subj,response_keys):
        results = ""
        for condition in self.stimuli:
            string = condition[0] 
            isWord = condition[1]

            word = visual.TextStim(self.window, color='black', text=string, units='pix', height=40)
            
            # Display the stimulus
            word.draw()
            self.window.flip()

            
            # Listen for a left or right key response
            response = event.waitKeys(keyList=response_keys)
            print(string)
            print(response)
            # Check response accuracy
            if(isWord == 1 and response[0] == response_keys[0]):
                correct = 1
            elif(isWord == 0 and response[0] == response_keys[1]):
                correct = 1
            else:
                correct = 0
            # Output the results to a results file
            results = results + str(subj) + ',' + str(string) + ',' + str(isWord) + ',' + str(correct) +'\n'
        return results

    def terminate(self):
        self.window.close()
        core.quit()
            
