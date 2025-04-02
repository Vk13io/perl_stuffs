#!/usr/bin/perl
#********************************************************************************************
#Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
#All Rights Reserved.

#This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

#It is not to be shared with or used by any third parties who have not enrolled for our paid training 

#courses or received any written authorization from Maven Silicon.


#Webpage:  www.maven-silicon.com

#Filename:	   address_db.perl   

#Description:      Script to create an address database

#Author Name:      Susmita Nayak

#Version: 1.0
#*********************************************************************************************

print "\n \U Would you like to input any address to the data base \n";
print "\n -------- y-agree n-disagree ---------- \n";

$a = <STDIN>;
chomp($a);

if($a eq 'y')
{
while ($a eq 'y')
{
 &get_info;
 print "\n \U Would you like to input any more address to the data base \n";
 $a = <STDIN>;
 chomp($a); 
}
}

if($a eq 'n')
{
   print "\n \U Would you like to search any address from the data base \n";
   print "\n -------- 'y' - agree 'n' - disagree ---------- \n";
  
   $b = <STDIN>;
   chomp($b);
   
   if($b eq 'y')
   {
   while($b eq 'y') 
     {
      &search_info;
      print "\n \U Would you like to search any more address from the data base \n";
      $b = <STDIN>;
      chomp($b);
     }
   }

   if($b eq 'n')
     {    
      print "\n ********* THANKS FOR YOUR INTEREST *********** \n";
     }
   else
     {
      print "\n --------  Check whether you typed 'y'/'n' --------- \n";
      print "\n --------   'y' - agree 'n' - disagree  -------- \n";
      print "\n\n \U ******** welcome ********* \a \n";
     }
}
else
{
 print "\n --------  Check whether you typed 'y'/'n' --------- \n";
 print "\n --------   'y' - agree 'n' - disagree  -------- \n";
 print "\n\n \U ******** welcome ********* \a \n";
}


sub get_info
{
 print "Please give me the following information \n";
 print "Name : \n";
 $e = <STDIN>;
 chomp($e);
 $e = uc $e;
 print "House no : \n";
 $f = <STDIN>;
 chomp($f);
 print "Street Name : \n";
 $g = <STDIN>;
 chomp($g);
 $g = ucfirst $g;
 print "City Name : \n";
 $h = <STDIN>;
 chomp($h);
 $h = ucfirst $h;
 print "PIN : \n";
 $i = <STDIN>;
 chomp($i);
 print "\U Date of Birth  \n";
 print "Date : \n";
 $k = <STDIN>;
 chomp($k);
 print "Month : \n";
 $l = <STDIN>;
 chomp($l);
 print "Year : \n";
 $m = <STDIN>;
 chomp($m);
 print "Phone No : \n";
 $ph = <STDIN>;
 chomp($ph);
 print "Email ID : \n";
 $email = <STDIN>;
 chomp($email);

 open (ADDFILE, ">>add_file.txt");

 print ADDFILE "\n________________________________________________________________________________\n\n\n";
 print ADDFILE "NAME            : $e \n";
 print ADDFILE "HOUSE No        : $f \n";
 print ADDFILE "STREET          : $g \n";
 print ADDFILE "CITY            : $h \n";
 print ADDFILE "PIN             : $i \n\n\n";
 print ADDFILE "DATE OF BIRTH   : $k - $l - $m \n";
 print ADDFILE "PHONE           : $ph \n";
 print ADDFILE "EMAIL           : $email \n\n";
 print ADDFILE "\n_________________________________________________________________________________\n\n";

 close (ADDFILE);
}

sub search_info
{
 open (ADDFILE, "add_file.txt");
 print "Type the Name of the person \n";
 print "Use lower case letters only \n";
 $n = <STDIN>;
 chomp($n);
 $n = uc $n;
 
 #variable to display the number of matches found
 $match = 0; 
 
 #search line by line to find the string match stored in $n 
 $text = <ADDFILE>;
 while($text)
 {

    if($text =~ /$n/)
      {
       print "\n ********************************\n";
       for($q=0; $q <= 10; $q++)
          {
           print "$text \n";
           $text = <ADDFILE>;
           }
       print "\n ******************************** \n";
       $match++;
      }
    else
      {
       $text = <ADDFILE>;            
      }  
   
 }
 

 if($match != 0 )
   { print "\n \U Number of matching addresses found for $n --- $match \n"; }
 else
   { print "\n \U No matching address found - please try again - THANKS \n"; }

 close(ADDFILE);

}



  
   
 
