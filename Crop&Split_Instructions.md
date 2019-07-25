## Crop&Split Instructions File.

Crop&Split is an ImageJ macro that allows you to select an area in your z-stack and creates a new image with only the region selected in a loss-less fashion. In addition, this tool makes it easy to split your image stacks into folders with individual z planes that you can use as a starting point for the ChromCond tool. Following are instructins on how to download, install and use the tool.

## How to Download
In order to download [Crop&Split](https://raw.githubusercontent.com/McCuskerLab/ChromCon/master/Crop%26Split.ijm) just click on the [link](https://raw.githubusercontent.com/McCuskerLab/ChromCon/master/Crop%26Split.ijm) and save the file locally to your computer as a **.ijm** (imageJ macro) file. 

## How to install
As an installation, you just need to place the saved file somewere in your computer where you can find it.

## How to use
In order to use the **Crop&Split** macro, first open ImageJ and select from the menu bar **Plugins> *Macros>*** Edit...
Select the file in your cmputer and click ***Open***. Once the file opens, just select **run** on the botom right.

## How does it work? What does it do?
The first thing the macro does is open a window so that you can select the file (image) you want to work with.
Afer you selec the image and hit **Open**, imageJ will open the image and ask you to select an area to crop and **then** press ok. You can select an area with any of ImageJ's selection tools. If you want to process tha whole image, leave it without any selection. Afte you are done selecting click the OK button on the prompt window.
ImageJ will then go to work on the background, generating a folder named after the original image and giving a prompt indicating that the macro has finished processing. Inside this folder you'll find as many ***.tif*** files as chanels the original image has. For each of these images, you'll also find a folder names after each chanel and insife this folders, individual images corresponding to each individual optical plane of your Z-stack.
You can now use these images and/or folders for further analysis.
