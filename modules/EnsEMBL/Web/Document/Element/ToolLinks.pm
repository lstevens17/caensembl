=head1 LICENSE

Copyright [2009-2014] EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

package EnsEMBL::Web::Document::Element::ToolLinks;

use strict;
use warnings;

sub links {
  my $self  = shift;
  my $hub   = $self->hub;
  my $sd    = $self->species_defs;
  my @links;

  push @links, 'BLAST',       '<a class="constant" href="http://bang.bio.ed.ac.uk:4567/">BLAST</a>';
  push @links, 'Download',         '<a class="constant" href="http://download.caenorhabditis.org">Download</a>';
  push @links, 'caenorhabditis.org',     '<a class="constant" href="http://caenorhabditis.org">caenorhabditis.org</a>';


  return \@links;
}


1;
