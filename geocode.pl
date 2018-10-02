#!/usr/bin/perl

# geocode.pl
#
# Designed by _flex
# Written  by _flex from FleXoft.
#   (gyorgy@fleischmann.hu)
#
# v1.00, 2018.10.01. Budapest, FleXoft
#   Rls:  first release
#
# Requirements:
# -------------
#
#	sudo cpan i Mozilla::CA
#	sudo cpan i Geo::Coder::Google
#
# Documentation:
# --------------
#
#	Tested on:
#		This is perl 5, version 18, subversion 2 (v5.18.2) built for darwin-thread-multi-2level
#       Geo::Coder::Google	0.19
#		Geo::Coder::Google::V2	0.19
#		Geo::Coder::Google::V3	0.19  
#
# TODO:
# -----
#

use strict;
use warnings;
use utf8;

print "  ______ _______  _____  _______  _____   ______  _______   _____\n";
print " |  ____ |______ |     | |       |     | |     \  |______   |_____] |\n";
print " |_____| |______ |_____| |_____  |_____| |_____/ |______ . |       |_____\n";
print "\n";

use Geo::Coder::Google;
my $geocoder = Geo::Coder::Google->new( apiver => 3, key => "Insert your own API key", sensor => "false" );

open( FH, "<cities.txt" ) || die "Cannot open file: $!";
while ( <FH> ) {
	chomp;
	next if ( /^(\s)*$/ or /^#.*/ );

	my $city = $_;
	my $location = $geocoder->geocode( location => "$city" );

	print '[ "'."$city".'", '.$location->{geometry}{location}{lat}.", ".$location->{geometry}{location}{lng}." ],\n";
}