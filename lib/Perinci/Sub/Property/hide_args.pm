package Perinci::Sub::Property::hide_args;

use 5.010001;
use strict;
use warnings;

use Perinci::Sub::PropertyUtil qw(declare_property);

# VERSION

declare_property(
    name => 'hide_args',
    type => 'function',
    schema => ['array' => of => 'str*'],
    wrapper => {
        meta => {
            v       => 2,
            prio    => 9, # before args
            convert => 1,
        },
        handler => sub {
            my ($self, %args) = @_;

            my $v    = $args{new} // $args{value};

            delete $self->{_meta}{args}{$_} for @$v;
        },
    },
);

1;
# ABSTRACT: Hide arguments

=head1 SYNOPSIS

 # in function metadata
 hide_args => [qw/arg1 arg2/],


=head1 DESCRIPTION

This property can hide some arguments from function, so they are assumed to not
exist.


=head1 SEE ALSO

L<Perinci>

=cut
