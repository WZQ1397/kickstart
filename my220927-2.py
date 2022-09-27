# Author: Zach.Wang
# Module: fileEnc.py

import pickle
from sys import argv
from datetime import datetime
filename=None

class initFileName(object):
    def __init__(self,filename=filename) -> None:
        self.__filename = filename

    def get_filename(self) -> str:
        return "".join(self.__filename.split('.')[:-1])

    def get_extension(self) -> str:
        return self.__filename.split('.')[-1]

    def gen_time_subfix(self) -> str:
        return datetime.strftime(datetime.now(),"%Y-%m-%d-%H-%M-%S")

    def gen_pickle_file_name(self) -> str:
        return f"{self.get_filename()}.pickle"

    def gen_save_file_name(self) -> str:
        return f"{self.get_filename()}." \
               f"{self.gen_time_subfix()}." \
               f"{self.get_extension()}"

class genEncFile(object):
    def __init__(self,filename=filename) -> None:
        self.__filename = filename
        self.__FileNameOps = initFileName(self.__filename)
        self.__pickleFile = self.__FileNameOps.gen_pickle_file_name()
        self.__saveFile = self.__FileNameOps.gen_save_file_name()

    def picklize_file(self) -> None:
        with open(self.__filename, "rb") as fread,\
                open(self.__pickleFile, 'wb') as fpickle:
            print(f"{self.__filename} ==> {self.__pickleFile}")
            for data in fread.readlines():
                pickle.dump(data,fpickle, pickle.HIGHEST_PROTOCOL)

    def unpack_file(self,filename:str=None,extension: str = None) -> None:
        if filename is not None:
            self.__pickleFile = filename
        if extension is not None:
            self.__saveFile = f"{self.__saveFile}.{extension}"
        with open(self.__saveFile, "wb") as fsave,\
                open(self.__pickleFile, 'rb') as fpickle:
            print(f"{self.__pickleFile} ==> {self.__saveFile}")
            while True:
                try:
                    item=pickle.load(fpickle)
                    fsave.write(item)
                except EOFError as _:
                    break

class Pic2Base64:

    # Author: Zach.Wang
    # Module: Pic2Base64.py

    import base64
    
    def __init__(self,binfilename=None):
        self.filename= "MicrosoftTeams-image.png"
        self.savebinfile=filename+".new.txt"
        self.savepicfile=filename+".new.png"
        # saveFiletoBase64()
        readBase64code(binfilename)

    def saveFiletoBase64(self,onScr: bool = True):
        with open(self.filename, "rb") as fread, open(self.savebinfile,"wb") as fsave:
            data = base64.b64encode(fread.read())
            fsave.write(data)
        if onScr:
            print(data)

    def readBase64code(self,savebinfile=savebinfile):
        with open(self.savebinfile, "rb") as fread, open(self.savepicfile,"wb") as fsave:
            data = base64.b64decode(fread.read())
            fsave.write(data)

if __name__ == "__main__":
    while filename is None:
        filename = argv[1]

else:
    while filename is None:
        filename = input("Input A filename: ")

fileOps = genEncFile(filename)
# fileOps.picklize_file()
fileOps.unpack_file(filename,"7z")
