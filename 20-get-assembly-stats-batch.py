#!/usr/bin/env python2.7
import io
import os
import sys
import numpy
# run from scripts dir
# batch stats generation for each assembly in 03-spades-output-assembled:
        # Contigs >= 100 nt
        # Contigs >= 500 nt
        # Scaffolds >= 100 nt
        # Scaffolds >= 500 nt
        #   Number
        #   Total length
        #   Average
        #   N50
        #   Median
        #   Largest


#------------------------------------------------------------------#
# functions
#------------------------------------------------------------------#

# <1> load lengths from fasta and generate output.lengths
def LoadAssembly (inputFile, outputFile):                        
    print("loading assembly file from: " + inputFile);
    print("writing scaffold lengths to: " + outputFile);
    with open(inputFile) as inFile, open(outputFile, "a") as outFile:
        lengthList = [];
        seq = "";
        seqLength = 0;
        for line in inFile:
            line = line.strip();
            if line[0] == ">":
                if seq:
                    seqLength = len(seq);
                    outFile.write(header+'\t'+str(seqLength)+'\n');
                    lengthList.append(seqLength);
                    seq = "";
                header = line[1:];
            else:
                seq += line;
        seqLength = len(seq);
        outFile.write(header+'\t'+str(seqLength)+'\n');
        lengthList.append(seqLength);
        return(lengthList);

def GetAssemblyStats (aList, outputFile):
    aN = numpy.asarray(aList);
    aNarray = numpy.sort(aN);
    bN = [a for a in aNarray if a >= 0];
    bNarray = numpy.asarray(bN);
    print("writing assembly stats to: " + outputFile);
    outFile = io.open(outputFile, "a");
    (number,total_length,average,n50,median,largest,shortest) = GetStats(aNarray);
    #outFile.write(unicode("Scaffolds > 100nt\nNumber\t"+str(number)+"\nTotal Length\t"+str(total_length)+\
    #              "\nN50\t"+str(n50)+"\nAvg\t"+str(average)+"\nMedian\t"+str(median)+\
    #            "\nMax\t"+str(largest)+"\nMin\t"+str(shortest)+"\n"));
    (number,total_length,average,n50,median,largest,shortest) = GetStats(bNarray);
    outFile.write(unicode("Scaffolds > 0nt\nNumber\t"+str(number)+"\nTotal Length\t"+str(total_length)+\
                  "\nN50\t"+str(n50)+"\nAvg\t"+str(average)+"\nMedian\t"+str(median)+\
                "\nMax\t"+str(largest)+"\nMin\t"+str(shortest)+"\n"));
    outFile.close();
    sys.stdout.write(unicode("Scaffolds > 0nt\nNumber\t"+str(number)+"\nTotal Length\t"+str(total_length)+\
                      "\nN50\t"+str(n50)+"\nAvg\t"+str(average)+"\nMedian\t"+str(median)+\
                    "\nMax\t"+str(largest)+"\nMin\t"+str(shortest)+"\n"));

def GetStats (npArray):
    number = npArray.size;
    total_length = numpy.sum(npArray);
    average = numpy.mean(npArray)
    n50 = GetN50(npArray, total_length);
    median = numpy.median(npArray);
    largest = numpy.amax(npArray);
    shortest = numpy.amin(npArray);
    return(number,total_length,average,n50,median,largest,shortest);

def GetN50 (inArray, total_length):
    half = total_length/2.0;
    cumsum = 0;
    for i in inArray:
        cumsum += i;
        if cumsum >= half:
            return(i);


#------------------------------------------------------------------#
# main
#------------------------------------------------------------------#

os.chdir("../03-spades-assembled/")
out_dir = "../03-spades-assembled-stats/"

if __name__ == '__main__':
    for filename in os.listdir("."):
        if filename.endswith(".fasta"):
            assembly = filename
            lengthsout = out_dir + assembly + ".lengths"
            statsout = out_dir + assembly + ".stats"
            listLengths = LoadAssembly(assembly, lengthsout)
            GetAssemblyStats (listLengths, statsout)
