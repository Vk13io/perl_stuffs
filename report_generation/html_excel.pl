#!/usr/bin/perl -w  
#Description:      Script to convert html report to excel sheet 


use Spreadsheet::WriteExcel; # Instantiate the PERL MODULE  
use Spreadsheet::ParseExcel; # Instantiate the PERL MODULE  

open(HTML,$ARGV[0]);


 while (<HTML>)
     {
	  if($_ =~ /class/)
	   {
     	            if(($_ =~ /(Covergroup)/) && ($_ =~ /(\d+\.\d+)/))
   	              {
                       push(@b,$1) ;
    	              }

     	            if(($_ =~ /(Assertion Attempted)/) && ($_ =~ /(\d+\.\d+)/))
   	              {
                       push(@b,$1) ;
    	              }
		      
     	            if(($_ =~ /(Assertion Failures)/) && ($_ =~ /(\d+\.\d+)/))
   	              {
                       push(@b,$1);
    	              }
           }

     }

@coverage = ("Covergroup","Assertion Attempted","Assertion Failures") ;

#Open a new excel file 
 my $book  = Spreadsheet::WriteExcel->new('report.xls');

#Add a new worksheet
 $sheet = $book->add_worksheet();

#Add and define a format for the sheet 
 $format = $book->add_format();
 $format->set_bold();
 $format->set_color('red');
 $format->set_align('center');

  $row = 1;
  $col = 1;
  $i   = 0;
  foreach $b(@b)
    {
     $name = $coverage[$i];
     $sheet->write_string($row,$col,$name,$format);
     $col_next = $col+1;
     $sheet->write($row,$col_next,$b,$format);
     $i++;
     $row++;
     
    }

   $book = "" ; #Make the Object filehandle NULL 

#Read the Excel file 
my $file_excel = "report.xls" ;
my $file_parser = Spreadsheet::ParseExcel->new();
my $workbook    = $file_parser->parse($file_excel);

        die $file_parser->error(), "\n" if ( !defined $workbook);

    for my $worksheet ( $workbook->worksheets()) 
     {
        my ($row_min,$row_max) = $worksheet->row_range();
        my ($col_min,$col_max) = $worksheet->col_range();
         for my $row($row_min .. $row_max)
          {
            for my $col($col_min .. $col_max)
              {
                my $cell = $worksheet->get_cell($row,$col);
                print "Row,Col = ($row,$col) \n ";
                print "Value   = ",$cell->value(), "\n ";
              }
          }
    }
