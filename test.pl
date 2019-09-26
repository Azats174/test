#!/usr/bin/perl
use strict;
use warnings;
use 5.10.1;
use File::Find;
use File::Temp qw/tempfile/;
use Sys::Syslog;
openlog("test", "ndelay,pid", "local0");
my $newdir ="/tmp/test";
mkdir $newdir, 0755;
syslog("info", "create catalog");
closelog();
my $file;

(undef, $file) = tempfile('/tmp/test/testXXXXXX', OPEN=>1);

say $file;

my @files;
my @dirpath=qw(/tmp/test/);
find(sub {
    push @files,$File::Find::name if (-f $File::Find::name and (-M $_) < 0.1/24);   }, @dirpath);

#print  join "\n",@files;
unlink  @files;
syslog("info", "Delete files");
closelog();
