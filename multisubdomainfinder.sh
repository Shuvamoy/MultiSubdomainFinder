echo "Installing the Requirements first"
sudo apt-get install ruby ; wget https://github.com/busyloop/lolcat/archive/master.zip ; unzip master.zip; cd lolcat-master/bin; gem install lolcat ; echo ""; echo ""; echo ""; echo "";
echo "======================" | lolcat ;echo "Multi Subdomain Finder" | lolcat ; echo "======================" | lolcat; echo "";
echo "Enter the domain name" | lolcat
read dom
echo "" ; echo ""; echo "===============================" | lolcat; echo "Running Subfinder for discovery" | lolcat; echo "===============================" | lolcat; echo "";
subfinder -silent -d $dom | tee -a subD.txt;
echo "" ; echo ""; echo "=================================" | lolcat; echo "Running Assetfinder for discovery" | lolcat; echo "=================================" | lolcat; echo "";
assetfinder $dom | tee -a subD.txt
echo ""; echo ""; echo "================" | lolcat; echo "Running GoBuster" | lolcat; echo "================" | lolcat; echo "";
echo "Enter the full path of your wordlist eg: /home/user/XXX/XXXX.txt"; 
read path 
echo ""; echo "";
gobuster dns --wildcard -q -t 100 -w $path -d $dom -o file.txt ; cat file.txt | sed 's/Found: //g' | tee -a subD.txt ; echo "Total domains found" | lolcat ; echo ""; cat subD.txt | wc -l ;
echo ""; echo ""; echo "Removing the duplicates"; echo ""; cat subD.txt | sort -u | tee -a subF.txt; rm subD.txt; echo "Total Unique domains found" | lolcat; echo ""; cat subF.txt | wc -l ; echo ""; echo ""; echo "Finished";
