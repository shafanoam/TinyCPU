import tkinter as tk
from tkinter import ttk
from tkinter import filedialog as fd

# done for fixing the blurriness issue
import ctypes

# fixes blurriness
ctypes.windll.shcore.SetProcessDpiAwareness(1)

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
inputPathLabel.insert('1.0', 'Please select the input file; may be of the .txt or .tcasm filetype.')
inputPathLabel['state'] = 'disabled'
inputPathLabel.place(relx=0.17, rely=0.05, relwidth=0.81, relheight=0.7)


def select_input_file():
    filetypes = (('text files', '*.txt'), ('TCASM files', '*.tcasm'))

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
outputPathLabel.insert('1.0', "Please select the output file; it will be overwritten with the program output.")
outputPathLabel['state'] = 'disabled'
outputPathLabel.place(relx=0.17, rely=0.05, relwidth=0.81, relheight=0.7)


def select_input_file():
    filetypes = (('text files', '*.txt'), ('TCASM files', '*.tcasm'))

    file = fd.askopenfilename(title='Select the output file:',
                              initialdir='*/Documents', filetypes=filetypes)
    outputPathLabel['state'] = 'normal'
    outputPathLabel.delete("1.0", "end")
    outputPathLabel.insert('1.0', file)
    outputPathLabel['state'] = 'disabled'
    return


outputPathButton = ttk.Button(outputArea, text='Browse', command=select_input_file)
outputPathButton.place(relx=0.01, rely=0.05, relwidth=0.15)


# options area
optionsArea = ttk.Labelframe(general, text='Options:')
optionsArea.place(relx=0.01, rely=0.555, relwidth=0.98, height=120)


# assemble area
assembleArea = ttk.Labelframe(general, text='Assemble:')
assembleArea.place(relx=0.01, rely=0.775, relwidth=0.98, height=90)

currentTask = 'Waiting for user...'

taskLabel = tk.Label(assembleArea, text=currentTask, background='light green', justify=tk.CENTER)
taskLabel.place(relx=0.6, rely=0.01, relwidth=0.35)

specificProgress = ttk.Progressbar(assembleArea, orient='horizontal', mode='determinate', length=100)
specificProgress.place(relx=0.02, rely=0.01, relwidth=0.55, relheight=0.35)

overallProgress = ttk.Progressbar(assembleArea, orient='horizontal', mode='determinate', length=100)
overallProgress.place(relx=0.02, rely=0.5, relwidth=0.55, relheight=0.35)

window.mainloop()
