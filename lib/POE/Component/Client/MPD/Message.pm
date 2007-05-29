#
# This file is part of POE::Component::Client::MPD.
# Copyright (c) 2007 Jerome Quelin, all rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
#

package POE::Component::Client::MPD::Message;

use strict;
use warnings;

use Readonly;

use base qw[ Class::Accessor::Fast Exporter ];
__PACKAGE__->mk_accessors( qw[
    data error request
    _answer _commands _cooking _transform _from _request
    _post _pre_event _pre_from _pre_data
] );


# constants for _answer
Readonly our $SEND    => 0;
Readonly our $DISCARD => 1;
Readonly our $SLEEP1  => 2; # for test purposes

# constants for _cooking
Readonly our $RAW         => 0; # data is to be returned raw
Readonly our $AS_ITEMS    => 1; # data is to be returned as pococm-item
Readonly our $AS_KV       => 2; # data is to be returned as kv (hash)
Readonly our $STRIP_FIRST => 3; # data should have its first field stripped

# constants for _transform
Readonly our $AS_SCALAR => 0; # transform data from list to scalar
Readonly our $AS_STATS  => 1; # transform data from kv to pococm-stats
Readonly our $AS_STATUS => 2; # transform data from kv to pococm-status


our @EXPORT = qw[
    $SEND $DISCARD $SLEEP1
    $RAW $AS_ITEMS $AS_KV $STRIP_FIRST
    $AS_SCALAR $AS_STATS $AS_STATUS
];

#our ($VERSION) = '$Rev: 5645 $' =~ /(\d+)/;

1;

__END__

=head1 NAME

POE::Component::Client::MPD::Message - a message from POCOCM


=head1 SYNOPSIS

    print $msg->data . "\n";


=head1 DESCRIPTION

C<POCOCM::Message> is more a placeholder for a hash ref with some pre-defined
keys.


=head1 PUBLIC METHODS

This module has a C<new()> constructor, which should only be called by
one of the C<POCOCM>'s modules.

The other public methods are the following accessors:

=over 4

=item * data()

The data returned by mpd, as an array reference.


=item * error()

Set if there was some error returned by mpd. Always assured to be C<undef>
if everything went fine.


=back



=head1 SEE ALSO

For all related information (bug reporting, mailing-list, pointers to
MPD and POE, etc.), refer to C<POE::Component::Client::MPD>'s pod,
section C<SEE ALSO>


=head1 AUTHOR

Jerome Quelin, C<< <jquelin at cpan.org> >>


=head1 COPYRIGHT & LICENSE

Copyright (c) 2007 Jerome Quelin, all rights reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut