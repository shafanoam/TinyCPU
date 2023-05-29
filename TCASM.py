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
labelsList = []
returnForLabels = []
returnForVariables = []

registerInstructions = ['mov', 'add', 'sub', 'and', 'or', 'xor', 'shr', 'shl']
memoryInstructions = ['lda', 'sta', 'jmp', 'cal']
currentMemLocation = 0

# done for error locations
linesList = []

inputFilePath = ''
folderpath = ''

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
            file.close()

        return True

    else:
        return False


def check_existence_output(folderpath_x):
    global folderpath
    folderpath = folderpath_x.replace('\n', '')

    if path.exists(folderpath + '/' + path.basename(inputFilePath).rstrip('.tcasm') + '.txt'):
        okay = askokcancel(title='Be careful!', icon='warning',
                           message='The file' + path.basename(inputFilePath).rstrip('.tcasm') +
                                   '.txt already exists in the selected folder. Continuing will overwrite it.'
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
        finalHexList.append('')


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
        current_instruction = lineSplit[0]

        if current_instruction == 'data':
            # watch for improperly made numbers
            try:
                start_hex = int(lineSplit[1].rstrip(','), base=16)
            except ValueError:
                showerror('Address Error', 'Bad starting address at line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
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
                showerror('Address Error', 'Bad starting address at line '
                          + str(linesList[listWithoutExtras.index(line)]) + ':\n' + line)
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

    progress['value'] = 30
    window.update()
    return True


# first true assembly pass - also generates label lookup table for use in the next pass
def third_pass():
    taskLabel.configure(text='Assembling Instructions...')
    window.update()

    global labelsList
    labelsList = []
    global returnForLabels
    returnForLabels = []
    global returnForVariables
    returnForVariables = []

    # used so we know where in the finalHexList to store the data
    global currentMemLocation
    currentMemLocation = 0

    for line in listWithoutExtras:
        lineSplit = str(line).split()
        print(lineSplit)
        current_instruction = lineSplit[0]

        # make sure that memory location is empty - don't be overwriting data and message blocks!
        if finalHexList[currentMemLocation] == '':

            # register based instructions
            if current_instruction.lower() in registerInstructions:

                # get register 1
                if lineSplit[1].lower().rstrip(',') == 'a':
                    reg_1 = '00'
                elif lineSplit[1].lower().rstrip(',') == 'b':
                    reg_1 = '01'
                elif lineSplit[1].lower().rstrip(',') == 'c':
                    reg_1 = '10'
                elif lineSplit[1].lower().rstrip(',') == 'd':
                    reg_1 = '11'
                else:
                    showerror('Register Error', 'Bad register in line ' + str(linesList[listWithoutExtras.index(line)])
                              + ':\n' + line)
                    return False

                # register 2 time
                if lineSplit[2].lower().rstrip(',') == 'a':
                    reg_2 = '00'
                elif lineSplit[2].lower().rstrip(',') == 'b':
                    reg_2 = '01'
                elif lineSplit[2].lower().rstrip(',') == 'c':
                    reg_2 = '10'
                elif lineSplit[2].lower().rstrip(',') == 'd':
                    reg_2 = '11'
                else:
                    showerror('Register Error', 'Bad register in line ' + str(linesList[listWithoutExtras.index(line)])
                              + ':\n' + line)
                    return False
                regcode = hex(int(reg_1 + reg_2, 2)).lstrip('0x') if int(reg_1 + reg_2, 2) != 0 else '0'

                if current_instruction.lower() == 'mov':
                    finalHexList[currentMemLocation] = '0' + regcode
                elif current_instruction.lower() == 'add':
                    finalHexList[currentMemLocation] = '1' + regcode
                elif current_instruction.lower() == 'sub':
                    finalHexList[currentMemLocation] = '2' + regcode
                elif current_instruction.lower() == 'and':
                    finalHexList[currentMemLocation] = '3' + regcode
                elif current_instruction.lower() == 'or':
                    finalHexList[currentMemLocation] = '4' + regcode
                elif current_instruction.lower() == 'xor':
                    finalHexList[currentMemLocation] = '5' + regcode
                elif current_instruction.lower() == 'shl':
                    finalHexList[currentMemLocation] = '6' + regcode
                elif current_instruction.lower() == 'shr':
                    finalHexList[currentMemLocation] = '7' + regcode

                currentMemLocation += 1

            # 'skip if !flag' instructions
            elif current_instruction.lower() == 'snc':
                finalHexList[currentMemLocation] = 'a0'
                currentMemLocation += 1
            elif current_instruction.lower() == 'snz':
                finalHexList[currentMemLocation] = 'b0'
                currentMemLocation += 1

            # specialty instructions; return from subroutine and halt
            elif current_instruction.lower() == 'ret':
                finalHexList[currentMemLocation] = 'e0'
                currentMemLocation += 1
            elif current_instruction.lower() == 'hlt':
                finalHexList[currentMemLocation] = 'f0'
                currentMemLocation += 1

            elif current_instruction.lower() in memoryInstructions:

                instruction = current_instruction.lower()

                # variable detected - leave empty space for filling in with proper adress later
                if lineSplit[1][0] == '@':
                    if instruction == 'lda':
                        finalHexList[currentMemLocation] = '8'
                        currentMemLocation += 2
                    elif instruction == 'sta':
                        finalHexList[currentMemLocation] = '9'
                        currentMemLocation += 2
                    else:
                        showerror('Instruction Error', "Instructions JMP and CAL currently do not support variables.\n"
                                  + 'Error located at line ' + str(linesList[listWithoutExtras.index(line)])
                                  + ':\n' + line)
                        return False

                    # save location to return there in future with proper address
                    returnForVariables.append(currentMemLocation - 2)
                    returnForVariables.append(lineSplit[1].lstrip('@'))

                # label detected - leave empty space for filling in with proper address later
                elif lineSplit[1][0] == '.':
                    if instruction == 'lda':
                        finalHexList[currentMemLocation] = '8'
                        currentMemLocation += 2
                    elif instruction == 'sta':
                        finalHexList[currentMemLocation] = '9'
                        currentMemLocation += 2
                    elif instruction == 'jmp':
                        finalHexList[currentMemLocation] = 'c'
                        currentMemLocation += 2
                    elif instruction == 'cal':
                        finalHexList[currentMemLocation] = 'd'
                        currentMemLocation += 2

                    # save location to return there in future with proper address
                    returnForLabels.append(currentMemLocation - 2)
                    returnForLabels.append(lineSplit[1].lstrip('.'))

                # no variable or label, therefore it must either be an address or was written wrong.
                else:
                    # attempt to convert to an integer - if this fails it means something was written wrong.
                    # KNOWN EDGE CASE!!! # If the variable/label contains, for some godforsaken reason, only hexadecimel
                    # KNOWN EDGE CASE!!! # numbers and is 3 characters long plus the 0x, then it will pass this test and
                    # KNOWN EDGE CASE!!! # will be treated as an address if the user forgets to specify via '.' or '@'!!

                    try:
                        workingAddress = int(lineSplit[1], base=16)
                    except ValueError:
                        showerror('Address Error',
                                  'Bad address at line ' + str(linesList[listWithoutExtras.index(line)])
                                  + ':\n' + line)
                        return False

                    workingAddress = lineSplit[1].lstrip('0x')
                    # make sure it's the correct length
                    if len(workingAddress) == 1:
                        workingAddress = '00' + workingAddress
                    elif len(workingAddress) == 2:
                        workingAddress = '0' + workingAddress
                    print(workingAddress)

                    try:
                        if instruction == 'lda':
                            finalHexList[currentMemLocation] = '8' + workingAddress[0]
                            finalHexList[currentMemLocation + 1] = workingAddress[1] + workingAddress[2]
                            currentMemLocation += 2
                        elif instruction == 'sta':
                            finalHexList[currentMemLocation] = '9' + workingAddress[0]
                            finalHexList[currentMemLocation + 1] = workingAddress[1] + workingAddress[2]
                            currentMemLocation += 2
                        elif instruction == 'jmp':
                            finalHexList[currentMemLocation] = 'c' + workingAddress[0]
                            finalHexList[currentMemLocation + 1] = workingAddress[1] + workingAddress[2]
                            currentMemLocation += 2
                        elif instruction == 'cal':
                            finalHexList[currentMemLocation] = 'd' + workingAddress[0]
                            finalHexList[currentMemLocation + 1] = workingAddress[1] + workingAddress[2]
                            currentMemLocation += 2
                    except IndexError as error:
                        showerror('Index Error', 'Error at line ' + str(linesList[listWithoutExtras.index(line)])
                                  + ':\n' + str(error))

            # check for label
            if current_instruction.lower()[0] == '.':
                # check if it's an offset label
                if current_instruction.lower()[1] == '.':
                    labelsList.append(current_instruction.lstrip('..'))
                    labelsList.append(currentMemLocation + 1)
                else:
                    labelsList.append(current_instruction.lstrip('.'))
                    labelsList.append(currentMemLocation)
                # don't increment currentMemLocation as the label doesn't actually exist in memory, it's a placeholder

        # in case current address already has data, say for
        else:
            currentMemLocation += 1

        progress['value'] += 60 / len(listWithoutExtras)
        window.update()

    return True


# Set variable memory locations - change initial value to memory location
def fourth_pass():
    taskLabel.configure(text='Infusing variables and labels...')
    window.update()

    varsLeft = len(returnForVariables) / 2
    global currentMemLocation
    start_hex = currentMemLocation

    for iteration in range(int(len(varsList) / 2)):  # don't question the redundant int(). The code breaks without it.
        while not finalHexList[currentMemLocation] == '':
            currentMemLocation += 1
        finalHexList[currentMemLocation] = varsList[iteration * 2 + 1]
        varsList[iteration * 2 + 1] = currentMemLocation

    for i in range(int(varsLeft)):
        workingAddress = returnForVariables[i * 2]

        # separate into digits

        finalHexList[workingAddress + 1] = hex(
            varsList[varsList.index(returnForVariables[i * 2 + 1]) + 1]).lstrip('0x')
        print(finalHexList[workingAddress + 1])

        # strip first digit if 3 digits long
        if len(hex(varsList[varsList.index(returnForVariables[i * 2 + 1]) + 1]).lstrip('0x')) == 3:
            finalHexList[workingAddress + 1] = finalHexList[workingAddress + 1][1] + finalHexList[workingAddress + 1][2]

        # add the zero if need be
        if len(hex(varsList[varsList.index(returnForVariables[i * 2 + 1]) + 1]).lstrip('0x')) == 1:
            finalHexList[workingAddress + 1] = '0' + str(finalHexList[workingAddress + 1])

        # if the length of the hexadecimal digit is three, then the high digit needs to be combined with the opcode
        if len(hex(varsList[varsList.index(returnForVariables[i * 2 + 1]) + 1]).lstrip('0x')) == 3:
            finalHexList[workingAddress] = str(finalHexList[workingAddress]) + (hex(
                varsList[varsList.index(returnForVariables[i * 2 + 1]) + 1]).lstrip('0x'))[0]
        else:
            finalHexList[workingAddress] = str(finalHexList[workingAddress]) + '0'

    return True


# final actual pass -
def fifth_pass():

    labelsLeft = len(returnForLabels) / 2

    for iteration in range(int(len(returnForLabels) / 2)):

        workingAddress = returnForLabels[iteration * 2]

        # separate into digits
        try:
            finalHexList[workingAddress + 1] = hex(
                labelsList[labelsList.index(returnForLabels[iteration * 2 + 1]) + 1]).lstrip('0x')

            # add the zero if need be
            if len(hex(labelsList[labelsList.index(returnForLabels[iteration * 2 + 1]) + 1]).lstrip('0x')) == 1:
                finalHexList[workingAddress + 1] = '0' + str(finalHexList[workingAddress + 1])

            # if the length of the hexadecimal digit is three, then the high digit needs to be combined with the opcode
            if len(hex(labelsList[labelsList.index(returnForLabels[iteration * 2 + 1]) + 1]).lstrip('0x')) == 3:
                finalHexList[workingAddress] = str(finalHexList[workingAddress]) + hex(
                    labelsList[labelsList.index(returnForLabels[iteration * 2 + 1]) + 1]).lstrip('0x')
            else:
                finalHexList[workingAddress] = str(finalHexList[workingAddress]) + '0'
        except ValueError:
            showerror('Label Error', 'Label not indexed: ' + returnForLabels[iteration * 2 + 1])
            return False

    return True


def output_logisim():
    taskLabel.configure(text='Outputting...')
    window.update()

    with open(folderpath + '/' + path.basename(inputFilePath).rstrip('.tcasm') + '.txt', 'w') as file:

        file.write('v3.0 hex bytes plain big-endian\n')
        for i in range(len(finalHexList)):
            if finalHexList[i] != '':
                file.write(('0' + finalHexList[i]) if len(finalHexList[i]) == 1 else finalHexList[i])
            else:
                file.write('00')
            progress['value'] += 10 / len(finalHexList)

        file.close()


def output_ascii():
    taskLabel.configure(text='Outputting...')
    window.update()

    with open(folderpath + '/' + path.basename(inputFilePath).rstrip('.tcasm') + '.txt', 'w') as file:

        file.write('Copy the contents below and paste into your serial terminal of choice:\n')
        for i in range(len(finalHexList)):
            if not finalHexList[i] == '':
                byte_array = bytearray.fromhex(finalHexList[i])
                file.write(byte_array.decode(encoding='ascii'))
            else:
                file.write((bytearray.fromhex('00')).decode())
            progress['value'] += 10 / len(finalHexList)

        file.close()


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
                if third_pass():
                    if fourth_pass():
                        if fifth_pass():
                            if outputFormat.get() == 'Logisim v3.0 hex bytes plain big-endian':
                                output_logisim()
                            elif outputFormat.get() == 'Ascii Hex for UART data transfer':
                                # output_ascii()
                                pass
                            else:
                                showerror('Output Error', 'Please specify an output format.')
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

outputFormat = tk.StringVar()
outForm = ttk.Combobox(optionsArea, textvariable=outputFormat)
outForm['values'] = ['Logisim v3.0 hex bytes plain big-endian', 'Ascii Hex for UART data transfer']
outForm['state'] = 'readonly'
outForm.place(relx=0.625, rely=0.6, relwidth=0.325)
outFormLabel = ttk.Label(optionsArea, text='Output format:')
outFormLabel.place(relx=0.5, rely=0.6)

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
