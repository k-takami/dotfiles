
"psstabilizer.pl" 43 行、1923 バイト
#!/usr/contrib/bin/perl
#/////////////////////////////////////////////////////////////////////
# Tsukaikat:FOR CLONING CHECK   :perl sshexec.pl 1     1        -dev9
#           FOR BATCH JOB       :perl sshexec.pl batch LISTNAME -dev9
#/////////////////////////////////////////////////////////////////////
$nodename = `hostname`; $PROGRAM_NAME= __FILE__;
$perlpath = `which perl`;if($nodename !~ /sup/){ chomp $perlpath; }
$exp = "\"[0-9] $perlpath ".__FILE__."\""; print "\$exp = $exp\n";


################################################if already invoked, suiside.
$cnt = 0;
$tgtps = readpipe "ps -ef|grep $exp";
$cnt =($tgtps =~ s/$PROGRAM_NAME/$PROGRAM_NAME/gc);
        #DEBUG CODE-------------------------------------------------------------------------------
        if(1) {
                $logfile = '/export/home/maint/t/aaa'; open(FILE, ">>$logfile");
                $str= "\$perlpath = $perlpath \$PROGRAM_NAME= $PROGRAM_NAME \$cnt = $cnt \$tgtps = $tgtps \n";
                print FILE "$str"; close (FILE);
                print "\$perlpath = $perlpath\n \$PROGRAM_NAME= $PROGRAM_NAME\ni \$cnt = $cnt \n \$tgtps = $tgtps \n";
        }
        #DEBUG CODE-------------------------------------------------------------------------------
if ($cnt > 1){exit(0)};
$old_ps_MaxVal = 2;

print "\n PROCESS STABILIZER STARTTED--------------------------------------------------\n";
while(){
      $cnt_old_ps = ();

        $TGTPSLIST = '/export/home/maint/t/list_tgtps';
        open (IN, "$TGTPSLIST");
        while (<IN>){
                $pid[0]=();
                $cnt_old_ps = 0;#();
                chomp $_;
                $exp_org = $_; #
                $exp = "\"$_\""; #
                print "\$exp = $exp\n";
                $pattern = "[0-9]:[0-9]+s$exp";
                $tgtps = readpipe "ps -ef|grep $exp";
                #               $tgtps = readpipe "ps -ef|grep $pattern";####################################
                print "\$tgtps = $tgtps \n";
                @tgtpsline =split("root", $tgtps);
                foreach $line (@tgtpsline){
                        print "$line"."\n";
                        @linearg=split(/\s+/, $line);
                        foreach $lineargVal (@linearg){
                                print "$lineargVal"."\n";

          13587 13586  0 20:06:25 pts/8    0:00 sh -c ps -ef|grep "bash"
          13587
13586
0
20:06:25
pts/8
0:00
sh
-c
ps
-ef|grep
"bash"


#                               $lineargXY{i,j}=;





                        }

                }
                #               print @tgtpsline[4];
                exit;

#               $cnt_old_ps =($tgtps =~ s/$tgtps/[0-9]:[0-9]+s$exp/gc);
                $cnt_old_ps =($tgtps =~ s/$tgtps/$exp_org/gc);
                print "\$tgtps = $tgtps \n";#################################################
                $tgtps =~ s/.+[0-9]//g; $tgtps =~ s/.+grep.+//g;
                $tgtps =~ s/\n//g        ; #old $tgtps =~ s/\s//g ;



                print "\$cnt_old_ps= $cnt_old_ps \n";
#dbg            sleep 5;                   #
                print "\$tgtps = $tgtps \n";
#               if ($tgtps ne ''){}else{print"re-invoked $_\n"; system $_;}
                if ($tgtps eq ''){
                        print"re-invoked $exp\n"; system $exp;
                }else{
                        if ($cnt_old_ps > $old_ps_MaxVal){
                                        #while for(0,i ($cnt_old_ps - $old_ps_MaxVal) )loop{}
                                $i=0;
                                $tmp = readpipe "ps|grep $exp";
                                $pid[$i] = substr($tmp,1,6);
                                        #loop end
                                print "\$tmp = $tmp\n";
                                print "\$exp = $exp\n";
                                print "\$pid[$i]=$pid[$i]\n";
#                               system "kill $pid[$i]"; print"KILLED $exp(PID=$pid[$i])\n";
                        }
                }
                print "\n-------------------------------------\n";
        close (IN) ;
}
print "\n PROCESS STABILIZER ENDED--------------------------------------------------\n";
exit(0);

