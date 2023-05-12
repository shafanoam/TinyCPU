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

window = tk.Tk()

startingList = []
listWithoutExtras = []
varsList = []

# done for error locations
linesList = []

inputFilePath = ''

finalHexList = []

# options variables
allowHighMemory = tk.IntVar()
allowHighMemory.set(0)


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


def gen_empty_hex():
    global finalHexList
    finalHexList = []
    for i in range(0, (2**12 if allowHighMemory.get() == 0 else 2**24)):
        finalHexList.append(0x00)


# remove blank lines as well as comment lines, designated by # much like in python
# also generates linesList, which allows errors to also specify the line
# generates blank hex output
def first_pass():

    taskLabel.configure(text='Initial setup...')
    window.update()

    global listWithoutExtras
    listWithoutExtras = []
    global linesList
    linesList = []
    for i in range(len(startingList)):
        if not (startingList[i][0] == '#' or startingList[i] == '\n'):
            listWithoutExtras.append(startingList[i].replace('\n', ''))
            linesList.append(i+1)
        progress['value'] += 18/len(startingList)
        # ensures the speed is dictated by the actual algorithm and not the window.update refresh rate XD
        if i % 10 == 0:
            window.update()

    gen_empty_hex()

    # Update once again in case the program was less than 25 lines long.
    window.update()
    return True


# create data and message blocks, as well as variable lookup table
def second_pass():
    taskLabel.configure(text='Generating data/variable tables...')
    window.update()

    global varsList
    varsList = []

    for line in listWithoutExtras:
        lineSplit = str(line).split()
        print(lineSplit)
        current_instruction = lineSplit[0]

        if current_instruction == 'data':
            # watch for improperly made numbers
            try:
                start_hex = int(lineSplit[1].rstrip(','), base=16)
            except ValueError:
                showerror('Value Error', 'Bad starting address at line ' + str(linesList[listWithoutExtras.index(line)])
                          + ':\n' + line)
                return False
            try:
                length_int = int(lineSplit[2])
            except ValueError:
                showerror('Value Error', 'Bad data length at line ' + str(linesList[listWithoutExtras.index(line)])
                          + ':\n' + line)
                return False

            # check for numbers out of range
            if start_hex <= -1 or (start_hex > 4096 and not allowHighMemory.get()):
                showerror('Memory Error', 'Starting address out of range (must be 0x000 to 0xfff) in line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
                return False
            if (start_hex + length_int) > 4096 and not allowHighMemory.get():
                showerror('Memory Error', 'Data block is to large and overflows memory in line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
                return False

            # check for previously placed data
            for i in range(start_hex, start_hex + length_int):
                if finalHexList[i]:
                    showerror('Data Block Error', 'Data block at line ' + str(linesList[listWithoutExtras.index(line)])
                              + ' overwrites data at location ' + hex(i) + ':\n' + line)
                    return False

            index = 1   # done so that we don't accidentally insert the code lines itself
            for i in range(start_hex, start_hex + length_int):
                if len(listWithoutExtras[listWithoutExtras.index(line) + index]) <= 2:
                    try:
                        finalHexList[i] = listWithoutExtras[listWithoutExtras.index(line) + index]
                    except ValueError:
                        showerror('Data Block Error',
                                  'Bad data value at line ' + str(linesList[listWithoutExtras.index(line)] + index)
                                  + ':\n' + listWithoutExtras[listWithoutExtras.index(line) + index])
                        return False
                else:
                    showerror('Value Error', 'Value too long (more than 8 bits) at line '
                              + str(linesList[listWithoutExtras.index(line)] + index)
                              + ':\n' + listWithoutExtras[listWithoutExtras.index(line) + index])
                index += 1

                progress['value'] + (30 / len(startingList)) / length_int
                window.update()

        if current_instruction == 'message':
            # watch for improperly made numbers
            try:
                start_hex = int(lineSplit[1].rstrip(','), base=16)
            except ValueError:
                showerror('Value Error', 'Bad starting address at line ' + str(linesList[listWithoutExtras.index(line)])
                          + ':\n' + line)
                return False

            # check for numbers out of range
            if start_hex <= -1 or (start_hex > 4096 and not allowHighMemory.get()):
                showerror('Memory Error', 'Starting address out of range (must be 0x000 to 0xfff) in line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
                return False

            # find length of message
            messageLength = 0
            for i in range(2, len(lineSplit)):
                for j in range(len(lineSplit[i])):
                    messageLength += 1
                # account for spaces
                if not i == (len(lineSplit) - 1):
                    messageLength += 1

            if (start_hex + messageLength) > 4096 and not allowHighMemory.get():
                showerror('Memory Error', 'Message block is to large and overflows memory in line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
                return False

            # check for previously placed data
            for i in range(start_hex, start_hex + len(lineSplit) - 2):
                if finalHexList[i]:
                    showerror('Message Block Error', 'Message block at line '
                              + str(linesList[listWithoutExtras.index(line)]) + ' overwrites data at location '
                              + hex(i) + ':\n' + line)
                    return False

            index = start_hex
            for i in range(2, len(lineSplit)):
                for char in [*lineSplit[i]]:
                    finalHexList[index] = hex(ord(char)).lstrip('0x')
                    index += 1

                # account for spaces, which are removed by splitting line
                if not i == (len(lineSplit) - 1):
                    finalHexList[index] = hex(ord(' ')).lstrip('0x')
                    index += 1

                progress['value'] += (30 / len(startingList)) / (len(lineSplit) - 2)
                window.update()

        if current_instruction == 'var':
            # check for same-named variables
            variable = lineSplit[1]
            if variable in varsList:
                showerror('Variable Error', 'Repeat variable name in line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
                return False

            else:
                try:
                    if not int(lineSplit[2]) > 255:
                        varsList.append(variable)
                        varsList.append(hex(int(lineSplit[2])).lstrip('0x') if (int(lineSplit[2]) != 0) else '0')

                    else:
                        showerror('Variable Error', 'Initial value for for ' + variable + ' in line '
                                  + str(linesList[listWithoutExtras.index(line)]) + ' exceeds 8 bits:\n' + line)
                        return False

                except ValueError:

                    showerror('Variable Error', 'Initial value for for ' + variable + ' in line '
                              + str(linesList[listWithoutExtras.index(line)]) + ' is not base 10:\n' + line)
                    return False

        else:
            progress['value'] += 30 / len(startingList)
            window.update()
    return True


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
        if first_pass():
            if second_pass():
                print(finalHexList)

    currentTask = 'Waiting for user...'
    taskLabel.configure(background='light green', text='Waiting for user...')
    startButton.state(['!disabled'])
    inputPathButton.state(['!disabled'])
    outputPathButton.state(['!disabled'])


# initalize main window

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

allowMemOver = ttk.Checkbutton(optionsArea, text='Allow memory use over than 0xfff (max 0xffffff)',
                               variable=allowHighMemory)
allowMemOver.place(relx=0.01, rely=0.01)

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
