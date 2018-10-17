

# EricScript Readme v2.1 (Feb 2016)

Fork created by mmterpstra@github.com due to inactivity on the original forum. The version the files from is v0.5.5. 
This goals: run a minimal install/test on travis if possible. Feel free to submit a pull request if you think you can fix it faster and better.

Original project links:
 - https://sites.google.com/site/bioericscript/
 - https://sourceforge.net/projects/ericscript/
 - https://groups.google.com/forum/#!forum/ericscript

Please feel free to email the author if you have any questions or issues.
matteo.benelli AT gmail.com

# INFORMATION

EricScript is a software package developed in R, perl and bash scripts.
EricScript uses the BWA aligner to perform the mapping on the transcriptome reference and samtools to handle with SAM/BAM files. Recalibration of the exon junction reference is performed by using BLAT.

# REQUIREMENTS

Download and install the following software

- R (~3.4.4): http://cran.r-project.org/
- "ada" R package (~2.0-3): http://cran.r-project.org/web/packages/ada/index.html
- BWA (~0.7.15): http://bio-bwa.sourceforge.net
- SAMtools (>0.1.17 <=0.1.19): http://samtools.sourceforge.net/
- bedtools (>2.15): http://code.google.com/p/bedtools/
- BLAT (~3.5) binaries: http://genome-test.cse.ucsc.edu/~kent/exe/
- seqtk (~1.2): https://github.com/lh3/seqtk

> Be sure that all of these programs are included in your PATH.


# RUNNING ERIC

Once you have downloaded EricScript, extract the package

```
tar -xjf ericscript.tar.bz2
```

Make a copy of the program folder to your favorite location. Before running for the first time EricScript, you need to make ericscript.pl executable:

```
chmod +x /PATH/TO/ERIC/ericscript.pl
```

To get information about running EricScript, digit:

```
/PATH/TO/ERIC/ericscript.pl --help
```

In order to perform chimeric transcript detection, you need to download and build the Ensembl Database of a genome. To list the available genomes, digit:

```
/PATH/TO/ERIC/ericscript.pl --printdb -db /PATH/TO/YOUR/DBFOLDER
```

After a reference id is selected, you need to download and build the corresponding Ensembl Database. In the example below, it's shown how to prepare the database for saccharomyces cerevisiae.

```
/PATH/TO/ERIC/ericscript.pl --downdb --refid saccharomyces_cerevisiae -db /PATH/TO/YOUR/DBFOLDER
```

You can also select a specific ensembl release (>= 70 <=82) to download 

```
/PATH/TO/ERIC/ericscript.pl --downdb --refid saccharomyces_cerevisiae -db /PATH/TO/YOUR/DBFOLDER --ensversion 74
```

To run EricScript with default parameters (if parameter "refid" is not specified the analysis takes the homo sapiens species as default):

```
/PATH/TO/ERIC/ericscript.pl -db /PATH/TO/YOUR/DBFOLDER --refid saccharomyces_cerevisiae -name SAMPLENAME -o /PATH/TO/OUTPUT/ YOUR_FASTQ_1 YOUR_FASTQ_2 
```

You can check if your database is up-to-date by the following:

```
/PATH/TO/ERIC/ericscript.pl --checkdb -db /PATH/TO/YOUR/DBFOLDER

```

# OUTPUT FILES

The /PATH/TO/OUTPUT/ folder contains the results of the analysis. Predicted gene fusion products are reported in 2 files:
- `samplename.results.total.csv`: contains all the predicted gene fusions.
- `samplename.results.filtered.csv`: contains the predicted gene fusions with EricScore > 0.50.
