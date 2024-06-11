from psychopy import visual, core
from psychopy.hardware import keyboard

win = visual.Window([1200,800], monitor="testMonitor", units="deg")
msg = visual.TextStim(win, text="Does it work?")
msg2 = visual.TextStim(win, text="Keyboard works!")

kb_input = keyboard.Keyboard()

while True:
    msg.draw()
    win.flip()

    if len(kb.getKeys()) > 0:
        break
    event.clearEvents()

win.close()
core.quit()
