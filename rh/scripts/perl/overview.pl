#!/usr/bin/perl
use strict;
use warnings;
use JSON;

my $url = "https://api.robinhood.com/";
my $authHead = "authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IlFyandMVVZOWFVNYjczeXVpbzBKcTZkSjVtc2V1aSIsInVzZXJfaWQiOiJjYTMyZWZiZi1hMzY4LTQ4NzctYjQwYS02YjA4OGUzYTMwN2UiLCJvcHRpb25zIjp0cnVlLCJleHAiOjE1Mzc1Nzc5OTF9.bfmXU-F0WrqrYK4BQm7lotmeeX-GqOKc8xqJZjy6H6oTjO26jq5A_El2SXTR7fs5cgw-1at3YCupUG4joxjibzESbmeiY6ksYYE2vq1nhiAoiiBn9AGrm69mHaBWBrR7eQ7TbDaMN12SKZ3QMc4to16NS3PlIKDCy0fTu2U91xz4wEkocK-SxEw_DITWM8j-UFs8nzmaNY5bRbMT7qHIC95c4qpkLndn0QiYLn1XIc3ghwXNrXKxSxembd8mL6RuRzR263R1S6MvsM6oTTdet1RWehi0KtnHGjE7yp-cqhW1D2f5TvTQYxD9wHDxvc9RqxCMepk5z1vGcER5EewaEg";

my $endpointJson = getRequest($url);
my $obj = decode_json($endpointJson);

$url=$obj->{'positions'};

my $posJson = getRequest($url);

my $posObj = decode_json($posJson);
my $results = $posObj->{'results'};

print getRequest(@$results->[0]->{url});
my $instrument = getRequest(@$results->[0]->{instrument});
my @names;

my %price_of;
foreach my $item(@$results) {
	my $instJson = getRequest($item->{instrument});
	#my $instObj = decode_json($instJson);
	push @names,decode_json($instJson)->{simple_name};
	#print $instObj->{simple_name};
		
}

foreach my $name(@names) {
	print $name."\n";
}





sub getRequest {
	return `sh /opt/rh/getRequest.sh @_[0] "$authHead"`;
}
