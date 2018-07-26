#!/bin/bash

dbfolder=$1
ensversion=$2
if [ $ensversion -eq 0 ]; then
   fasta_path="current_fasta/"
else 
   fasta_path="release-"$ensversion"/fasta/"
fi
ftp -vi ftp.ensembl.org >> ~/.ericscript.log 2>&1 <<ftpj
bin
cd pub/
ls -1 $dbfolder/_resources/.ftplist0
cd ${fasta_path}
ls -1R $dbfolder/_resources/.ftplist1
quit
ftpj
