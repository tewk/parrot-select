#!./parrot
# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/select.t - test the Select PMC


=head1 SYNOPSIS

    % prove t/pmc/select.t

=head1 DESCRIPTION

Tests the Select PMC.

=cut

.sub main :main
.include 'test_more.pir'

    plan(13)
    'test_getfd'()
    'test_update'()
    'test_read'()
    'test_write'()
    'test_select'()
.end


# Select constructor
.sub 'test_getfd'
    $P0 = new ['FileHandle']
    $P0.'open'('README')
    $P1 = new ['Select']
    $I0 = $P1.'getfd'($P0)
    ok($I0, 'new')
.end

.sub 'test_update'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README')
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 5)

    $P3 = new ['FileHandle']
    $P3.'open'('README')
    $P9 = new 'String'
    $P9 = "FH2"
    $P1."update"($P3, $P9, 5)

    $I0 = $P1.'getmaxfd'()
    is($I0, 6, 'maxid = 6')

    $P2 = $P1.'get_data_hash'()
    $I3 = $P2
    is($I3, 2, 'two items in select PMC')

    $I0 = $P1.'getfd'($P0)
    $S0 = $P2[$I0]
    is($S0, "FH1", 'data_hash[x] = FH1')

    $I0 = $P1.'getfd'($P3)
    $S0 = $P2[$I0]
    is($S0, "FH2", 'data_hash[x] = FH2')

    $P1.'remove'($P0)
    $I3 = $P2
    is($I3, 1, 'one item in select PMC')
    $P6 = $P1.'can_read'(1)
#    $S0 = get_repr $P6
#    say $S0
.end

.sub 'test_read'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README')
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 5)

    $P6 = $P1.'can_read'(1)
    $I0 = $P6
    is($I0, 1, 'can_read')

    $P6 = $P1.'can_write'(0)
    $I0 = $P6
    is($I0, 0, 'cant_read')
.end

.sub 'test_write'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README2', "w")
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 2)

    $P6 = $P1.'can_write'(1)
    $I0 = $P6
    is($I0, 1, 'can_write')

    $P6 = $P1.'can_read'(0)
    $I0 = $P6
    is($I0, 0, 'cant_read')
.end

.sub 'test_select'
    $P9 = new 'String'
    $P9 = "FH1"
    $P0 = new ['FileHandle']
    $P0.'open'('README', 'r')
    $P1 = new ['Select']
    $P1."update"($P0, $P9, 5)

    $P9 = new 'String'
    $P9 = "FH2"
    $P0 = new ['FileHandle']
    $P0.'open'('README2', "w")
    $P1."update"($P0, $P9, 6)

    $P6 = $P1.'select'(1)
    $P7 = $P6[0]
    $I0 = $P7
    is($I0, 1, 'can_read')
    $P7 = $P6[1]
    $I0 = $P7
    is($I0, 1, 'can_write')
    $P7 = $P6[2]
    $I0 = $P7
    is($I0, 0, 'no error')
#    $S0 = get_repr $P6
#    say $S0
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
