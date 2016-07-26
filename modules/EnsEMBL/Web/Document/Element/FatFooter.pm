=head1 LICENSE

Copyright [1999-2015] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute

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

package EnsEMBL::Web::Document::Element::FatFooter;

### Optional fat footer - site-specific, so see plugins

use strict;

use base qw(EnsEMBL::Web::Document::Element);

sub content {
  my $species_defs = shift->species_defs;
  my $sister_sites = '<p><a href="http://www.ensembl.org">Ensembl</a></p>';
  my $html = '<hr /><div id="fat-footer">';

  $html .= qq(
              <div class="column-four left">
                <h3><a href="http://caenorhabditis.org">caenorhabditis.org</a></h3>
                <p>Our homepage</p>
              </div>
  );


 $html .= qq(
              <div class="column-four left">
                <h3><a href="http://download.caenorhabditis.org/data_overview.html">Data Overview</a></h3>
                <p>See an overview of our progress</p>
              </div>
  );

  $html .= qq(
              <div class="column-four left">
                <h3><a href="http://dhttp://bang.bio.ed.ac.uk:4567/">BLAST</a></h3>
                <p>BLAST sequences against our genomes, transcriptomes and proteomes</p>
              </div>
  );


  $html .= qq(
              <div class="column-four left">
                <h3><a href="http://download.caenorhabditis.org/">Download</a></h3>
                <p>Dowload files related to the CGP</p>
              </div>
  );

  $html .= '</div>';

  return $html;
}

1;
