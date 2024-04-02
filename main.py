from tkinter import *

root = Tk()
root.geometry("1920x1080")

exit_btn = Button(root, text="exit", command=lambda: exit())
exit_btn.pack()


root.mainloop()
