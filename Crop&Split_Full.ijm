// Created by Prof. Julian Sosnik for Prof. Catherine McCusker's Lab
// evolved from a macro created by Dr. Matheus Viana / Dr. Susanne Rafelski
//
// This work is distributed under the Modified BSD license (https://opensource.org/licenses/BSD-3-Clause)
//
//////////////////////////////////////////////////////////////////////////////////////
// This macro opens a file, let's you select an area and then creates a cropped version 
// of your image (or stack, or Hyperstack) that contains only the portion
// of the original image that you selected...
// In the case of multiple channels, it generates sub-folders
// for each of the channels and stores the images there
// It also offers the option to select the start and end Z planes on a stack
//////////////////////////////////////////////////////////////////////////
macro "Crop&Split Action Tool - Ce00T7d18J" {
run("Open...");
// gather file name and path for the original image
path = getInfo("image.directory");
path  = path + "/";
name = getTitle();
l = lengthOf(name);
newName = substring(name,0,l-4);
k=0
ii = '00';
dirName = newName + '_' + ii;
while (File.isDirectory(path+dirName)== 1){
	k++;
	ii = IJ.pad(k,2);
	dirName = newName+'_'+ii;
	}
getDimensions(width, height, channels, slices, frames);

//select area and chanels to crop and process into new image
labels = newArray(channels);
defaults = newArray(channels);
CH = newArray(channels);
for (i = 0; i<channels; i++){
	labels[i] = "C"+i+1;
	defaults[i] = true;
}

waitForUser("Select the area of the\nimage that you want to keep");

///  Add selection to ROI manager to use later
roiManager("reset");
setOption("Show All", false);
if (selectionType() == -1) {  //  Checks to see if there is a selection made to make an ROI
	makeRectangle(0, 0, width, height);  // If there is not one, it makes one with the dimensions of the whole image
} 

roiManager("add");
roiManager("remove slice info");
Roi.getBounds(roix, roiy, roiWidth, roiWeight);

Dialog.create("Dimensions to reduce...");
Dialog.addMessage("Select Chanels you want to keep\nand indicate if you want\nto adjust the Z dimension.\n");
Dialog.addMessage("\n          THEN HIT OK");
Dialog.addMessage(" ");
Dialog.addCheckboxGroup(1,channels,labels,defaults);
Dialog.addMessage(" ");
Dialog.addCheckbox("Adjust Z?", true);
Dialog.show();

for (i = 0; i<channels; i++){
	CH[i] = Dialog.getCheckbox();
}
ZZ1 = Dialog.getCheckbox();


if (ZZ1 == true){
	waitForUser("Set the image to\nthe first slice\to be included in the\nnew stack and hit OK");
	selectImage(name);
	slRoof = (getSliceNumber()+(channels-1)) / channels;
	
	waitForUser("Set the image to\nthe last slice\to be included in the\nnew stack and hit OK");
	selectImage(name);
	slFloor = (getSliceNumber()+(channels-1)) / channels;
} else {
	slRoof = 1;
	slFloor = slices;
}

if (slFloor < slRoof){
	tmp = slFloor;
	slFloor = slRoof;
	slRoof = tmp;
}

ZZ = slFloor - slRoof + 1;


setBatchMode(true);  // runs in background to accelerate process
setBatchMode("hide");
File.makeDirectory(path+dirName); //creates forder to save the output files

chan = channels;
if (chan>1){
	run("Split Channels");
}
for (ii=1; ii<=chan; ii++){
	if (CH[ii-1] == 1){
		File.makeDirectory(path+dirName+"/C"+ii+"_"+dirName); //creates sub-forder to save the output files for each channel
		if (chan>1){
			orig = "C"+ii+"-"+name; // now can refer to that image as "orig"
		} else {
			orig = name;
		}
		selectImage(orig);    //select the image from the channel ii
		// gather information about the original image
		info = getMetadata("Info");
		getDimensions(width, height, channels, slices, frames);
		getVoxelSize(Vwidth, Vheight, depth, unit);
		fps = Stack.getFrameInterval();
		
		// first find the minimum value within the selection within the entire z-stack
	/*	minmin =65535; //this is the maximum value for a 16-bit image and a starting point
		for (n=1; n<=slices; n++) {
			setSlice(n);
			getStatistics(area, mean, min, max);
			if (min<minmin) minmin = min;
			}
	*/	
		//make a new image z-stack
		newImage("C"+ii+"-"+dirName+"_cropped", "16-bit Black", roiWidth, roiWeight, ZZ);
		final = getImageID;	//now can refer to this new z-stack as "final" and go back and forth between orig and final
		setMetadata("Info", info);
		run("Properties...", "channels="+channels+" slices="+ZZ+" frames="+frames+" unit="+unit+" pixel_width="+Vwidth+" pixel_height="+Vheight+" voxel_depth="+depth+" frame=["+fps+" sec]");
		Stack.setFrameRate(fps);
	
		//paste selection into the new stack frame by frame
		for (n=slRoof; n<=slFloor; n++) {
			selectImage(orig);
			setSlice(n);
			roiManager("select", 0); //  Apply the ROI from the original image
			mylist = List.setMeasurements; // get measurements from original image's ROI
			minmin = List.get('Min'); // get darkest value
			selectImage(final);
			setSlice(n-slRoof+1);
			run("Add...", "stack value="+minmin);  //apply darkest value to slice
			selectImage(orig);
			run("Copy");
			selectImage(final);
			run("Paste");
		}
		
		selectImage(orig);
		close();
		selectImage(final);
		getDimensions(width, height, channels, slices, frames);
		namefinal = "C"+ii+"-"+dirName+"_cropped";
		save(path+dirName+"/"+namefinal+".tif");  //saves cropped image
		//separates the slices into individual images
		run("Stack to Images");
		for (i=1; i<=slices; i++){
			j = IJ.pad(i, 4);
			imag = namefinal+"-"+j;
			selectImage(imag);
			na = getTitle();
			save(path+dirName+"/C"+ii+"_"+dirName+"/"+na+".tif");
			close();
		} 
	} else {
		ii++;
	}
}


//// Cleanup
roiManager("reset");
selectWindow("ROI Manager"); 
run("Close"); 

////// THE CODE ENDS HERE, NEXT LINE IS SO YOU KNOW WHEN THE PROGRAM IS DONE RUNNING
waitForUser("Done");  // Exit message
}
