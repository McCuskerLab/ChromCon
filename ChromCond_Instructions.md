## ChromCond Instructions.
 
 ChromCond is Matlab code that quantiffies **chromatin compaction**. Following are instructins on how to download, install and use the tool.

## How to Download
In order to download [ChromCond](https://raw.githubusercontent.com/McCuskerLab/ChromCon/master/ChromCond.m) just click on the [link](https://raw.githubusercontent.com/McCuskerLab/ChromCon/master/ChromCond.m) and save the file locally to your computer as a **.m** (matlab) file. 

## How to install
As an installation, you just need to place the saved file somewere in your computer where you can find it. Preferably within your **MATLAB** folder.

## How to use
In order to use the **ChromCond** code, first open Matlab and oopen the **.m** file you saved above.
Before you run the code, make sure your images are split into individual ***.tif*** files corresponding to each of the optical sectinons of you image, saved into individual folders for each image to be anlyzed. All these folders should be inside a master folder as indicated in the following image. ![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "File and Folder Organization")
Now you can just ***Run*** the code.

## How does it work? What does it do?
The first thing the macro does is open a window so that you can select the file (image) you want to work with.
Afer you selec the image and hit **Open**, imageJ will open the image and ask you to select an area to crop and **then** press ok. You can select an area with any of ImageJ's selection tools. If you want to process tha whole image, leave it without any selection. Afte you are done selecting click the OK button on the prompt window.
ImageJ will then go to work on the background, generating a folder named after the original image and giving a prompt indicating that the macro has finished processing. Inside this folder you'll find as many ***.tif*** files as chanels the original image has. For each of these images, you'll also find a folder names after each chanel and insife this folders, individual images corresponding to each individual optical plane of your Z-stack.
You can now use these images and/or folders for further analysis.
