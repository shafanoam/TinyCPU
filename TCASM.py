import time
import tkinter as tk
from tkinter import ttk
from tkinter import filedialog as fd
from tkinter.messagebox import showerror, askokcancel
from os import path


# done for fixing the blurriness issue
import ctypes

# fixes blurriness
ctypes.windll.shcore.SetProcessDpiAwareness(1)

# declare thingamabobs
startingList = []
listWithoutExtras = []

inputFilePath = ''


def load_file(filepath):

    global currentTask
    currentTask = 'Loading files...'
    taskLabel.configure(text='Loading files...')
    window.update()

    # the end of the textbox has a newline for some reason, so this takes care of that
    global inputFilePath
    inputFilePath = filepath.replace('\n', '')

    if path.exists(inputFilePath):

        with open(inputFilePath, 'r') as file:
            global startingList
            startingList = []
            for line in file:
                startingList.append(line)
                # print(line)
            file.close()

        progress['value'] = 2
        return True

    else:
        return False


def check_existence_output(folderpath):
    folderpath = folderpath.replace('\n', '')

    if path.exists(folderpath + '/' + path.basename(inputFilePath)):
        okay = askokcancel(title='Be careful!', icon='warning',
                           message='The file' + path.basename(inputFilePath) +
                                   ' already exists in the selected folder. Continuing will overwrite it.'
                           )
        if okay:
            return True
        else:
            return False

    else:
        return True


# remove blank lines as well as comment lines, designated by # much like in python
def first_pass():

    taskLabel.configure(text='Removing non-code lines...')
    window.update()

    global listWithoutExtras
    listWithoutExtras = []
    for i in range(len(startingList)):
        if not (startingList[i][0] == '#' or startingList[i] == '\n'):
            listWithoutExtras.append(startingList[i].replace('\n', ''))
        progress['value'] += 18/len(startingList)
        # ensures the speed is dictated by the actual algorithm and not the window.update refresh rate XD
        if i % 2 == 0:
            window.update()
    # Update once again in case the program was less than 25 lines long.
    window.update()


# create data block reference, as well as variable lookup table
def second_pass():
    pass


def start_system():

    global currentTask
    currentTask = 'Starting system...'
    taskLabel.configure(background='red', text='Starting system...')
    progress['value'] = 0
    startButton.state(['disabled'])
    inputPathButton.state(['disabled'])
    outputPathButton.state(['disabled'])

    window.update()

    input_path = inputPathLabel.get('1.0', 'end')
    if not load_file(input_path):
        showerror('Fatal Error', 'Input file does not exist!')

    output_path = outputPathLabel.get('1.0', 'end')
    if check_existence_output(output_path):

        # see individual functions for a description of what they do
        first_pass()
        second_pass()

    currentTask = 'Waiting for user...'
    taskLabel.configure(background='light green', text='Waiting for user...')
    startButton.state(['!disabled'])
    inputPathButton.state(['!disabled'])
    outputPathButton.state(['!disabled'])


# initalize main window
window = tk.Tk()

screen_width = window.winfo_screenwidth()
screen_height = window.winfo_screenheight()
center_x = int(screen_width / 2 - 400)
center_y = int(screen_height / 2 - 300)
window.geometry(f'800x600+{center_x}+{center_y}')
window.resizable(False, False)

window.configure(background='teal')
window.title('TCASM')

# create 'general' frame
general = tk.Frame(window)
general.place(relx=0.01, rely=0.01, relwidth=0.98, relheight=0.98,)

nameLabel = ttk.Label(general, text='TCASM', font='Helvetica, 24')
nameLabel.place(x=10, y=20)
describeLabel = ttk.Label(general, text='The TinyCPU ASseMbler\nCreated by shafanoam May 2023', font='Helvetica, 11')
describeLabel.place(x=10, y=75)

# input file area
inputArea = ttk.Labelframe(general, text='Input file:')
inputArea.place(relx=0.01, rely=0.225, relwidth=0.98, height=90)

inputPathLabel = tk.Text(inputArea, background='light gray', font='Helvetica, 11')
inputPathLabel.insert('1.0', 'Please select the input file.')
inputPathLabel['state'] = 'disabled'
inputPathLabel.place(relx=0.17, rely=0.05, relwidth=0.81, relheight=0.7)


def select_input_file():
    filetypes = (('TCASM files', '*.tcasm'), ('text files', '*.txt'))

    file = fd.askopenfilename(title='Select an input file:', initialdir='*/Documents', filetypes=filetypes)
    inputPathLabel['state'] = 'normal'
    inputPathLabel.delete("1.0", "end")
    inputPathLabel.insert('1.0', file)
    inputPathLabel['state'] = 'disabled'
    return


inputPathButton = ttk.Button(inputArea, text='Browse', command=select_input_file)
inputPathButton.place(relx=0.01, rely=0.05, relwidth=0.15)


# output file area
outputArea = ttk.Labelframe(general, text='Output file:')
outputArea.place(relx=0.01, rely=0.39, relwidth=0.98, height=90)

outputPathLabel = tk.Text(outputArea, background='light gray', font='Helvetica, 11')
outputPathLabel.insert('1.0',
                       "Please select the output directory.\nIf none is specified, will default to that of the input.")
outputPathLabel['state'] = 'disabled'
outputPathLabel.place(relx=0.17, rely=0.05, relwidth=0.81, relheight=0.7)


def select_output_file():

    file = fd.askdirectory(title='Select the output folder:', initialdir='*/Documents')
    outputPathLabel['state'] = 'normal'
    outputPathLabel.delete("1.0", "end")
    outputPathLabel.insert('1.0', file)
    outputPathLabel['state'] = 'disabled'
    return


outputPathButton = ttk.Button(outputArea, text='Browse', command=select_output_file)
outputPathButton.place(relx=0.01, rely=0.05, relwidth=0.15)


# options area
optionsArea = ttk.Labelframe(general, text='Options:')
optionsArea.place(relx=0.01, rely=0.555, relwidth=0.98, height=120)


# assemble area
assembleArea = ttk.Labelframe(general, text='Assemble:')
assembleArea.place(relx=0.01, rely=0.775, relwidth=0.98, height=90)

currentTask = 'Waiting for user...'

taskLabel = tk.Label(assembleArea, text='Waiting for user...', background='light green', justify=tk.CENTER)
taskLabel.place(relx=0.6, rely=0.01, relwidth=0.35)

progress = ttk.Progressbar(assembleArea, orient='horizontal', mode='determinate', length=100)
progress.place(relx=0.02, rely=0.01, relwidth=0.55, relheight=0.35)

timeLabel = ttk.Label(assembleArea, text='Note: expected time to assemble is about 1 second per kb.',
                      font='Helvetica, 10', foreground='gray')
timeLabel.place(relx=0.02, rely=0.5)

startButton = ttk.Button(assembleArea, text='Assemble', command=start_system)
startButton.place(relx=0.6, rely=0.5, relwidth=0.35)


window.mainloop()
